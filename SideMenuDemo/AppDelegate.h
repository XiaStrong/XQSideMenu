//
//  AppDelegate.h
//  SideMenuDemo
//
//  Created by mac on 14-11-10.
//  Copyright (c) 2014年 XQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XQSideMenu.h"
#import "MainViewController.h"
#import "RightViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (nonatomic,strong) XQSideMenu *root;
@property (nonatomic,strong) MainViewController *mvc;
@property (nonatomic,strong) RightViewController *rvc;
@property (nonatomic,strong) LeftViewController *lvc;

@end
