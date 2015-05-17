//
//  MainCharacter.h
//  Jump So High
//
//  Created by neyma on 17/05/15.
//  Copyright (c) 2015 neyma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface MainCharacter : NSObject

@property (strong, nonatomic) SKSpriteNode* character;

+(MainCharacter*)getInstance;

@end
