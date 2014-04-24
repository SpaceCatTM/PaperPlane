//
//  GameScene.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 17..
//  Copyright 2014년 이강용. All rights reserved.
//

#import "GameScene.h"


@implementation GameScene

-(void)loadResources
{
    _player = [Plane spriteWithImageNamed:@"plane.png"];
}

-(void)initAndAddPlayer
{
    _player.positionType = CCPositionTypeNormalized;
    _player.position = ccp(0.5, 0.1);
    _player.scale = 0.1;
    [self addChild:_player];
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
    
    [self loadResources];
    [self initAndAddPlayer];
    
    return self;
}

-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [touch locationInNode:self];
    
    if (touchLocation.x < [DisplaySetting getSize].width / 2)
    {
        [_player moveLeft];
    
        if ([_player position].x < 0)
        {
            _player.position = CGPointMake(0, _player.position.y);
        }
    }
    else
    {
        [_player moveRight];
   
        if ([_player position].x > 1.0f)
        {
            _player.position = CGPointMake(1, _player.position.y);
        }
    }
}

@end
