//
//  ViewController.h
//  WeatherApp
//
//  Created by Gowrie Sammandhamoorthy on 7/17/15.
//  Copyright (c) 2015 Gowrie Sammandhamoorthy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *zipCodeTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *zipcodeLabel;

@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;

@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIView *subView;



- (IBAction)searchButtonPressed:(id)sender;
- (IBAction)exitBarButtonPressed:(id)sender;

@end

