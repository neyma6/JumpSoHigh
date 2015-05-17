//
//  MainCharacter.m
//  Jump So High
//
//  Created by neyma on 17/05/15.
//  Copyright (c) 2015 neyma. All rights reserved.
//

#import "MainCharacter.h"

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
        self.character = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        self.character.position = position;
        self.character.size = [self scaleSizeDueToScreenSize:[self.character size]];
    }
    return self;
}

- (CGSize)scaleSizeDueToScreenSize:(CGSize)spriteSize
{
    CGSize newSize;
    CGRect mainWindowSize = [[UIScreen mainScreen] bounds];
    
    CGFloat mainHeight = mainWindowSize.size.height;
    
    newSize.height = (mainHeight / spriteSize.height) * 20;
    newSize.width = spriteSize.width * (newSize.height / spriteSize.height);
    
    return newSize;
}



@end
