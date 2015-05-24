//
//  SpriteModifier.h
//  Jump So High
//
//  Created by neyma on 25/05/15.
//  Copyright (c) 2015 neyma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpriteModifier : NSObject

+ (CGSize)scaleSizeDueToScreenSize:(CGSize)spriteSize WithPercentage:(CGFloat) percentage;

@end
