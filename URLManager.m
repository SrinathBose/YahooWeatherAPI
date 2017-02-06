//
//  URLManager.m
//  YahooAPI
//
//  Created by Srinath Bose on 2/3/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "URLManager.h"

#define domainNameStr  "https://query.yahooapis.com/v1/public/yql"
#define queryPart1Str "?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22"
#define queryPart2Str "%2C%20"
#define countryStr "in"
#define queryPart3Str "%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"


@interface URLManager ()
@end

@implementation URLManager

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSURL *) getURL:(NSString *) placeStr
{
    // Generating URL
    NSString *urlStr = [NSString stringWithFormat:@"%@%@%@%@%@%@",@domainNameStr,@queryPart1Str,placeStr,@queryPart2Str,@countryStr,@queryPart3Str];
    NSURL *url = [NSURL URLWithString:urlStr];
    return url;
    
}
@end
