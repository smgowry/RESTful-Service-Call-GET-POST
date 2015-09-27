//
//  ViewController.m
//  WeatherApp
//
//  Created by Gowrie Sammandhamoorthy on 7/17/15.
//  Copyright (c) 2015 Gowrie Sammandhamoorthy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)zipcodeText:(UITextField *)sender;{
    [_activatorInt startAnimating];
    
   // NSLog(@"%@",sender.text);
NSString*urlstring=[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?zip=%@,us",sender.text];

NSURL*url=[NSURL URLWithString:urlstring];
    
NSURLRequest*requesturl =[NSURLRequest requestWithURL:url];
[NSURLConnection sendAsynchronousRequest:requesturl queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse*response, NSData*data, NSError*connectionError){
        if(data){
NSDictionary*respo=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
 
self.cityNameLabel.text=respo[@"name"];
         
//To get sub dictionary value
    
           NSString*temparatureString=respo[@"main"][@"temp"];
//To get float value in label
            self.temparatureLabel.text=[NSString stringWithFormat:@"%f",temparatureString.floatValue];
            NSString*humidityString=respo[@"main"][@"humidity"];
//To get long integer value in label
            self.humidityLabel.text=[NSString stringWithFormat:@"%lo",humidityString.integerValue];
            
//Toget weather condition. data is an Array
        
            NSArray*weatherArray=respo[@"weather"][0][@"main"];
            NSArray*weatherConditionArray=respo[@"weather"][0][@"description"];
            self.weatherConditionLabel.text=[NSString stringWithFormat:@"%@",weatherConditionArray];
            self.precipitationLabel.text=[NSString stringWithFormat:@"%@",weatherArray];
 
           self.currentImage.image =[UIImage imageNamed:@"sunny.jpeg"]; 
            
            
  /*          for
                (self.weatherConditionLabel.text=@"sunny");
                 {
                self.currentImage.image =[UIImage imageNamed:@"rain.jpeg"];
                 }
    
else if (respo[@"weather"][0])[@"description"]="sky is clear" ) {
                self.currentImage.image =[UIImage imageNamed:@"sunny.jpeg"];
            }
            
else   {
    self.currentImage.image =[UIImage imageNamed:@"allweather.jpeg"];
}
   */
            
           [_activatorInt stopAnimating];
            
      
        }
    }];
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
