//
//  WeatherManager.h
//  YahooAPI
//
//  Created by Srinath Bose on 2/2/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URLManager.h"
#import "RESTCallForWeather.h"

@class WeatherManager;

@protocol WeatherManagerDelegate <NSObject>
//Delegate Method to wait for weather Report

-(void) isWeatherGot : (WeatherManager *) weatherManager didFinishedFetching:(NSArray *) weatherReport onError:(NSError *) error;
@end

@interface WeatherManager : NSObject <NSURLSessionDelegate,NSURLSessionDataDelegate,NSURLSessionTaskDelegate>

-(void)getWeather:(NSString *) placeStr;
@property (nonatomic , weak) id<WeatherManagerDelegate> weathearDelegate; // Delegate
@end
