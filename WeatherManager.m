//
//  WeatherManager.m
//  YahooAPI
//
//  Created by Srinath Bose on 2/2/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "WeatherManager.h"

@interface WeatherManager ()
{
    NSArray *weatherReportArr;
    NSError *errorOnWeather;
}
@end

@implementation WeatherManager

-(void)getWeather:(NSString *) placeStr
{
#warning TODO: Try NSUrlConnection, sync and async
    // URLManager class to provides URL for a given input place
    URLManager *urlManager = [[URLManager alloc]init];
    NSURL *url = [urlManager getURL:placeStr];
    
    
    //RESTCallForWeather for invoke a REST call and get weather from URL
    RESTCallForWeather *restCall = [[RESTCallForWeather alloc]init];
    WeatherManager* __weak weakSelf = self;
    //getWeatherUsingNSURLSession method to get weather with completion handler
    [restCall getWeatherUsingNSURLSession:url onCompletion:^(NSArray *weatherReport, NSError *errorWeather){
        weatherReportArr = weatherReport;
        errorOnWeather = errorWeather;
        
        // Invoke a weather delegate
        [weakSelf.weathearDelegate isWeatherGot:self didFinishedFetching:weatherReportArr onError:errorWeather];
    }];
    
}
@end
