//
//  NSString+YYAdditions.h
//  YY
//
//  Created by liguowei on 14-10-14.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSString (YYAdditions)

// md5加密
-(NSString *) stringFromMD5;


/**
 *  消除头尾的空格和换行
 */
-(NSString *) trim;

/**
 *  是否包含某个字符串
 */
-(BOOL) containWithString:(NSString *) string;


/**
 *  格式化输出数字，使用千位分隔符，例如: 1,234
 */
-(NSString *)moneyFormat;


/**
 *  格式化输出数字，使用千位分隔符，保留2位小数，例如: 1,234.00
 */
-(NSString *)moneyFormatToZero;

/**
 *  根据width，font，计算字符串的size
 */
- (CGSize)calculateSizeWithWidth:(CGFloat)width Font:(CGFloat)font;

/**
 *  根据height，font，计算字符串的size
 */
- (CGSize)calculateSizeWithHeight:(CGFloat)height Font:(CGFloat)font;

/**
 *  根据width，font，计算字符串的height
 */
- (CGFloat)calculateHeightWithWidth:(CGFloat)width Font:(CGFloat)font;

/**
 *  根据height，font，计算字符串的width
 */
- (CGFloat)calculateWidthWithHeihgt:(CGFloat)height Font:(CGFloat)font;

/**
 *  根据width，font，计算字符串有几行
 */
- (NSInteger)calculateLineNumberWithWidth:(CGFloat)width Font:(CGFloat)font;

/**
 *  消除空格
 */
- (NSString *)eliminateTheBlankSpace;

/**
 *  校验是否是数字
 */
+(BOOL)validateNumber:(NSString*)number;


/**
 *将money的数字转化成可显示的字符
 */
+ (NSString *)numberTransforToString:(NSString*)newNumber;

/**
 *投资记录转化投资方式
 */
+ (NSString *)continueStyleCharTransforToString:(NSString *)newChar;


//字符串为空得判断
//+ (NSString*)nullStringTransforToString:(id)nullString;

/**
 *
 *投资记录获取日期
 */
+ (NSString *)dateStringTransforToString:(NSString *)newData;

/**
 *普通字体改变字体的样式和类型
 */
+ (NSMutableAttributedString *)normalStringTransforToAttributedString:(NSString *)newString andFontSize:(CGFloat)sizeNumber;
@end
