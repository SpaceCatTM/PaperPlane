//
//  GameScene.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 17..
//  Copyright 2014년 이강용. All rights reserved.
//

#import "GameScene.h"


@implementation GameScene

-(void)initPhysics
{
    _physicsNode = [CCPhysicsNode node];
    _physicsNode.contentSize = self.contentSize;
    _physicsNode.collisionDelegate = self;
    [self addChild:_physicsNode];
}

-(void)initAndAddBackground
{
    _background = [Background node];
    [self addChild:_background];
}

-(void)initAndAddPlayer
{
    _player = [Plane node];
    _player.positionType = CCPositionTypeNormalized;
    _player.position = [GameParameters getPlayerInitialPosition];
    [_physicsNode addChild:_player];
}

-(void)startSpawn
{
    _spawnController = [SpawnController node];
    [_spawnController startSpawn];
    [_physicsNode addChild:_spawnController];
}

+(GameScene *)scene
{
	return [[self alloc] init];
}

-(id)init
{
    self = [super init];
    if (!self) return (nil);

    self.userInteractionEnabled = YES;
    
    [self initPhysics];
    [self initAndAddBackground];
    [self initAndAddPlayer];
    [self startSpawn];
    
    return self;
}

-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchLocation = [touch locationInNode:self];
    
    if (touchLocation.x < [DisplaySetting getSize].width / 2)
    {
        [_player moveLeft];
    }
    else
    {
        [_player moveRight];
    }
}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair playerCollision:(CCNode *)player obstacleCollision:(CCNode *)obstacle
{
    CCLOG(@"Collision Detected");
    
    // 충돌된 장애물을 제거한다.
    [obstacle removeFromParentAndCleanup:YES];
    
    // 리턴 값이 YES면 물리적인 힘을 받고, NO면 물리적인 힘을 받지 않는다.
    return YES;
}

@end
