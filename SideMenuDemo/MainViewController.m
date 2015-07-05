//
//  MainViewController.m
//  SideMenuDemo
//
//  Created by mac on 14-11-10.
//  Copyright (c) 2014年 XQ. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "Main2ViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

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
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.navigationController.navigationBar.hidden=YES;
    
    UIImageView *view=[[UIImageView alloc]initWithFrame:CGRectMake(0, 20, 320, 44)];
    view.image=[UIImage imageNamed:@"navbarBg@2x"];
    view.userInteractionEnabled=YES;
    [self.view addSubview:view];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(13, 7, 30, 30);
    [leftButton setTitle:@"左" forState:UIControlStateNormal];
    leftButton.tag=1;
    [leftButton addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:leftButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(277,7, 30, 30);
    [rightButton setTitle:@"右" forState:UIControlStateNormal];
    rightButton.tag=2;
    [rightButton addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:rightButton];
    
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"下一个" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn1.frame=CGRectMake(200, 100, 100, 30);
    [btn1 addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    // Do any additional setup after loading the view.
}

-(void)next
{
    Main2ViewController *mvc=[[Main2ViewController alloc]init];
    [self.navigationController pushViewController:mvc animated:YES];
}

-(void)didClick:(UIButton *)btn
{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    if (btn.tag==1) {
        
        [appDelegate.root showLeft];
    }
    if (btn.tag==2) {
        
        [appDelegate.root showRight];
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
