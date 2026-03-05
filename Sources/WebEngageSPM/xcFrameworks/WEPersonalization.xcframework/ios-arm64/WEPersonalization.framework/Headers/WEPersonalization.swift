//
//  WEPersonalization.swift
//  PersonalizationSDK
//
//  Created by Unmesh Rathod on 15/06/21.
//

import UIKit
import WebEngage
import os

@objcMembers
public class WEPersonalization: NSObject, InLineNotificationsProtocol {
    
    public static var shared: WEPersonalization = WEPersonalization()
    public let operationQueue = OperationQueue()
    let compeletionDispatchGroup = DispatchGroup()
    
    var systemData:[String:Any]? = nil
    var maxInlineCount: Int = 5
    
    // Debug variables
    var countCheck = 0
    var processingProperties:Bool{
        return (countCheck != 0)
    }
    var propertyRegistryCallbacks:PropertyRegistryCallback? = nil
    
    //MARK: - Initializers
    public func initialise(){}
    
    private override init() {
        super.init()
        self.setVersionOfPersonalization()
        WELogger.initLogger()
        WebEngage.sharedInstance().setInLineDelegates(self)
    }
    
    //method to set the version of the personalization
    
    func setVersionOfPersonalization() {
        // Get the bundle for the "com.webengage.WEPersonalization" identifier
        guard let personalizationBundle = Bundle(identifier: "com.webengage.WEPersonalization") else {
            print("Personalization bundle not found.")
            return
        }
        
        // Fetch the value for the key "WEGPersonalizationSDKVersion" from the Info.plist of the specified bundle
        guard let version = personalizationBundle.object(forInfoDictionaryKey: "WEGPersonalizationSDKVersion") as? String else {
            print("WEGPersonalizationSDKVersion not available or invalid.")
            return
        }
        let key : WegVersionKey = .PE
        WebEngage.sharedInstance().setVersionForChildSDK(version, for: key)
    }
    
    //MARK: - Delegates from Core SDK
    
    public func propertiesReceived(_ inLineProperties:  [AnyHashable : Any]) {
        // Already processing properties so cancell all previous operations first
        if self.processingProperties == true{
            WELogger.d("WEPT : Cancel all existing operations and restart")
            self.operationQueue.cancelAllOperations()
            //            shouldProcessExecution = true
        }
        
        // Store system data & max inLine Count globally using for all n/w calls
        systemData = inLineProperties["systemData"] as? [String:Any]
        maxInlineCount = inLineProperties["inLineMaxCount"] as! Int
        
        // this is used when we start operation for load of inineview
        // load of inlineview should not start any operation if properties are processing from page navigated
        WEPropertyRegistry.shared.setPageNavigationRefreshStarted(value: true)
        
        /* Now this has been replaced by Dispacth Group
         // This is the last completion operation which will set page refreshing variable value
         // we can consider this as a call back stating this operation queue has completed all the operations
         let completionOperation = BlockOperation {
         // This block will be executed when all operations are finished
         WELogger.d("WEPT : Property Refresh from screen navigated has been completed")
         WEPropertyRegistry.shared.setPageNavigationRefreshStarted(value: false)
         }
         */
        
        if let properties = inLineProperties["properties"] as? [JSON]{
            let printingData = properties.map { property -> String in
                let targetView = property["targetView"] as? String ?? ""
                
                // Safely access nested "qualifiedCampaigns" dictionary
                let pIdToShow = property["p_id"] as? String ?? ""
                let qualifiedCampaigns = property["qualifiedCampaigns"] as? [String: Any]
                let notificationEncId = qualifiedCampaigns?["notificationEncId"] as? String ?? ""
                let variationIdToShow = qualifiedCampaigns?["variationIdToShow"] as? String ?? ""
                
                
                return "PID : \(pIdToShow) | TID : \(targetView) | CID : \(notificationEncId) | VID : \(variationIdToShow)"
            }
            WELogger.d("WEP: Properties Received | %@",printingData)
            
            //Clearing old stored propertydetails and updating to latest for event based campaign
            WEPropertyRegistry.shared.clearStoredPropertyDetails();
            var propertiesProcessedList:[Int] = [];
            
            for property in properties{
                if let targeviewIdString = property["targetView"] as? String,
                   let targetViewId = Int(targeviewIdString){
                    // process the normal campaigns only if the current count is less than the max allowed count
                    if (propertiesProcessedList.count < maxInlineCount){
                        let details = WEPropertyData(dictionary: property)
                        
                        // for event based if 2 camppaign are qualified for same target view then processedPropertiesCount will get reduced
                        // to avoid that below condition is applied
                        if details.variationIdToShow != WEPersonalization.Constants.CONTROL_GROUP && propertiesProcessedList.contains(targetViewId){
                           continue
                        }
                        
                        // store property Details in Property Registry
                        WEPropertyRegistry.shared.storePropertyDetails(forTag: targetViewId,
                                                                       details: details)
                        
                        // Create propertyProcessor operation and start
                        let ppOperation = WEPropertyProcessor(propertyDetails: details)
                        //                        completionOperation.addDependency(ppOperation)
                        operationQueue.addOperation(ppOperation)
                        
                        if details.variationIdToShow != WEPersonalization.Constants.CONTROL_GROUP {
                            propertiesProcessedList.append(targetViewId)
                
                        }
                    }else{
                       break
                    }
                }else{
                    WELogger.d("WEP: target view id is invalid")
                }
            }
        }
        
        
        // adding completion operation to operation queue
        //        operationQueue.addOperation(completionOperation)
        
        
        // Notify when all operations are done
        compeletionDispatchGroup.notify(queue: .main) {
            WELogger.logProperty(message: "All operations completed =============", pDetails: nil)
            WEPropertyRegistry.shared.setPageNavigationRefreshStarted(value: false)
        }
        
        
    }
    
    public func screenNavigated(to screenDetails: [AnyHashable : Any]) {
        // Screen navigated callback
        // remove all cache
        // removing check for hybrid : hybrid is dependant on callbacks
        //        if self.processingProperties == false{
        WEPropertyRegistry.shared.clearCache(for: screenDetails)
        //        }
    }
    
    public func registerPropertyRegistryCallbacks(_ callback:PropertyRegistryCallback){
        self.propertyRegistryCallbacks = callback
    }
    
    //MARK: -  Helper functions for callbacks
    // this is written over here to keep consistancy between android and ios
    // android is already production live
    
    public func registerWECampaignCallback(_ callback:WECampaignCallback){
        WECallbackManager.shared.registerCampaignCallback(callback)
    }
    
    public func registerWEPlaceholderCallback(_ targetViewId:Int,_ callback:WEPlaceholderCallback){
        WECallbackManager.shared.registerPlaceHolderCallback(tag: targetViewId, callback: callback)
    }
    
    public func unregisterWECampaignCallback(_ callback:WECampaignCallback){
        WECallbackManager.shared.deregisterCampaignCallback(callback)
    }
    
    public func unregisterWEPlaceholderCallback(_ targetViewId:Int){
        WECallbackManager.shared.deregisterPlaceholderCallback(tag: targetViewId)
    }
    
    //MARK: - Click helpers
    @objc internal func campaignButtonTapped(sender: WEButton) {
        WELogger.d("WEP: campaign button tapped")
        
        if let contentView = getWEPersonalizationViewInSuperviews(view: sender){
            if let campaignData = contentView.campaignData{
                
                let actionsDetails = sender.getActionProperties()
                self.passCallback(campaignData: campaignData, sender: sender, actionDetails: actionsDetails)
            }
        }
    }
    
    func redirectToUrlIfRequired(actionsDetails:(String?, String?)){
        if let urlStr = actionsDetails.0{
            guard let url = URL(string: urlStr) else {
                return //be safe
            }
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @objc internal func campaignViewTapped(sender: Any) {
        WELogger.d("WEP: campaign view tapped")
        if let contentView = getWEPersonalizationViewInSuperviews(view: (sender as! UIView)),
           let campaignData = contentView.campaignData{
            if let view = sender as? WEView{
                WELogger.d("Click: View \(campaignData.campaignId ?? "")")
                let actionDetails = view.getActionProperties()
                passCallback(campaignData: campaignData, sender: sender, actionDetails: actionDetails)
            } else if let imageView = sender as? WEImageView{
                WELogger.d("Click: Image \(campaignData.campaignId ?? "")")
                let actionDetails = imageView.getActionProperties()
                passCallback(campaignData: campaignData, sender: sender, actionDetails: actionDetails)
            }else if let label = sender as? WELabel{
                WELogger.d("Click: Label \(campaignData.campaignId ?? "")")
                let actionDetails = label.getActionProperties()
                passCallback(campaignData: campaignData, sender: sender, actionDetails: actionDetails)
            }
        }
    }
    
    func passCallback(campaignData:WECampaignData,sender:Any,actionDetails:(actionUrl: String, cta: String)){
        campaignData.trackClick(actionDetails: actionDetails,attributes: nil)
        if campaignData.campaignId != nil{
            let callbacks = WECallbackManager.shared.getGlobalCampaignCallbacks()
            callbacks.forEach { callback in
                let shouldRedirect = callback.onCampaignClicked?(actionId: actionDetails.cta,
                                                                 deepLink: actionDetails.actionUrl,
                                                                 data: campaignData)
                if shouldRedirect == false{
                    self.redirectToUrlIfRequired(actionsDetails: actionDetails)
                }
            }
            if callbacks.count == 0{
                self.redirectToUrlIfRequired(actionsDetails: actionDetails)
            }
        }
    }
    
    public func clearUIinPrepareForReuse(view:UIView){
        DispatchQueue.main.async {
            if let webEngageView = getWEPersonalizationViewInSubviews(view: view){
                webEngageView.removeFromSuperview()
                WELogger.d("WEPI: removing existing view \(view.tag)")
            }else{
                //            Logger.d("WEPI: Existing view not found to remove \(view.tag)")
            }
        }
    }
    
    public func trackCGEvent(forPropertyId id: Int) {
        WEPropertyRegistry.shared.trackQualifiedCGEvent(forPropertyId: id)
    }
    
    public func registerCampaignControlGroupCallback(tag:Int, callback : WECampaignControlInternalCallback){
        WEPropertyRegistry.shared.registerCampaignControlGroupCallback(tag: tag, callback: callback)
    }
    
    public func deRegisterCampaignControlGroupCallback(tag:Int){
        WEPropertyRegistry.shared.deRegisterCampaignControlGroupCallback(tag: tag)
    }
    
    
    //MARK: - Dispatch Group Helpers
    
    func enterInsideCompletionGroup(){
        compeletionDispatchGroup.enter()
    }
    func exitFromCompletionGroup(){
        compeletionDispatchGroup.leave()
    }
    
}
