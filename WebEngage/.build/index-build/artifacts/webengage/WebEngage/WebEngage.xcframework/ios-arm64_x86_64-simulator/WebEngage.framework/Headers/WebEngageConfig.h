//
//  WebEngageConfig.h
//  WebEngage
//
//  Created by Shubham Naidu on 13/02/26.
//  Copyright © 2026 Saumitra R. Bhave. All rights reserved.
//

#ifndef WebEngageConfig_h
#define WebEngageConfig_h

#import <Foundation/Foundation.h>
#import "WEGInAppNotificationProtocol.h"
#import "WEGAnalytics.h"

typedef NS_ENUM(NSInteger, WEGEnvironment) {
    WEGEnvironmentNone = 0,
    WEGEnvironmentUS,
    WEGEnvironmentIN,
    WEGEnvironmentKSA
};

@interface WebEngageConfig : NSObject

@property (nonatomic, copy, readonly) NSString *licenseCode;
@property (nonatomic, assign, readonly) BOOL debugMode;
@property (nonatomic, weak, readonly) id<WEGInAppNotificationProtocol> notificationDelegate;
@property (nonatomic, assign, readonly) BOOL apnRegister;
@property (nonatomic, assign, readonly) ReportingStrategy reportingStrategy;
@property (nonatomic, assign, readonly) WEGEnvironment environment;
@property (nonatomic, copy, readonly) NSString *environmentString;

+ (instancetype)builder;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)setLicenseCode:(NSString *)licenseCode;
- (instancetype)setDebugMode:(BOOL)debugMode;
- (instancetype)setNotificationDelegate:(id<WEGInAppNotificationProtocol>)notificationDelegate;
- (instancetype)setApnRegister:(BOOL)apnRegister;
- (instancetype)setReportingStrategy:(ReportingStrategy)reportingStrategy;
- (instancetype)setEnvironment:(WEGEnvironment)environment;

- (WebEngageConfig *)build;

@end

#endif
