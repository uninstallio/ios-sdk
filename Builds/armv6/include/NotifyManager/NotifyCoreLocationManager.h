//
//  NotifyCoreLocationManager.h
//  Notify
//
//  Created by shahzin ks on 21/09/12.
//  Copyright (c) 2012 Notikum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


/*
 * Notify Core location manager is responsible for managing continous location update
 */

@interface NotifyCoreLocationManager : NSObject<CLLocationManagerDelegate>{
    
}

-(void)startCoreLocationUpdate;
-(void)stopCoreLocationUpdate;
-(CLLocation *)getCurrentLocation;

@end
