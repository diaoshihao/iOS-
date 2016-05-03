//
//  ViewController.m
//  常见正则表达式
//
//  Created by qianfeng on 15/10/13.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "ViewController.h"
#import "RegularTools.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray * arr = @[@"邮箱",@"电话",@"用户名",@"密码",@"昵称",@"身份证"];
    for (int i = 0; i < arr.count; i++) {
        UILabel * lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 50+50*i, 100, 30)];
        lb.text = arr[i];
        [self.view addSubview:lb];
        
        UITextField * f = [[UITextField alloc] initWithFrame:CGRectMake(150, 50+50*i, 150, 30)];
        f.tag = 10+i;
        f.borderStyle = UITextBorderStyleLine;
        f.delegate = self;
        [self.view addSubview:f];
    }
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString * message = @"";
    switch (textField.tag) {
        case 10:
        {
            if (![RegularTools validateEmail:textField.text]) {
                message = @"这不是一个合法的email";
            }
        }
            break;
        case 11:
        {
            if (![RegularTools validateMobile:textField.text]) {
                message = @"这不是一个合法的电话号码";
            }
        }
            break;
        case 12:
        {
            
        }
            break;
        case 13:
        {
            
        }
            break;
        case 14:
        {
            
        }
            break;
        case 15:
        {
            
        }
            break;
        default:
            break;
    }
    
    if (textField.text.length == 0) {
        return;
    }
    
    UIAlertView * v = [[UIAlertView alloc] initWithTitle:@"" message:message delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    [v show];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
