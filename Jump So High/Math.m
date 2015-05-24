//
//  Math.m
//  Jump So High
//
//  Created by neyma on 24/05/15.
//  Copyright (c) 2015 neyma. All rights reserved.
//

#import "Math.h"

@implementation Math

+(CGPoint)vectorAddA:(CGPoint) a B:(CGPoint) b
{
    return CGPointMake(a.x + b.x, a.y + b.y);
}

+(CGPoint)vectorSubA:(CGPoint) a B:(CGPoint) b
{
    return CGPointMake(a.x - b.x, a.y - b.y);
}

+(CGPoint)vectorMultA:(CGPoint) a withConst:(float) b
{
    return CGPointMake(a.x * b, a.y * b);
}

+(float)vectorLength:(CGPoint) a
{
    return sqrtf(a.x * a.x + a.y * a.y);
}

+(CGPoint)vectorNormalize:(CGPoint) a
{
    float length = [Math vectorLength: a];
    return CGPointMake(a.x / length, a.y / length);
}

@end
