//
//  GameSetting.h
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 21..
//  Copyright 2014년 이강용. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameSetting : NSObject

+(CGPoint) playerInitialPosition;
+(CGFloat) playerMass;
+(CGFloat) angularForce;
+(CGFloat) verticalForce;
+(CGFloat) horizonalForce;
+(CGFloat) maximumScrollSpeed;
+(CGFloat) decraseScrollSpeedOnCollision;
+(CGFloat) meteorSpeed;
+(CGFloat) bombSpeed;
+(CGFloat) windSpeed;
+(CGPoint) windForce;

@end
