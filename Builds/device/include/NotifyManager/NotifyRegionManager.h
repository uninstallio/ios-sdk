//
//  NotifyRegionManager.h
//  Notify
//
//  Created by shahzin ks on 21/09/12.
//  Copyright (c) 2012 Notikum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
/*
 * Notify region manager is responsible for registering and deregistering the regions for boundary tracking
 */

@interface NotifyRegionManager : NSObject<CLLocationManagerDelegate>{
    
}

-(void)registerRegionsFromResponseDictionary:(NSDictionary *)regionsDictionary;

-(void) startRegionsTracking;

-(void) stopRegionsTracking;

-(id) initWithDelegate:(id)delegate secret:(NSString *)secret;

@end
