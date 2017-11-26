//
//  NSString+JudgeExtension.h
//  MapTexts
//
//  Created by apple on 2017/8/11.
//  Copyright © 2017年 yangchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JudgeExtension)
#pragma mark 判断电话号的正确性
- (BOOL)isMobileNumber;

#pragma mark 判断密码(长度为8，必须为字母数字组合)
-(BOOL)judgePassWordLegal;
@end
