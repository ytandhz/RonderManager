//
//  UIImage+Extension.h
//  XianYu
//
//  Created by ZpyZp on 15/10/24.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 生成指定颜色的图片

 @param color 图片颜色
 @return 指定颜色的图片
 */
+(UIImage *)imageWithColor:(UIColor *)color;


/**
 生成指定颜色的图片

 @param color 图片颜色
 @param size 图片尺寸
 @return 指定颜色、尺寸的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


/**
 图片拉伸（防不规则拉升）
 
 @param imageName 图片名
 
 @return return value description
 */
+ (UIImage *)imageWithOriginalRenderingMode:(NSString *)imageName;

/**
 图片拉伸（防不规则拉升）
 
 @param image 图片
 
 @return return value description
 
 */
+ (UIImage *)imageWithOriginalRenderingM:(UIImage *)image;

/**
 圆形图片
 
 @param imageName 图片名
 
 @return 圆形图片
 */
+ (UIImage *)circleImageWithName:(NSString *)imageName;


/**
 圆形图片
 
 @param img 图片
 
 @return 圆形图片
 */
+ (UIImage *)circleImageWithImg:(UIImage *)img;

/**
 返回圆形有边框的图片
 
 @param imageName imageName description
 @param myBorderWidth     width description
 @param myBordercolor     color description
 
 @return return value description
 */
+ (UIImage *)circleImageWithName:(NSString *)imageName
                      borderWith:(CGFloat)myBorderWidth
                     borderColor:(UIColor *)myBordercolor;

/**
 返回圆形有边框的图片
 
 @param img           img description
 @param myBorderWidth myBorderWidth description
 @param myBordercolor myBordercolor description
 
 @return return value description
 */
+ (UIImage *)circleImageWithImg:(UIImage *)img
                     borderWith:(CGFloat)myBorderWidth
                    borderColor:(UIColor *)myBordercolor;

/**
 压缩图片
 
 @param size 压缩尺寸
 
 @return return value description
 */
- (UIImage *)imageCompressToSize:(CGSize)size;

/**
 图片裁剪
 
 @param frame 裁剪区域
 
 @return return value description
 */
- (UIImage *)imageCutWithFrame:(CGRect)frame;


/**
 生成一张纯色可自定义颜色、大小的防拉伸的图片
 
 @param color 颜色
 @param size  尺寸
 
 @return 返回一张图片
 */
+ (UIImage *)zs_circleAndStretchableImageWithColor:(UIColor *)color size:(CGSize)size;

/**
 根据最大宽度、或者高度等比压缩图片

 @param pic_max_width 图片最大宽度
 @param pic_max_height 图片最大高度
 @return 图片的尺寸
 */
- (CGSize)imageSizeWithMax_with:(CGFloat)pic_max_width max_height:(CGFloat)pic_max_height;

@end
