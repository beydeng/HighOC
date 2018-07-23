//
//  UIColor+DP.m
//  HighOC
//
//  Created by DengPan on 2018/7/23.
//  Copyright © 2018年 DengPan. All rights reserved.
//

#import "UIColor+DP.h"

@implementation UIColor (DP)

- (const CGFloat *)colorComponents {
    return CGColorGetComponents(self.CGColor);
}


@end
