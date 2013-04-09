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


@interface NCViewController ()

@end

@implementation NCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
