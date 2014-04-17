//
//  GameScene.h
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 17..
//  Copyright 2014년 이강용. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "Plane.h"
#import "Meteor.h"

@interface GameScene : CCScene {
    @private
    CCSprite *_player;
    CCSprite *_obstracles[10];
}

-(void)initialize;
-(void)addPlayer;
@end
