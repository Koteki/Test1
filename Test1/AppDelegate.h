//
//  AppDelegate.h
//  Test1
//
//  Created by Temp Admin on 04/09/15.
//  Copyright (c) 2015 Temp Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedTableController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate, UINavigationControllerDelegate>
{
    UIWindow *window;
    FeedTableController *feedTableController;
    UINavigationController *navigationViewController;
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) FeedTableController *feedTableController;
@property (nonatomic, retain) UINavigationController *navigationViewController;
@end

