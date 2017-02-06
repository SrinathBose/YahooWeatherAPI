//
//  PickerManagerViewController.m
//  YahooAPI
//
//  Created by Srinath Bose on 2/2/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "PickerViewController.h"

#define WeatherViewControllerIdentifier "WeatherViewController"

@interface PickerViewController ()
{
    NSArray *pickaerData;
    NSString *selectedCityStr;
    DataProviderPickerViewModel *dataProviderViewModel;
}
@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    dataProviderViewModel = [[DataProviderPickerViewModel alloc]init];
    
    // Setting data source and delegate for PickerViewController
    self.cityPickerView.delegate = dataProviderViewModel;
    self.cityPickerView.dataSource = dataProviderViewModel;
}


- (IBAction)getWeatherBtn:(id)sender {
    //Navigating to WeatherViewController
    WeatherViewController *weatherView = (WeatherViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@WeatherViewControllerIdentifier];
    [weatherView setWeatherStr:selectedCityStr];
    [self.navigationController pushViewController:weatherView animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
