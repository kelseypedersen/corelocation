//
//  ViewController.m
//  CoreLocation
//
//  Created by Kelsey Pedersen on 8/12/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

// Include <> to call CLLocationManagerDelegate methods on the core location object

@interface ViewController () <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *latitude;
@property (weak, nonatomic) IBOutlet UILabel *longitude;
@property (weak, nonatomic) IBOutlet UILabel *address;


- (IBAction)buttonPressed:(id)sender;


@end

@implementation ViewController

// Instance variables so need to initialize in viewDidLoad
CLLocationManager *manager;
CLGeocoder *geocoder;
CLPlacemark *placemark;




- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSLog(@"view did load");
    
    manager = [[CLLocationManager alloc]init];
    
    geocoder = [[CLGeocoder alloc]init];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    
    NSLog(@"button pressed");
    
    // we're setting the viewController as the location manager delegate
    // can call this method from the <> at the @interface
    
    manager.delegate = self;
    manager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [manager startUpdatingLocation];
    
}


#pragma mark CLLocationManagerDelegate Methods

// Called if location manager cannot get a location

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Error: %@", error);
    
    NSLog(@"Failed to get location");
}


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    NSLog(@"Location: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil){
        self.latitude.text = [NSString stringWithFormat:@"%f", currentLocation.coordinate.latitude];
        self.longitude.text = [NSString stringWithFormat:@"%f", currentLocation.coordinate.longitude];
        NSLog(@"printing current location");
        NSLog(@"%@", currentLocation);

    }
    
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error)
    {
        if (error == nil && [placemarks count] > 0){
            placemark = [placemarks lastObject];
            
            self.address.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@", placemark.subThoroughfare, placemark.thoroughfare, placemark.postalCode, placemark.locality, placemark.administrativeArea, placemark.country];
        } else {
            
            NSLog(@"%@", error.debugDescription);
            
            
            
        }
        
    }];
    
    
    
}



@end
