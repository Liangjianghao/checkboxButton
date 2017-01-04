//
//  ViewController.m
//  ljhCheckbox
//
//  Created by EssIOS on 17/1/3.
//  Copyright © 2017年 ljh. All rights reserved.
//

#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width

#import "ViewController.h"
#import "ljhCheckbox.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ljhCheckbox *btn=[[ljhCheckbox alloc]init];
    NSArray *myarr= [NSArray arrayWithObjects:@"选择1",@"选择2",@"选择36",@"选择1",@"选择21",@"选择361", nil];
    [btn mybuttonwithArr:myarr andTitle:@"测试"andMessage:@"3333"];
    [btn setFinishBlock:^(NSString *choice) {

        NSLog(@"result%@",choice);
    }];
    
    btn.frame=CGRectMake(10, 100, WIDTH-20, 40);
    btn.titleLabel.font=[UIFont systemFontOfSize:14];
    [btn setTitle:@"多选按钮" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor groupTableViewBackgroundColor];
    btn.layer.cornerRadius=10;
    btn.clipsToBounds=YES;
    [self.view addSubview:btn];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
