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

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    //Starts Notify Services
    NSLog(@"Going to background");

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    //Stops notify services
    NSLog(@"Starting notiphi services");
    [[NotifyManager sharedManager] startNotifyServicesWithAppID:@"demopro" key:@"PNNe5wL2ANnD6pVUysJk"];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



-(void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    NSLog(@"registerd for push");
    NSLog(@"%@",deviceToken);
    [[NotifyManager sharedManager] registerForPushNotificationUsingDeviceToken:deviceToken];
}
- (void) application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    NSLog(@"Inside timed background fetch \n");
    [[NotifyManager sharedManager] startNotifyServicesWithAppID:@"demopro" key:@"PNNe5wL2ANnD6pVUysJk"];
    completionHandler(UIBackgroundFetchResultNoData);
}
@end
