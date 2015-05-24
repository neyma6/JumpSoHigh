//
//  MainCharacter.m
//  Jump So High
//
//  Created by neyma on 17/05/15.
//  Copyright (c) 2015 neyma. All rights reserved.
//

#import "MainCharacter.h"
#import "SpriteModifier.h"

@interface MainCharacter()
{
    
}
@end

@implementation MainCharacter

static MainCharacter* instance;

+(MainCharacter*)getInstance
{
    if (instance == NULL)
    {
        instance = [[MainCharacter alloc] init];
    }
    return instance;
}

- (instancetype)init
{
    CGPoint position;
    CGRect mainWindowSize = [[UIScreen mainScreen] bounds];
    position.y = mainWindowSize.size.height/2;
    position.x = mainWindowSize.size.width/2;
    return [self initWithPosition:position];
}

- (instancetype)initWithPosition:(CGPoint)position
{
    self = [super init];
    if (self) {
        self.character = [SKSpriteNode spriteNodeWithImageNamed:@"red_dot"];
        self.character.position = position;
        self.character.size = [SpriteModifier scaleSizeDueToScreenSize:[self.character size] WithPercentage:20];
        
        self.character.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.character.size.height/2];
        self.character.physicsBody.dynamic = YES;
    }
    return self;
}



@end
