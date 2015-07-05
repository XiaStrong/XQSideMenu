//
//  RightViewController.m
//  SideMenuDemo
//
//  Created by mac on 14-11-10.
//  Copyright (c) 2014年 XQ. All rights reserved.
//

#import "RightViewController.h"
#import "Right2ViewController.h"
#import "AppDelegate.h"
@interface RightViewController ()

@end

@implementation RightViewController

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
    self.view.backgroundColor=[UIColor orangeColor];
    
    
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"跳转至下一个" forState:UIControlStateNormal];
    btn.frame=CGRectMake(200, 100, 100, 30);
    [btn addTarget:self action:@selector(Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    // Do any additional setup after loading the view.
}



-(void)Click
{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate.root show];
    Right2ViewController *rvc=[[Right2ViewController alloc]init];
    [self.navigationController pushViewController:rvc animated:YES];
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
