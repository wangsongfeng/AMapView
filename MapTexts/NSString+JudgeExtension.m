//
//  NSString+JudgeExtension.m
//  MapTexts
//
//  Created by apple on 2017/8/11.
//  Copyright © 2017年 yangchao. All rights reserved.
//

#import "NSString+JudgeExtension.h"

@implementation NSString (JudgeExtension)
#pragma mark 判断电话号的正确性
- (BOOL)isMobileNumber {
    
    //    电信号段:133/153/180/181/189/177
    
    //    联通号段:130/131/132/155/156/185/186/145/176
    
    //    移动号段:134/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178
    
    //    虚拟运营商:170
    
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[06-8])\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    return [regextestmobile evaluateWithObject:self];
    
}
#pragma mark 判断密码(长度为8，必须为字母数字组合)
-(BOOL)judgePassWordLegal{
    BOOL result = false;
    if ([self length] >= 8){
        // 判断长度大于8位后再接着判断是否同时包含数字和字符
        NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:self];
    }
    return result;
}



@end
