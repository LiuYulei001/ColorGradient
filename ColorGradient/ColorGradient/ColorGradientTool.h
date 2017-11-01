//
//  ColorGradientTool.h
//  ColorGradient
//
//  Created by Rainy on 2017/10/31.
//  Copyright © 2017年 Rainy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ColorGradientDirection) {
    ColorGradientDirectionForLeftToRight,
    ColorGradientDirectionForRightToLeft,
    ColorGradientDirectionForUpToUnder,
    ColorGradientDirectionForUnderToUp
};

@interface ColorGradientTool : NSObject

+ (void)gradientStartColor:(UIColor *)startColor
                  endColor:(UIColor *)endColor
                statusView:(UIView *)statusView
    colorGradientDirection:(ColorGradientDirection)colorGradientDirection;

@end
