//
//  WeatherViewController.m
//  YahooAPI
//
//  Created by Srinath Bose on 2/2/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "WeatherViewController.h"

@interface WeatherViewController ()
{
    NSArray *updainedWeatherArr;
    NSError *errorReport;
}
@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Get weather with the help of WeatherManager Calss
    
    WeatherManager *weatherManager = [[WeatherManager alloc]init];
    weatherManager.weathearDelegate = self; // Setting up a delegate to a WeatherManagare class
   
    [weatherManager getWeather:self.weatherStr];
    
    
}
// Weather Delegate Mathod
-(void)isWeatherGot:(WeatherManager *)weatherManager didFinishedFetching:(NSArray *)weatherReport onError:(NSError *) error{
    updainedWeatherArr = weatherReport;
    errorReport = error;
    if(error){
        _weatherLbl.text = [errorReport description];
        NSLog(@"isWeatherGot error %@",errorReport);
    }
}

-(void) viewDidAppear:(BOOL)animated{
    self.weatherLbl.text = @"Test";
    NSString * resultStr = [updainedWeatherArr componentsJoinedByString:@""];
    NSLog(@" Result Is %@",resultStr);
    
    if(resultStr)
        _weatherLbl.text = resultStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
