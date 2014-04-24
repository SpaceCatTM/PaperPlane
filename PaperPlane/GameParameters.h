//
//  GameParameters.h
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 21..
//  Copyright 2014년 이강용. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameParameters : NSObject

+(CGFloat) getRestorePositionInterval;
+(CGFloat) getRestoreHorizonalForce;
+(CGPoint) getPlayerInitialPosition;
+(CGFloat) getVerticalForce;
+(CGFloat) getHorizonalForce;

@end
