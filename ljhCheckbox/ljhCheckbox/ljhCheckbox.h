//
//  ljhCheckbox.h
//  ljhCheckbox
//
//  Created by EssIOS on 17/1/3.
//  Copyright © 2017年 ljh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ljhCheckbox : UIButton<UITableViewDelegate,UITableViewDataSource>
@property(retain,nonatomic) NSArray *baseArr;
@property(retain,nonatomic) NSString *alertTitle;
@property(retain,nonatomic) NSString *alertMessage;

@property (copy,nonatomic)void(^finishBlock)(NSString *selectArr);

- (instancetype)mybuttonwithArr:(NSArray *)arr andTitle:(NSString *)title andMessage:(NSString *)message;


@end
