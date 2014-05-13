//
//  GameScene.h
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 17..
//  Copyright 2014년 이강용. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "DisplaySetting.h"
#import "GameSetting.h"

#import "PlayerDelegate.h"

#import "GameController.h"
#import "SpawnController.h"

#import "Plane.h"
#import "Background.h"

@interface GameScene : CCScene <CCPhysicsCollisionDelegate>
{
    @private
    Background *_background;
    Plane      *_player;
    
    @private
    CCPhysicsNode   *_physicsNode;
    GameController  *_gameController;
    SpawnController *_spawnController;
}

+(GameScene *)scene;
-(id)init;
@end
