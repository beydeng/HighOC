//
//  ImageDrawing.m
//  HighOC
//
//  Created by DengPan on 2018/7/25.
//  Copyright © 2018年 DengPan. All rights reserved.
//

#import "ImageDrawing.h"

@implementation ImageDrawing
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back.jpg"]];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    //如何通过掩码图创建不规则的显示效果的图片（clip图片）
    //首先你必须要准备一个原图，和一个准备作为遮罩的掩码图（mask），这里有两点要注意，如果希望通过CGImageCreateWithMask函数去创建一个处理过的不规则的图片的话，那么你需要有一张原图是带alpha通道的图片，和一个不带alpha通道的遮罩图。
    CGContextRef context = UIGraphicsGetCurrentContext();
//    UIImage *maskImage = [UIImage imageNamed:@"woman.jpg"];
//    UIImage *colorsImage = [UIImage imageNamed:@"mask.jpg"];
    
    UIImage *maskImage = [UIImage imageNamed:@"timg.jpeg"];
    UIImage *colorsImage = [UIImage imageNamed:@"mask.jpg"];
    
    CGImageRef maskRef = maskImage.CGImage;
    CGImageRef imageMask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                             CGImageGetHeight(maskRef),
                                             CGImageGetBitsPerComponent(maskRef),
                                             CGImageGetBitsPerPixel(maskRef),
                                             CGImageGetBytesPerRow(maskRef),
                                             CGImageGetDataProvider(maskRef), NULL, false);
    
    CGImageRef maskedRef = CGImageCreateWithMask(colorsImage.CGImage, imageMask);
    UIImage *maskedImage = [UIImage imageWithCGImage:maskedRef];
    
    // Free up CG resources
    CGImageRelease(maskedRef);
    CGImageRelease(imageMask);
    
    CGFloat x = (rect.size.width - maskedImage.size.width) / 2;
    CGFloat y = ((rect.size.height - maskedImage.size.height) / 2) - 10;
    
    CGContextSetShadowWithColor(context, CGSizeMake(1.0f, 1.0f), 10, [UIColor blackColor].CGColor);
    [maskedImage drawAtPoint:CGPointMake(x, y)];
    
}

////为图像创建透明区域
//这个可以使给图片创建alpha通道
+ (CGImageRef)CopyImageAndAddAlphaChannel:(CGImageRef)sourceImage
{
    CGImageRef retVal = NULL;
    
    size_t width = CGImageGetWidth(sourceImage);
    size_t height = CGImageGetHeight(sourceImage);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef offscreenContext = CGBitmapContextCreate(NULL, width, height,
                                                          8, 0, colorSpace,
                                                          kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrder32Little);
    
    if (offscreenContext != NULL)
    {
        CGContextDrawImage(offscreenContext, CGRectMake(0, 0, width, height), sourceImage);
        retVal = CGBitmapContextCreateImage(offscreenContext);
        CGContextRelease(offscreenContext);
    }
    
    CGColorSpaceRelease(colorSpace);
    
    return retVal;
    
}

@end
