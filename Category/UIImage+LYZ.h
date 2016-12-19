//
//  UIImage+LYZ.h
//  LYCategoriesDemo
//
//  Created by artios on 2016/12/6.
//  Copyright © 2016年 artios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LYZ)

/**
 *  加载原图
 *
 *  @param imageName 图片名
 *
 *  @return 图片UIImage
 */
+ (instancetype)originalRenderingImageWith:(NSString *)imageName;

- (instancetype)originalImage;

/**
 *  加载图片
 *
 *  @param name 图片名
 *
 *  @return 图片
 */
+ (UIImage *)imageWithName:(NSString *)name;
/**
 *  修改图片size
 *
 *  @param image      原图片
 *  @param targetSize 要修改的size
 *
 *  @return 修改后的图片
 */
+ (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize;

- (UIImage *)scaleToSize:(CGSize)size;
/**
 *
 *  @param bgImageName    背景图片
 *  @param waterImageName 水印图片
 *  @param scale 图片生成的比例
 *  @return 添加了水印的背景图片
 */
+ (UIImage *)waterImageWithBgImageName:(NSString *)bgImageName waterImageName:(NSString *)waterImageName scale:(CGFloat)scale;
+ (UIImage *)waterImageWithBgImage:(UIImage *)bgImage waterImageName:(NSString *)waterImageName scale:(CGFloat)scale;
/**
 *
 *  @param imageName    需要裁剪的图片
 *  @param borderColor 边框的颜色
 *  @param borderWidth 边框的宽度
 *  @return 一个裁剪 带有边框的圆形图片
 */
+ (UIImage *)circleImageWithImageName:(NSString *)imageName borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

+ (UIImage *)circleImageWithImage:(UIImage *)img borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
/**
 *
 *  @param captureView    需要截图View
 *  @return 返回view的图片
 */
+ (UIImage *)captureImage:(UIView *)captureView;
/**
 *  返回一张可以随意拉伸不变形的图片
 *
 *  @param name 图片名字
 */
+ (UIImage *)resizableImage:(NSString *)name;

+ (UIImage *)resizedImageWithName:(NSString *)name;

+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

/**
 *  通过颜色来生成一个纯色图片
 */
+ (UIImage *)imageFromColor:(UIColor *)color frame:(CGRect)frame;

/**
 *  来自资源库
 */
+ (UIImage *)imageNamed:(NSString *)name ofBundle:(NSString *)bundleName;

@end
