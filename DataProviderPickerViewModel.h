//
//  DataProviderForPickerView.h
//  YahooAPI
//
//  Created by Srinath Bose on 2/3/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerViewController.h"

@interface DataProviderPickerViewModel : NSObject<UIPickerViewDelegate,UIPickerViewDataSource>
-(NSArray *)getData;
@end
