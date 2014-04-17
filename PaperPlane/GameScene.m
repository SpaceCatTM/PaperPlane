//
//  GameScene.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 17..
//  Copyright 2014년 이강용. All rights reserved.
//

#import "GameScene.h"


@implementation GameScene

-(void)initialize
{
    [self addPlayer];
}

-(void)addPlayer
{
    _player = [Plane node];
    _player.position = ccp(0, 0);
    [self addChild:_player];
}

@end
