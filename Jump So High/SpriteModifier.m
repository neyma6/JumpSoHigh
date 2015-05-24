//
//  SpriteModifier.m
//  Jump So High
//
//  Created by neyma on 25/05/15.
//  Copyright (c) 2015 neyma. All rights reserved.
//

#import "SpriteModifier.h"

@implementation SpriteModifier

+ (CGSize)scaleSizeDueToScreenSize:(CGSize)spriteSize WithPercentage:(CGFloat) percentage
{
    CGSize newSize;
    CGRect mainWindowSize = [[UIScreen mainScreen] bounds];
    
    CGFloat mainHeight = mainWindowSize.size.height;
    
    newSize.height = (mainHeight / spriteSize.height) * percentage;
    newSize.width = spriteSize.width * (newSize.height / spriteSize.height);
    
    return newSize;
}

@end
