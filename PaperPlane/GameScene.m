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
    [self addChild:_physicsNode];
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
    _spawnController = [SpawnController new];
    [_spawnController startSpawn];
    [self addChild:_spawnController];
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
    [self initAndAddPlayer];
    [self startSpawn];
    
    return self;
}

-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
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

@end
