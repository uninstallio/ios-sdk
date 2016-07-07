//
//  NotifyManager.h
//  Notify
//
//  Created by shahzin ks on 21/09/12.
//  Copyright (c) 2012 Notikum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

/*
 * Notify Manager is the singleton object responsible for handling notify operations and events
 */

@interface UninstallManager : NSObject<CLLocationManagerDelegate,UIAlertViewDelegate>{

}

+(UninstallManager *)sharedManager;

-(void) startNotifyServicesWithAppID:(NSString *)appID key:(NSString *)key;

-(void) stopNotifyServices;

-(void) processLocalNotification:(UILocalNotification *)localNotification;

-(void) processRemoteNotification:(NSDictionary *)userInfo;

-(void) processLaunchOptions:(NSDictionary *)launchOptions;

-(BOOL) isLocalNotificationFromNotify:(UILocalNotification *)localNotification;

-(BOOL) isRemoteNotificationFromNotify:(NSDictionary *)userInfo;

-(BOOL) isAppLaunchedByNotifyService:(NSDictionary *)launchOptions;

-(void) registerForPushNotificationUsingDeviceToken:(NSData *)deviceToken;

-(void) sendEventsWithJSONString:(NSString *)jsonString;

-(void) takeEventsArrayOnFocusLose:(NSArray *)arrayOfJsons;

-(void) sendEventsOnFocusLose;

-(void) setEvents:(NSArray *)eventsArray;

-(void) isUpgrade:(BOOL)upgraded;

-(void) flush;

-(void) didLoseFocus;

-(void) identify:(NSString *)userId traits:(NSDictionary *)traits;

-(void) track:(NSString *)event properties:(NSDictionary *)properties;

@end
