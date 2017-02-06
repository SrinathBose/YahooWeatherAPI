//
//  RESTCallForWeather.m
//  YahooAPI
//
//  Created by Srinath Bose on 2/3/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "RESTCallForWeather.h"

@interface RESTCallForWeather ()
{
    //NSMutableArray *weatherReportArr;
}
@end

@implementation RESTCallForWeather

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)getWeatherUsingNSURLSession : (NSURL *)url onCompletion:(void(^)(NSMutableArray *weatherReportArr,  NSError *errorWeather))weatherReportsHandler {
    NSURLSessionDataTask *getWeather = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSMutableArray* weatherReportArr;
        if(!error){
            // Convert data into NSDictionary
            NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            
            //Getting the status code
            if([response isKindOfClass:[NSHTTPURLResponse class]]){
                NSInteger iStatusCode = [(NSHTTPURLResponse *)response statusCode];
                
                //checking the status code
                if(iStatusCode != 200){
                    NSLog(@"\t Status code is %ld \n\n\t Error While Fetching Data ",(long)iStatusCode);
                }
                else{
                    // Obtaining data
                    NSString *sunriseStr = [NSString stringWithFormat:@"%@%@", @"Sunrise  Is ", [jsonObject valueForKeyPath:@"query.results.channel.astronomy.sunrise"]] ;
                    NSString *sunssetStr = [NSString stringWithFormat:@"%@%@", @"Sunset  Is ", [jsonObject valueForKeyPath:@"query.results.channel.astronomy.sunset"]];
                    NSString *humiditystr = [NSString stringWithFormat:@"%@%@", @"Humidity  Is ", [jsonObject valueForKeyPath:@"query.results.channel.atmosphere.humidity"]];
                    NSString *pressureStr = [NSString stringWithFormat:@"%@%@", @"Pressure  Is ", [jsonObject valueForKeyPath:@"query.results.channel.atmosphere.pressure"]];
                    NSString *chillnessStr = [NSString stringWithFormat:@"%@%@", @"Wind Chillness Is ", [jsonObject valueForKeyPath:@"query.results.channel.wind.chill"]];
                    NSString *windDirectionStr = [NSString stringWithFormat:@"%@%@", @"Wind direction Is ", [jsonObject valueForKeyPath:@"query.results.channel.wind.direction"]];
                    NSString *windSpeedStr = [NSString stringWithFormat:@"%@%@", @"Wind speed Is  Is ", [jsonObject valueForKeyPath:@"query.results.channel.wind.speed"]];

                    weatherReportArr = [[NSMutableArray alloc]init];
                    
                    // Adding reports to NSMutableArray
                    [weatherReportArr addObject:sunriseStr];
                    [weatherReportArr addObject:@"\n"];
                    
                    [weatherReportArr addObject:sunssetStr];
                    [weatherReportArr addObject:@"\n"];

                    [weatherReportArr addObject:humiditystr];
                    [weatherReportArr addObject:@"\n"];

                    [weatherReportArr addObject:pressureStr];
                    [weatherReportArr addObject:@"\n"];

                    [weatherReportArr addObject:chillnessStr];
                    [weatherReportArr addObject:@"\n"];

                    [weatherReportArr addObject:windDirectionStr];
                    [weatherReportArr addObject:@"\n"];

                    [weatherReportArr addObject:windSpeedStr];
                    
//                    NSLog(@"\n\nResponse IS %@",response);
//                    NSLog(@"\n\nData Is %@\n\n",data);
//                    NSLog(@"\n\tDictionary  Is %@\n\n",jsonObject);
                    NSLog(@"\n\tWeather Report Is %@",weatherReportArr);
                }
            }
        }
        else
            NSLog(@"Error Is %@",error);
        // Invoke CompletionHandler
        weatherReportsHandler(weatherReportArr,error);
    }];
    [getWeather resume];
}

-(void)URLSession:(NSURLSession *)session task:(nonnull NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error{
    NSLog(@"This message is from delegate... \n\tError While Fetching Data :(");
}
@end
