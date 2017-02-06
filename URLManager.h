//
//  URLManager.h
//  YahooAPI
//
//  Created by Srinath Bose on 2/3/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface URLManager : UIViewController
-(NSURL *) getURL:(NSString *) placeStr;
@end
