//
//  UIImage+Extension.m
//  XianYu
//
//  Created by ZpyZp on 15/10/24.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+(UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


//传入字符串
+ (UIImage *)imageWithOriginalRenderingMode:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return  [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

//传入图片
+ (UIImage *)imageWithOriginalRenderingM:(UIImage *)image
{
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (UIImage *)circleImageWithName:(NSString *)imageName
{
    UIImage *image = [self imageNamed:imageName];
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGFloat centerX = image.size.width *0.5;
    CGFloat centerY = image.size.height *0.5;
    CGFloat radius = MIN(centerX, centerY);
    CGContextAddArc(ref, centerX, centerY, radius, 0, M_PI *2, NO);
    CGContextClip(ref);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    UIImage *circleImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return circleImage;
}

+ (UIImage *)circleImageWithImg:(UIImage *)img {
    
    UIGraphicsBeginImageContextWithOptions(img.size, NO, 0.0);
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGFloat centerX = img.size.width *0.5;
    CGFloat centerY = img.size.height *0.5;
    CGFloat radius = MIN(centerX, centerY);
    CGContextAddArc(ref, centerX, centerY, radius, 0, M_PI *2, NO);
    CGContextClip(ref);
    [img drawInRect:CGRectMake(0, 0, img.size.width, img.size.height)];
    UIImage *circleImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return circleImage;
    
}

+ (UIImage *)circleImageWithName:(NSString *)imageName
                      borderWith:(CGFloat)myBorderWidth
                     borderColor:(UIColor *)myBordercolor
{
    UIImage *sourceImage = [self imageNamed:imageName];
    CGFloat imageW = sourceImage.size.width + myBorderWidth *2;
    CGFloat imageH = sourceImage.size.height + myBorderWidth *2;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    CGContextRef ref = UIGraphicsGetCurrentContext();
    [myBordercolor set];
    
    CGFloat centerX = imageW *0.5;
    CGFloat centerY = imageW *0.5;
    CGFloat radius = centerX;
    CGContextAddArc(ref, centerX, centerY, radius, 0, M_PI *2, NO);
    CGContextFillPath(ref);
    
    CGFloat smallRadius = radius - myBorderWidth;
    CGContextAddArc(ref, centerX, centerY, smallRadius, 0, M_PI *2, NO);
    CGContextClip(ref);
    
    [sourceImage drawInRect:CGRectMake(myBorderWidth, myBorderWidth, sourceImage.size.width, sourceImage.size.height)];
    UIImage *borderCircleImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return borderCircleImage;
    
}

+ (UIImage *)circleImageWithImg:(UIImage *)img
                     borderWith:(CGFloat)myBorderWidth
                    borderColor:(UIColor *)myBordercolor {
    UIImage *sourceImage = img;
    CGFloat imageW = sourceImage.size.width + myBorderWidth *2;
    CGFloat imageH = sourceImage.size.height + myBorderWidth *2;
    imageW = imageW>imageH?imageH:imageW;
    CGSize imageSize = CGSizeMake(imageW, imageW);
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    CGContextRef ref = UIGraphicsGetCurrentContext();
    [myBordercolor set];
    
    CGFloat centerX = imageW *0.5;
    CGFloat centerY = imageW *0.5;
    CGFloat radius = centerX;
    CGContextAddArc(ref, centerX, centerY, radius, 0, M_PI *2, NO);
    CGContextFillPath(ref);
    
    CGFloat smallRadius = radius - myBorderWidth;
    CGContextAddArc(ref, centerX, centerY, smallRadius, 0, M_PI *2, NO);
    CGContextClip(ref);
    
    [sourceImage drawInRect:CGRectMake(myBorderWidth, myBorderWidth, imageW-myBorderWidth*2, imageW-myBorderWidth*2)];
    UIImage *borderCircleImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return borderCircleImage;
    
}

- (UIImage *)imageCompressToSize:(CGSize)size
{
    UIImage *newImage = nil;
    CGSize imageSize = self.size;//图片原始尺寸
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = size.width;//目标尺寸
    CGFloat targetHeight = size.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    if (CGSizeEqualToSize(imageSize, size) == NO) {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if (widthFactor > heightFactor) {//按照大的比例缩放
            scaleFactor = widthFactor;
        } else {
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        if (widthFactor > heightFactor) {//居中处理
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }else if(widthFactor < heightFactor){
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [self drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    if(newImage == nil){
        
    }
    
    UIGraphicsEndImageContext();
    return newImage;
    
}

- (UIImage *)imageCutWithFrame:(CGRect)frame
{
    return [UIImage imageWithCGImage:CGImageCreateWithImageInRect(self.CGImage, frame)];
}

+ (UIImage *)zs_circleAndStretchableImageWithColor:(UIColor *)color size:(CGSize)size
{
    if (size.width <= 1) {
        size.width = 100;
        size.height = 100;
    }
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    //获取当前图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //添加一个椭圆，第一个参数是在那个上下文上面添加，，，第二个参数是设定一个矩形框，这个椭圆会”填充“这个矩形框，如果这个矩形框是正方形，那么就是圆
    CGRect rect =CGRectMake(0, 0, size.width, size.height);
    CGContextAddEllipseInRect(context,rect);
    CGContextClip(context);
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    // 裁剪
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    ;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (size.width <= 1) {
        size.width = 100;
        size.height = 100;
    }
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    //获取当前图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect =CGRectMake(0, 0, size.width, size.height);
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    ;
}

- (CGSize)imageSizeWithMax_with:(CGFloat)pic_max_width max_height:(CGFloat)pic_max_height {
    CGSize orgin_size = self.size;
    CGFloat origin_ratio = orgin_size.width/orgin_size.height;
    CGSize imageSize = CGSizeZero;
    CGFloat ratio_w = 0,ratio_h = 0;
    if (orgin_size.width > pic_max_width) {
        ratio_w = orgin_size.width/pic_max_width;
    }
    
    if (orgin_size.height > pic_max_height) {
        ratio_h = orgin_size.height/pic_max_height;
    }
    
    if (ratio_w > 0) {
        if (ratio_w >= ratio_h) {
            imageSize.width = pic_max_width;
            imageSize.height = pic_max_width/origin_ratio;
        }else {
            imageSize.height = pic_max_height;
            imageSize.width = pic_max_height *origin_ratio;
        }
    }else {
        if (ratio_h > 0) {
            imageSize.height = pic_max_height;
            imageSize.width = pic_max_height *origin_ratio;
        }else {
            imageSize = orgin_size;
        }
    }
    return imageSize;
}

@end
