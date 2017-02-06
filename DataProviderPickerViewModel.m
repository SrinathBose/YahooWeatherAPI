//
//  DataProviderForPickerView.m
//  YahooAPI
//
//  Created by Srinath Bose on 2/3/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "DataProviderPickerViewModel.h"
#define cityNamePListIdentifier "CityNamePList"
#define keyIdentifier "Cities"

@interface DataProviderPickerViewModel ()
{
    NSArray *citiesArr;
    NSString *selectedCityStr;
}
@end

@implementation DataProviderPickerViewModel


- (id)init
{
    if(self = [super init])
    {
        [self getData];
    }
    return self;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return citiesArr.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return citiesArr[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    selectedCityStr= [citiesArr objectAtIndex:row];
}

-(NSArray *)getData{
    // Retriving data from PList
    NSDictionary *citiesDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@cityNamePListIdentifier ofType:@"plist"]];
    citiesArr = [citiesDict objectForKey:@keyIdentifier]; 
                    
    return citiesArr;
}


@end
