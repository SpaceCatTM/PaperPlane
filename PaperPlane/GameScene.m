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
    _physicsNode.collisionDelegate = self;
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

-(void)initGameController
{
    _gameController = [GameController new];
}

-(void)initSpawnController
{
    _spawnController = [SpawnController node];
    _spawnController.contentSize = self.contentSize;
    [_spawnController startSpawn];
    [_physicsNode addChild:_spawnController];
}

-(void)playing
{
    // 스크롤 속도 증가
    if (_gameController.scrollSpeed < [GameParameters getMaximumScrollSpeed])
    {
        _gameController.scrollSpeed += 0.001;
    }
    
    // 점수 증가
    _gameController.score += 10;
}

-(void)displayScore
{
    CCLabelTTF *label;
    
    label = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%ld", (long)_gameController.score]
                               fontName:@"Chalkduster"
                               fontSize:36.0f];
    
    label.positionType = CCPositionTypeNormalized;
    label.color = [CCColor redColor];
    label.position = ccp(0.5f, 0.5f); // Middle of screen
    
    [self addChild:label];
}

-(void)gameOver
{
    _gameController.scrollSpeed = 0;
    _gameController.isGameOver = YES;
    
    [_physicsNode removeChild:_player];
    
    [self displayScore];
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
    [self initGameController];
    [self initSpawnController];
    
    [self schedule:@selector(playing) interval:2.0];
    
    return self;
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
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
