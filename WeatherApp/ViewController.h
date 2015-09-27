//
//  ViewController.h
//  WeatherApp
//
//  Created by Gowrie Sammandhamoorthy on 7/17/15.
//  Copyright (c) 2015 Gowrie Sammandhamoorthy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


- (IBAction)zipcodeText:(UITextField *)sender;

@property (weak, nonatomic) IBOutlet UIImageView *currentImage;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *temparatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherConditionLabel;

@property (weak, nonatomic) IBOutlet UILabel *precipitationLabel;

@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UITextField *tempa;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activatorInt;

@end

