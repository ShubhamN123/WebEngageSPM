//
//  WEGLocationManager.h
//  WebEngage
//
//  Created by Saumitra R. Bhave on 10/12/15.
//  Copyright © 2015 Saumitra R. Bhave. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <WELocation/WELocationManagerProtocol.h>

typedef NS_ENUM(NSInteger, WEGLocationAuthStatus){
    WEGLocationAuthStatusNotDetermined = 1,
    WEGLocationAuthStatusDenied = 2,
    WEGLocationAuthStatusInUse = 3,
    WEGLocationAuthStatusAlways = 4
};

#define GEOFENCE_TRANSITION_ENTERED @1
#define GEOFENCE_TRANSITION_EXITED @2

@interface WEGLocationManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic, readonly) BOOL isLocationEnabled;
@property (nonatomic, readonly) BOOL trackLocation;
@property (nonatomic, readonly) WEGLocationAuthStatus wegLocationAuthStatus;
@property (nonatomic, readonly) CLAuthorizationStatus clLocationAuthStatus;
@property (nonatomic, weak) id<LocationManagerProtocol> locationDelegate;
+ (instancetype)sharedInstance;

- (void)refreshLocation;
- (void)setLocationAccuracy:(NSInteger*)accuracy;
- (void)handleAuthStatusUpdate:(CLAuthorizationStatus)status;
- (void)updateUserGeoInfo:(NSNumber *)latitude andLongitude:(NSNumber *)longitude  andTriggerUpdateEvent:(BOOL)updateEvent ;
- (void)disableLocationUpdate;
- (void)configureGeoFencingForRegions:(NSDictionary *)geoFences;
- (void)setLocationDelegate:(id <LocationManagerProtocol>)object;
@end
