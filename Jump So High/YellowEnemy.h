//
//  YellowEnemy.h
//  Jump So High
//
//  Created by neyma on 25/05/15.
//  Copyright (c) 2015 neyma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface YellowEnemy : NSObject

@property (strong, nonatomic) SKSpriteNode* character;

-(void)generatePosition;

@end
