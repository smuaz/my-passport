//
//  AppDelegate.h
//  Fastport
//
//  Created by Syed Muaz on 11/23/14.
//  Copyright (c) 2014 team41. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIImage* imageToProcess;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navController;
@property (strong, nonatomic) ViewController *viewController;

@end
