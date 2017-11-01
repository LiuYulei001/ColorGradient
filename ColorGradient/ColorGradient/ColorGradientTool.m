//
//  ColorGradientTool.m
//  ColorGradient
//
//  Created by Rainy on 2017/10/31.
//  Copyright © 2017年 Rainy. All rights reserved.
//

#import "ColorGradientTool.h"

@implementation ColorGradientTool

+ (void)gradientStartColor:(UIColor *)startColor
                  endColor:(UIColor *)endColor
                statusView:(UIView *)statusView
    colorGradientDirection:(ColorGradientDirection)colorGradientDirection
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = statusView.bounds;
    [statusView.layer addSublayer:gradientLayer];
    
    gradientLayer.locations = @[[NSNumber numberWithFloat:0], [NSNumber numberWithFloat:1.0]];
    
    gradientLayer.colors = @[(__bridge NSArray * _Nullable)(startColor.CGColor), (__bridge NSArray * _Nullable)(endColor.CGColor)];
    
    switch (colorGradientDirection) {
        case ColorGradientDirectionForLeftToRight:
            gradientLayer.startPoint = CGPointMake(0, 0);
            gradientLayer.endPoint = CGPointMake(1, 0);
            break;
        case ColorGradientDirectionForRightToLeft:
            gradientLayer.startPoint = CGPointMake(1, 0);
            gradientLayer.endPoint = CGPointMake(0, 0);
            break;
        case ColorGradientDirectionForUpToUnder:
            gradientLayer.startPoint = CGPointMake(0, 0);
            gradientLayer.endPoint = CGPointMake(0, 1);
            break;
        case ColorGradientDirectionForUnderToUp:
            gradientLayer.startPoint = CGPointMake(0, 1);
            gradientLayer.endPoint = CGPointMake(0, 0);
            break;
        
            
        default:
            break;
    }
}

@end
