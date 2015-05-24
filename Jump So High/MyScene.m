//
//  MyScene.m
//  Jump So High
//
//  Created by neyma on 17/05/15.
//  Copyright (c) 2015 neyma. All rights reserved.
//

#import "MyScene.h"
#import "MainCharacter.h"
#import "Math.h"
#import "YellowEnemy.h"

@interface MyScene()

@property (nonatomic) NSTimeInterval lastSpawnTimeInterval;
@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;

@end

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        /*SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];*/
        
        self.physicsWorld.gravity = CGVectorMake(0, 0);
        
        MainCharacter* mainCharacter = [MainCharacter getInstance];
        
        [self addChild:mainCharacter.character];
        
    }
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        MainCharacter* mainCharacter = [MainCharacter getInstance];
        

        CGPoint direction = [Math vectorSubA:location B:mainCharacter.character.position];
        float length = [Math vectorLength:direction];
        
        
        SKAction * actionMove = [SKAction moveTo:location duration:length/500];
        
        [mainCharacter.character runAction:actionMove];
        //[[MainCharacter getInstance].character.physicsBody applyImpulse:CGVectorMake(0, 50)];
        
    }
}

-(void)addYellowEnemy
{
    YellowEnemy* enemy = [[YellowEnemy alloc] init];
    
    [enemy generatePosition];
    
    CGPoint mainCharacterPos = [MainCharacter getInstance].character.position;
    CGPoint direction = [Math vectorSubA:mainCharacterPos B:enemy.character.position];
    CGPoint normalizedDirection = [Math vectorNormalize:direction];
    
    CGPoint lengthOfWay = [Math vectorMultA:normalizedDirection withConst:2000];
    
    CGPoint realDest = [Math vectorAddA:lengthOfWay B:enemy.character.position];
    
    float velocity = 280.0;
    float realMoveDuration = self.size.width / velocity;
    SKAction * actionMove = [SKAction moveTo:realDest duration:realMoveDuration];
    SKAction * actionMoveDone = [SKAction removeFromParent];
    [enemy.character runAction:[SKAction sequence:@[actionMove, actionMoveDone]]];
    
    [self addChild:enemy.character];
}


-(void)update:(CFTimeInterval)currentTime
{
    /* Called before each frame is rendered */
    //[[MainCharacter getInstance].character.physicsBody applyForce:CGVectorMake(0, -9.8)];
    
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    if (timeSinceLast > 1)
    { // more than a second since last update
        timeSinceLast = 1.0 / 60.0;
        self.lastUpdateTimeInterval = currentTime;
    }
    
    [self updateWithTimeSinceLastUpdate:timeSinceLast];
}

- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast
{
    
    self.lastSpawnTimeInterval += timeSinceLast;
    if (self.lastSpawnTimeInterval > 0.5)
    {
        self.lastSpawnTimeInterval = 0;
        [self addYellowEnemy];
        [self addYellowEnemy];
    }
}

@end
