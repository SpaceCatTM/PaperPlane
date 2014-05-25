//
//  Wind.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 5. 25..
//  Copyright 2014년 이강용. All rights reserved.
//

#import "Wind.h"
#import "GameSetting.h"
#import "GameController.h"

@implementation Wind

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
    self.position = ccp(self.position.x + self.speed, self.position.y);
}

// 초기화
-(id)init
{
    self = [super init];
    if (!self) return (nil);
    
    self = [self initWithImageNamed:@"wind.png"];
    self.scale = 0.25;
    self.physicsBody = [CCPhysicsBody bodyWithCircleOfRadius:(self.contentSizeInPoints.width / 2) andCenter:self.anchorPointInPoints];
    self.physicsBody.collisionType = @"windCollision";
    
    return self;
}

@end
