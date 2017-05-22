//
//  NSString+YYAdditions.m
//  YY
//
//  Created by liguowei on 14-10-14.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import "NSString+YYAdditions.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (YYAdditions)
- (NSString *) stringFromMD5
{
    if(self == nil || [self length] == 0)
        return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    return outputString;
}

// 消除头尾的空格和换行
-(NSString *) trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

// 是否包含某个字符串
-(BOOL)containWithString:(NSString *)string
{
    if ([self rangeOfString:string].location == NSNotFound) {
        return NO;
    }
    return YES;
}

// 格式化输出数字，使用千位分隔符
-(NSString*)moneyFormat
{
    NSNumber *num = [NSNumber numberWithDouble:[self doubleValue]];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
	formatter.numberStyle = NSNumberFormatterDecimalStyle;
	formatter.maximumFractionDigits = 2;
    return [formatter stringFromNumber:num];
}

// 格式化输出数字，使用千位分隔符，保留2位小数
-(NSString*)moneyFormatToZero
{
    NSNumber *num = [NSNumber numberWithDouble:[self doubleValue]];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.maximumFractionDigits = 2;
    formatter.minimumFractionDigits = 2;
    return [formatter stringFromNumber:num];
}



- (CGSize)calculateSizeWithWidth:(CGFloat)width Font:(CGFloat)font
{
    CGSize size = CGSizeMake(width, 0);
    CGSize tempSize;
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:font]};
    tempSize = [self boundingRectWithSize:size options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return tempSize;
}

- (CGSize)calculateSizeWithHeight:(CGFloat)height Font:(CGFloat)font
{
    CGSize size = CGSizeMake(0, height);
    CGSize tempSize;
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:font]};
    tempSize = [self boundingRectWithSize:size options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return tempSize;
}

- (CGFloat)calculateHeightWithWidth:(CGFloat)width Font:(CGFloat)font
{
    return [self calculateSizeWithWidth:width Font:font].height;
}

- (CGFloat)calculateWidthWithHeihgt:(CGFloat)height Font:(CGFloat)font
{
    return [self calculateSizeWithHeight:height Font:font].width;
}

- (NSInteger)calculateLineNumberWithWidth:(CGFloat)width Font:(CGFloat)font
{
    CGFloat oneLineHeight = [@"一行" calculateHeightWithWidth:width Font:font];
    CGFloat allLineHeight = [self calculateHeightWithWidth:width Font:font];
    return (allLineHeight / oneLineHeight) ;
}

- (NSString *)eliminateTheBlankSpace
{
    NSMutableString *str = [[NSMutableString alloc] initWithString:self];
    NSString *search = @" ";
    NSString *replace = @"";
    NSRange substr = [str rangeOfString:search];
    while (substr.location != NSNotFound) {
        [str replaceCharactersInRange:substr withString:replace];
        substr = [str rangeOfString:search];
    }
    
    return str;
}

+(BOOL)validateNumber:(NSString*)number {
    
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

+ (NSString *)numberTransforToString:(NSString*)newNumber
{
    
    return [NSString stringWithFormat:@"￥%.2f",[newNumber floatValue]];
}
//到期处理方式（A01 不支持续投 B01 本金续投 B02本息续投  B03到期兑付 C01活力宝不赎回 C02 活力宝赎回）
+ (NSString *)continueStyleCharTransforToString:(NSString *)newChar
{
    if ([newChar isEqualToString:@"A01"]) {
        return @"到期赎回";
    }else if ([newChar isEqualToString:@"B01"])
    {
        return @"本金续投";
    }else if ([newChar isEqualToString:@"B02"]){
        
        return @"本息续投";

    }else if ([newChar isEqualToString:@"C01"]){
        return @"活力宝不赎回";
        
    }
    return @"活力宝赎回";
}

+ (NSString *)dateStringTransforToString:(NSString *)newData
{
    NSString *data = [newData substringToIndex:10];
    return data;
}


+ (NSMutableAttributedString *)normalStringTransforToAttributedString:(NSString *)newString andFontSize:(CGFloat)sizeNumber
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:newString];
    int strLength = (int)newString.length;
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Thin" size:sizeNumber] range:NSMakeRange(0, strLength)];
    return str;
}

@end
