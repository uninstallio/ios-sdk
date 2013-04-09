//
//  NotifyOffer.h
//  Notify
//
//  Created by shahzin ks on 25/09/12.
//  Copyright (c) 2012 Notikum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface NotifyOffer : NSObject{
    
}

-(id)initWithOfferDictionary:(NSDictionary *)offerDict;

-(NSString *)getOfferContent;

-(NSString *)getTitle;

-(NSInteger)getOfferId;

-(NSString *)getURLString;

@end
