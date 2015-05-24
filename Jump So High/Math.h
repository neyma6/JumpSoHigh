//
//  Math.h
//  Jump So High
//
//  Created by neyma on 24/05/15.
//  Copyright (c) 2015 neyma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Math : NSObject

+(CGPoint)vectorAddA:(CGPoint) a B:(CGPoint) b;
+(CGPoint)vectorSubA:(CGPoint) a B:(CGPoint) b;
+(CGPoint)vectorMultA:(CGPoint) a withConst:(float) b;
+(float)vectorLength:(CGPoint) a;
+(CGPoint)vectorNormalize:(CGPoint) a;

@end
