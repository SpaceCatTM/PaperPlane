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
#import "PlayerEvents.h"
#import "Plane.h"

@interface GameScene : CCScene {
    @private
    Plane *_player;
}

+(GameScene *)scene;
-(id)init;
@end
