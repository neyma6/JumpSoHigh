//
//  YellowEnemy.m
//  Jump So High
//
//  Created by neyma on 25/05/15.
//  Copyright (c) 2015 neyma. All rights reserved.
//

#import "YellowEnemy.h"
#import "SpriteModifier.h"

@implementation YellowEnemy

static int lastRandom = -1;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.character = [SKSpriteNode spriteNodeWithImageNamed:@"yellow_dot"];
        self.character.size = [SpriteModifier scaleSizeDueToScreenSize:[self.character size] WithPercentage:15];
        
        self.character.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.character.size.height/2];
        self.character.physicsBody.dynamic = YES;
    }
    return self;
}

-(void)generatePosition
{
    CGRect mainWindowSize = [[UIScreen mainScreen] bounds];

    
    int side;
    
    do {
        side = (arc4random() % 4) + 1;
    } while (side == lastRandom);
    
    lastRandom = side;
    
    int startX;
    int startY;
    
    switch (side) {
        case 1: startX = 0;
                startY = (arc4random() % (int)mainWindowSize.size.width);
            break;
            
        case 2: startX = mainWindowSize.size.height;
                startY = (arc4random() % (int)mainWindowSize.size.width);
            break;
            
        case 3: startX = (arc4random() % (int)mainWindowSize.size.height);
                startY = 0;
            break;
            
        case 4: startX = (arc4random() % (int)mainWindowSize.size.height);
                startY = mainWindowSize.size.width;
            break;
            
        default:
            break;
    }
    
    CGPoint startPoint;
    startPoint.x = startX;
    startPoint.y = startY;
    self.character.position = startPoint;
    
}

@end
