//
//  NotifyServiceManager.h
//  Notify
//
//  Created by shahzin ks on 21/09/12.
//  Copyright (c) 2012 Notikum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <dispatch/dispatch.h>
#import <CoreLocation/CoreLocation.h>

#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>

/*
 * Notify service manager is responsible for handling all the Notify http and web requests
 */

@interface NotifyServiceManager : NSObject{
    
}

+(NotifyServiceManager *)sharedManagerWithSecret:(NSString *)secret;

//-(void) syncCluster;

-(void) syncClusterForLocationCoordinate:(CLLocationCoordinate2D)locationCoordinate completion:(void(^)(NSString *responseString))completion failed:(void(^)(NSError *error))failed;

-(void) notifyClusterEnter:(CLRegion *)region completion:(void(^)(NSString *responseString))completion failed:(void(^)(NSError *error))failed;

-(void) notifyClusterExit:(CLRegion *)region completion:(void(^)(NSString *responseString))completion failed:(void(^)(NSError *error))failed;

-(void) notifyUserDidClickedNotificationWithOfferID:(NSString *)offerID completion:(void(^)(NSString *responseString))completion failed:(void(^)(NSError *error))failed;

-(void) registerAppWithAppID:(NSString *)appID enroll:(BOOL)enrolled onCompletion:(void(^)(NSString *responseString))completion failed:(void(^)(NSError *error))failed;

-(void) cancelAllOperations;

-(void) setOperationCancelledStatus:(BOOL)cancelStatus;

-(void) registerForPushNotificationWithDeviceToken:(NSString *)deviceTokenStr completion:(void(^)(NSString *rsponseString))completion failed:(void(^)(NSError *erro))failed;

-(void) getPromoForNotificationID:(NSString *)notificationID completion:(void(^)(NSString *responseString))completion failed:(void(^)(NSError *error))failed;

-(void) sendEventsWithJson:(NSString *)eventJsonStr completion:(void(^)(NSString *rsponseString))completion failed:(void(^)(NSError *erro))failed;

-(NSString *)getUUID;

@end
