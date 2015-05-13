//
//  NCViewController.m
//  NotifySample
//
//  Created by shahzin ks on 17/12/12.
//  Copyright (c) 2012 sample. All rights reserved.
//

#import "NCViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <CommonCrypto/CommonHMAC.h>
#import "NotifyManager.h"


@interface NCViewController ()<CLLocationManagerDelegate>

@property (nonatomic)  CLLocationManager *manager;

@end

@implementation NCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view,typically from a nib.
    if (![[[NSUserDefaults standardUserDefaults] valueForKey:@"usersent"] isEqualToString:@"1"])
    {
         [[NotifyManager sharedManager] identify:@"1234" traits:@{ @"name": @"Aravind",@"email": @"aravind@notiphi.com"}];
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"usersent"];
    }
   

}



- (IBAction)enableLocation
{
    [[NotifyManager sharedManager] track:@"locationbuttonclicked"  properties:@{ @"location": @"123",@"A": @"ABC1234"}];
    _manager = [[CLLocationManager alloc] init];
    _manager.delegate = self;
    if ([_manager respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
        [_manager requestWhenInUseAuthorization];
    }
    [_manager startUpdatingLocation];
    
}

-(void) viewDidAppear:(BOOL)animated{
    //CLLocationManager *manager=[[CLLocationManager alloc] init];
    //[manager startUpdatingLocation];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
