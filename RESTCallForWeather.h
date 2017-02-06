//
//  RESTCallForWeather.h
//  YahooAPI
//
//  Created by Srinath Bose on 2/3/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RESTCallForWeather : UIViewController
-(void)getWeatherUsingNSURLSession : (NSURL *)url onCompletion:(void(^)(NSMutableArray *weatherReport,NSError *errorWeather))weatherReportsHandler;
@end
