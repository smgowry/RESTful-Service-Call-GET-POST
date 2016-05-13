//
//  ViewController.m
//  WeatherApp
//
//  Created by Gowrie Sammandhamoorthy on 7/17/15.
//  Copyright (c) 2015 Gowrie Sammandhamoorthy. All rights reserved.
//

#import "GSViewController.h"

@interface GSViewController ()<NSURLSessionDelegate>
@end

@implementation GSViewController{
    NSDictionary* jsonDic;
}

@synthesize zipCodeTextField, activityIndicator, zipcodeLabel, cityLabel, stateLabel, latitudeLabel, longitudeLabel, backgroundImageView, subView;

- (void)viewDidLoad {
    [super viewDidLoad];
    subView.hidden = YES;
    jsonDic = [NSDictionary new];
    activityIndicator.hidden = YES;
}

#pragma mark - GET request.
-(void)serviceCallGET{
    
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.zipcodeapi.com/rest/i3EpdrmVp9bwcXfEQyLNDLdD7T90VsbdvQDIi0EHaQdmNt0D2MrFxEjFytGtVSHq/info.json/%@/degrees",zipCodeTextField.text]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *responseData, NSURLResponse *response, NSError *error) {
     
                        dispatch_async(dispatch_get_main_queue(),^{
                            NSError * error;
                            jsonDic = [NSJSONSerialization JSONObjectWithData:responseData options: NSJSONReadingMutableContainers error: &error];
                                    [self updatingLabels];
                        });
                                  }];
 
    
    [task resume];
    
    [activityIndicator stopAnimating];
    activityIndicator.hidden = YES;
    
}

/*

#pragma mark - POST.

-(void)sendHTTPPost{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultConfigObject delegate:self delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"http://Your url here"]];
    
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    //The parameters to post.
    NSString* firstName = @"Gowrie";
    NSString* lastName = @"Sammandhamoorthy";
    NSString* params = [[NSString alloc] initWithFormat:@"firstname=%@&lastname=%@",firstName, lastName];
    
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData* data, NSURLResponse *response, NSError *error){
        NSLog(@"%@",response);
    }];
    
    [dataTask resume];
    
}

*/


-(void)updatingLabels{
    cityLabel.text = jsonDic[@"city"];
    zipcodeLabel.text = [NSString stringWithFormat:@"Zip Code: %@",jsonDic[@"zip_code"]];
    stateLabel.text = jsonDic[@"state"];
    latitudeLabel.text =[NSString stringWithFormat:@"%@",jsonDic[@"lat"]];
    longitudeLabel.text =[NSString stringWithFormat:@"%@", jsonDic[@"lng"]];
  
    subView.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)exitBarButtonPressed:(id)sender {
    exit(0);
}


- (IBAction)searchButtonPressed:(id)sender {
    [zipCodeTextField resignFirstResponder];
    activityIndicator.hidden = NO;
    [activityIndicator startAnimating];
    [self serviceCallGET];
    
}
@end
