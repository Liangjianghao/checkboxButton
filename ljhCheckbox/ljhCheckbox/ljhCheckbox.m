//
//  ljhCheckbox.m
//  ljhCheckbox
//
//  Created by EssIOS on 17/1/3.
//  Copyright © 2017年 ljh. All rights reserved.
//

#import "ljhCheckbox.h"

@implementation ljhCheckbox
{
    NSMutableArray *dataArr;
    bool select[100];
    NSString *choice;

}


- (instancetype)mybuttonwithArr:(NSArray *)arr andTitle:(NSString *)title andMessage:(NSString *)message
{
    self.baseArr=arr;
    _alertTitle=title;
    _alertMessage=message;
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showAlert:)];
    [self addGestureRecognizer:tap];
    
    return self;
}

-(void)showAlert:(UITapGestureRecognizer *)tap{
    
    for (int i=0; i<100; i++) {
        select[i]=NO;
    }
    UIViewController *controller = [[UIViewController alloc]init];
    UITableView *alertTableView;
    dataArr=[NSMutableArray arrayWithArray:self.baseArr];
//    CGRect rect = CGRectMake(0, 0, 272, _baseArr.count*40);
    CGRect rect;
    if (_baseArr.count>5) {
     rect = CGRectMake(0, 0, 272, 200);
    }
    else{
     rect = CGRectMake(0, 0, 272, _baseArr.count*40);
    }
    
    
    [controller setPreferredContentSize:rect.size];
    alertTableView  = [[UITableView alloc]initWithFrame:rect];
    alertTableView.delegate = self;
    alertTableView.dataSource = self;
    alertTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [alertTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [alertTableView setTag:101];
    [controller.view addSubview:alertTableView];
    [controller.view bringSubviewToFront:alertTableView];
    [controller.view setUserInteractionEnabled:YES];
    [alertTableView setUserInteractionEnabled:YES];
    [alertTableView setAllowsSelection:YES];
    alertTableView.editing=YES;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:_alertTitle message:_alertMessage preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController setValue:controller forKey:@"contentViewController"];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    [alertController addAction:cancelAction];
    
    UIAlertAction *corfirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        choice=nil;
        for (int i=0; i<100; i++) {
            if (select[i] ) {
                if (choice) {
                    choice=[choice stringByAppendingString:[NSString stringWithFormat:@",%@",dataArr[i]]];
                }else
                {
                    choice=[NSString stringWithFormat:@"%@",dataArr[i]];
                }
            }
            
        }
        self.finishBlock(choice);
        [self setTitle:choice forState:UIControlStateNormal];
        
    }];
    [alertController addAction:corfirmAction];
    [[self getCurrentViewController:self] presentViewController:alertController animated:YES completion:nil];
    
}
#pragma mark - 获取当前view的viewcontroller
- (UIViewController *)getCurrentViewController:(UIView *) currentView
{
    for (UIView* next = [currentView superview]; next; next = next.superview)
    {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
#pragma mark--tableview delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"cellID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    cell.textLabel.text=dataArr[indexPath.row];
    
    
    return cell;
    
}
-(UITableViewCellEditingStyle)tableView:(UITableView*)tableView editingStyleForRowAtIndexPath:(NSIndexPath*)indexPath

{
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    select[indexPath.row]=YES;
    
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didDeselectRowAtIndexPath");
    select[indexPath.row]=NO;
}

@end
