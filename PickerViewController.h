//
//  PickerManagerViewController.h
//  YahooAPI
//
//  Created by Srinath Bose on 2/2/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherViewController.h"
#import "DataProviderPickerViewModel.h"
@interface PickerViewController : UIViewController

- (IBAction)getWeatherBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIPickerView *cityPickerView;

@end
