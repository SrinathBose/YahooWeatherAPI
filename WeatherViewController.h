//
//  WeatherViewController.h
//  YahooAPI
//
//  Created by Srinath Bose on 2/2/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherManager.h"

@interface WeatherViewController : UIViewController<WeatherManagerDelegate>

@property (strong,nonatomic) NSString *weatherStr;
@property (strong, nonatomic) IBOutlet UILabel *weatherLbl;

@end
