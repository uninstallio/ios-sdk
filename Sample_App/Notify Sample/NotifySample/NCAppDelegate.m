//
//  NCAppDelegate.m
//  NotifySample
//
//  Created by shahzin ks on 17/12/12.
//  Copyright (c) 2012 sample. All rights reserved.
//

#import "NCAppDelegate.h"

#import "NCViewController.h"
#import "NotifyManager.h"
#import <CoreLocation/CoreLocation.h>

@implementation NCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[NCViewController alloc] initWithNibName:@"NCViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    
    //Check if the app was waken up by notify services
    [[NotifyManager sharedManager] processLaunchOptions:launchOptions];
    [[NotifyManager sharedManager] startNotifyServicesWithAppID:@"demopro" key:@"PNNe5wL2ANnD6pVUysJk"];

    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert |
      UIRemoteNotificationTypeBadge |
      UIRemoteNotificationTypeSound)];

    return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    //Stops notify services
    //NSLog(@"Starting notiphi services");
    [[NotifyManager sharedManager] startNotifyServicesWithAppID:@"demopro" key:@"PNNe5wL2ANnD6pVUysJk"];
}


-(void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    //NSLog(@"Registerd for push with device token: %@", deviceToken);
    [[NotifyManager sharedManager] registerForPushNotificationUsingDeviceToken:deviceToken];
}

- (void) application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    [[NotifyManager sharedManager] startNotifyServicesWithAppID:@"demopro" key:@"PNNe5wL2ANnD6pVUysJk"];
    completionHandler(UIBackgroundFetchResultNoData);
}
@end
