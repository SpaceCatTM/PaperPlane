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

+(CGPoint) getPlayerInitialPosition;
+(CGFloat) getPlayerMass;
+(CGFloat) getAngularForce;
+(CGFloat) getVerticalForce;
+(CGFloat) getHorizonalForce;
+(CGFloat) getMaximumScrollSpeed;

@end
