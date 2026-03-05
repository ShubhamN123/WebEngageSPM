//
//  WELocationManagerProtocol.h
//  WELocation
//
//  Created by Shubham Naidu on 05/06/24.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LocationManagerProtocol <NSObject>
@optional
- (void)saveToPreferencesTheKey:(NSString *)aKey withValue:(id)aVal shouldOverride:(BOOL)theOverride;
- (void)trackSDKEventWithName:(NSString *)eventName andValue:(NSDictionary *)eventData;
@end

NS_ASSUME_NONNULL_END
