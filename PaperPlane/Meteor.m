//
//  Meteor.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 17..
//  Copyright (c) 2014년 이강용. All rights reserved.
//

#import "Meteor.h"
#import "GameController.h"
#import "GameSetting.h"

@implementation Meteor

@synthesize speed;

// 화면이 등장했을 경우
-(void)spawn:(CGPoint)position
{
    self.positionType = CCPositionTypeNormalized;
    self.position = position;
}

// 이동하는 경우
-(void)move
{
   self.position = ccp(self.position.x, self.position.y - ([GameController sharedInstance].scrollSpeed + self.speed));
}

// 죽는 경우
-(void)dead
{
    return;
}

// 초기화
-(id)init
{
    self = [super init];
    if (!self) return (nil);
    
    self = [self initWithImageNamed:@"rock.png"];
    self.speed = GameSetting.meteorSpeed;
    self.physicsBody = [CCPhysicsBody bodyWithCircleOfRadius:(self.contentSizeInPoints.width / 2) andCenter:self.anchorPointInPoints];
    self.physicsBody.collisionType = @"obstacleCollision";
    
    return self;
}

@end
