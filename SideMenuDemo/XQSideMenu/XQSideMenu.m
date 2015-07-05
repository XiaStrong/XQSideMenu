//
//  XQSideMenu.m
//  XQ
//
//  Created by mac on 14-11-10.
//  Copyright (c) 2014年 XQ. All rights reserved.
//

#import "XQSideMenu.h"

@interface XQSideMenu ()
{
    float ScreenWidth;
    float ScreenHeight;
    UITapGestureRecognizer *tgr;
    UIPanGestureRecognizer *pgr;
}
@end

@implementation XQSideMenu

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    ScreenHeight=[UIScreen mainScreen].bounds.size.height;
    ScreenWidth=[UIScreen mainScreen].bounds.size.width;
    
    
    _state=1;
    
    [self addChildViewController:self.leftViewController];
    [self.view addSubview:self.leftViewController.view];
    
    [self addChildViewController:self.rightViewController];
    [self.view addSubview:self.rightViewController.view];
    
    [self addChildViewController:self.rootViewController];
    [self.view addSubview:self.rootViewController.view];
    
    
    
    _rootViewController.view.multipleTouchEnabled = YES;
    
    //点击手势
    tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(moveRootViewControllr:)];
    
    
    
    //平移手势
    pgr = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
    [_rootViewController.view addGestureRecognizer:pgr];
    // Do any additional setup after loading the view.
}

-(void)addGR
{
    [_rootViewController.view addGestureRecognizer:pgr];
}

-(void)removeGR
{
    [_rootViewController.view removeGestureRecognizer:pgr];
}

#pragma mark-平移手势
//平移手势
- (void)move:(UIPanGestureRecognizer *)move
{
    static float startPoint_x; //触控开始位置
    float endPoint_x;   //触控结束位置
    static float viewPont_x; //视图位置
    
    switch (move.state) {
        case UIGestureRecognizerStateBegan:{
            
            startPoint_x=[move locationInView:self.window].x;
            viewPont_x=self.view.frame.origin.x;
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            endPoint_x=[move locationInView:self.window].x;
            float xPoint=viewPont_x+(endPoint_x-startPoint_x);
            
            if (xPoint>=-200&&xPoint<=200) {//观察平移量多少时实现什么，可以自己设置
                
                
                if (xPoint<50&&xPoint>=0) {
                    
                    _rootViewController.view.frame=CGRectMake(xPoint, 0, 320, self.view.bounds.size.height);
                    _rightViewController.view.frame=CGRectMake(xPoint, 0, 320, self.view.bounds.size.height);
                    
                    [UIView animateWithDuration:0.3 animations:^{
                        _rightViewController.view.frame=CGRectMake(0, 0, 320, self.view.bounds.size.height);
                        _rootViewController.view.frame=CGRectMake(0, 0, 320, self.view.bounds.size.height);
                        
                    } completion:^(BOOL finished) {
                        
                        for(UIView *view in _rootViewController.view.subviews)
                        {
                            view.userInteractionEnabled=YES;
                        }
                        
                    }];
                }
                else if(xPoint>=50&&xPoint<=200)
                {
                    
                    _rootViewController.view.frame=CGRectMake(xPoint, 0, 320, self.view.bounds.size.height);
                    _rightViewController.view.frame=CGRectMake(xPoint, 0, 320, self.view.bounds.size.height);
                    
                    [self showShadow:YES];
                    
                    [UIView animateWithDuration:0.3 animations:^{
                        
                        _rightViewController.view.frame=CGRectMake(200, 0, 320, self.view.bounds.size.height);
                        _rootViewController.view.frame=CGRectMake(200, 0, 320, self.view.bounds.size.height);
                        //                        [_rootViewController.view removeGestureRecognizer:tgr];
                        
                    } completion:^(BOOL finished) {
                        
                        for(UIView *view in _rootViewController.view.subviews)
                        {
                            view.userInteractionEnabled=NO;//当出现侧边菜单出现时，将主界面上的用户交互关闭
                        }
                        [_rootViewController.view addGestureRecognizer:tgr];//给主界面添加点击手势
                    }];
                }
                else if (xPoint<0&&xPoint>-50) {
                    
                    _rootViewController.view.frame=CGRectMake(xPoint, 0, 320, self.view.bounds.size.height);
                    _rightViewController.view.frame=CGRectMake(0, 0, 320, self.view.bounds.size.height);
                    
                    [UIView animateWithDuration:0.3 animations:^{
                        _rootViewController.view.frame=CGRectMake(0, 0, 320, self.view.bounds.size.height);
                        
                    }completion:^(BOOL finished) {
                        
                        for(UIView *view in _rootViewController.view.subviews)
                        {
                            view.userInteractionEnabled=YES;
                        }
                        
                    }];
                }
                else if(xPoint>=-200&&xPoint<=-50)
                {
                    _rootViewController.view.frame=CGRectMake(xPoint, 0, 320, self.view.bounds.size.height);
                    _rightViewController.view.frame=CGRectMake(0, 0, 320, self.view.bounds.size.height);
                    
                    [self showShadow:YES];
                    
                    [UIView animateWithDuration:0.3 animations:^{
                        _rootViewController.view.frame=CGRectMake(-200, 0, 320, self.view.bounds.size.height);
                        _rightViewController.view.frame=CGRectMake(0, 0, 320, self.view.bounds.size.height);
                        //                        [_rootViewController.view removeGestureRecognizer:tgr];
                        
                    }completion:^(BOOL finished) {
                        
                        for(UIView *view in _rootViewController.view.subviews)
                        {
                            view.userInteractionEnabled=NO;
                        }
                        [_rootViewController.view addGestureRecognizer:tgr];
                    }];
                }
            }
            else
            {
                return;
            }
            
        }
        default:
            break;
    }
    
}



//当侧边栏显示时，点击主界面恢复主窗口
- (void)moveRootViewControllr:(UITapGestureRecognizer *)touch
{
    
    [UIView animateWithDuration:0.35 animations:^{
        CGRect rect = _rootViewController.view.frame;
        rect.origin.x = 0.0f;
        _rootViewController.view.frame = rect;
        
        for(UIView *view in _rootViewController.view.subviews)
        {
            view.userInteractionEnabled=YES;
        }
        
        [_rootViewController.view removeGestureRecognizer:tgr];
    }];
    
}

-(void)showLeft
{
    
    [self showShadow:YES];//是否显示阴影（此阴影功能的实现参照DDmenu）

    
    if (_rootViewController.view.frame.origin.x == 0) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            
            //            _leftViewController.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
            _rootViewController.view.frame = CGRectMake(200, 0, ScreenWidth, ScreenHeight);
            _rightViewController.view.frame = CGRectMake(200, 0, ScreenWidth, ScreenHeight);
        } completion:^(BOOL finished) {
            
            
            
            for(UIView *view in _rootViewController.view.subviews)
            {
                
                view.userInteractionEnabled=NO;
            }
            
            [_rootViewController.view addGestureRecognizer:tgr];
            
        }];
        
    }else{
        
        [UIView animateWithDuration:0.3 animations:^{
            
            _rootViewController.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
            
        } completion:^(BOOL finished) {
            
            for(UIView *view in _rootViewController.view.subviews)
            {
                view.userInteractionEnabled=YES;
            }
            [_rootViewController.view removeGestureRecognizer:tgr];
        }];
    }
}

- (void)showRight
{
    [self showShadow:NO];
    if (_rootViewController.view.frame.origin.x == 0) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            _rootViewController.view.frame = CGRectMake(-200, 0, ScreenWidth, ScreenHeight);
            _rightViewController.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
            
        } completion:^(BOOL finished) {
            
            for(UIView *view in _rootViewController.view.subviews)
            {
                
                view.userInteractionEnabled=NO;
            }
            [_rootViewController.view addGestureRecognizer:tgr];
            
        }];
        
    }else{
        
        [UIView animateWithDuration:0.3 animations:^{
            
            _rootViewController.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
            _rightViewController.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
            
        } completion:^(BOOL finished) {
            
            for(UIView *view in _rootViewController.view.subviews)
            {
                view.userInteractionEnabled=YES;
            }
            
            [_rootViewController.view removeGestureRecognizer:tgr];
            
        }];
    }
}

//右侧若是要跳转到二级界面，主界面需要左移，也可以修改
- (void)show
{
    [self showShadow:NO];
    if (_rootViewController.view.frame.origin.x == -200) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            _rootViewController.view.frame = CGRectMake(-320, 0, ScreenWidth, ScreenHeight);
            
            UIViewController *vc = [[(UINavigationController *)_rightViewController viewControllers] objectAtIndex:0];
            vc.view.frame = CGRectMake(-120, 0, ScreenWidth, ScreenHeight);
            
        } completion:^(BOOL finished) {
            
        }];
        
    }else{
        
        [UIView animateWithDuration:0.3 animations:^{
            
            _rootViewController.view.frame = CGRectMake(-200, 0, ScreenWidth, ScreenHeight);
            
            UIViewController *vc = [[(UINavigationController *)_rightViewController viewControllers] objectAtIndex:0];
            vc.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
            
        } completion:^(BOOL finished) {
            
        }];
        
    }
}

- (void)showShadow:(BOOL)val {
    if (!_rootViewController) return;
    
    _rootViewController.view.layer.shadowOpacity = val ? 0.8f : 0.0f;
    if (val) {
        _rootViewController.view.layer.cornerRadius = 4.0f;
        _rootViewController.view.layer.shadowOffset = CGSizeZero;
        _rootViewController.view.layer.shadowRadius = 4.0f;
        _rootViewController.view.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.view.bounds].CGPath;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
