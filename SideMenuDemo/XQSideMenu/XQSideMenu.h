//
//  XQSideMenu.h
//  XQ
//
//  Created by mac on 14-11-10.
//  Copyright (c) 2014年 XQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XQSideMenu : UIViewController

@property (retain,nonatomic) UIViewController *rootViewController;
@property (retain,nonatomic) UIViewController *leftViewController;
@property (retain,nonatomic) UIViewController *rightViewController;

- (void)showLeft;
- (void)showRight;
- (void)show;
- (void)removeGR;//跳转到二级界面时需要移除平移手势时用到
- (void)addGR;//返回到主界面时需要添加平移手势时需要用到

@property(nonatomic,readonly) UITapGestureRecognizer *tap;
@property(nonatomic,readonly) UIPanGestureRecognizer *pan;

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic)int state;

@end
