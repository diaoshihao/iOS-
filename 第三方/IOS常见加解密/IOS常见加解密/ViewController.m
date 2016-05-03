//
//  ViewController.m
//  IOS常见加解密
//
//  Created by qianfeng on 15/10/13.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "ViewController.h"
#import "SecurityUtil.h"

/*
 http://api.sina.cn?username=123&passwd=321
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Base64加密  emhhbmdzYW4wMQ==
    NSString * userName = @"7153ftm6ds";
    NSLog(@"NSString Base64加密:%@",[SecurityUtil encodeBase64String:userName]);
    NSLog(@"NSString Base64解密:%@",[SecurityUtil decodeBase64String:@"emhhbmdzYW4wMQ=="]);
    
    NSData * data = [@"7153ftm6ds" dataUsingEncoding:NSUTF8StringEncoding];
    // MTEx
    NSLog(@"NSData Base64加密:%@",[SecurityUtil encodeBase64Data:data]);
    NSLog(@"NSData Base64解密:%@",[SecurityUtil decodeBase64Data:[[SecurityUtil encodeBase64Data:data] dataUsingEncoding:NSUTF8StringEncoding]]);
    
    // AES加密
    NSLog(@"AES加密:%@",[SecurityUtil encryptAESData:userName]);
    // AES加密后生成的二进制不再是纯字符串转化为二进制的形式了
    // NSLog(@">>%@",[[NSString alloc] initWithData:[SecurityUtil encryptAESData:userName] encoding:NSUTF8StringEncoding]);
    NSLog(@"AES解密:%@",[SecurityUtil decryptAESData:[SecurityUtil encryptAESData:userName]]);
    
    // MD5加密
    NSLog(@"MD5加密:%@",[SecurityUtil encryptMD5String:@"wahaha"]);
    
    NSString * path = @"/Users/qianfeng/Desktop/App 上架流程.mp4";
    NSString * mp4Base64Str = [SecurityUtil encodeBase64Data:[NSData dataWithContentsOfFile:path]];
    // 3B3B0291A3AC714E24CF974AA97AA2CB
    NSLog(@"MP4 MD5加密:%@",[SecurityUtil encryptMD5String:mp4Base64Str]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
