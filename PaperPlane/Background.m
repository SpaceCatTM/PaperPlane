//
//  Background.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 5. 11..
//  Copyright 2014년 이강용. All rights reserved.
//

#import "Background.h"
#import "DisplaySetting.h"

@implementation Background

// 스크롤
-(void)scroll:(CGFloat)speed
{
    CGPoint position = self.position;
    
    if (position.y < -1.0f)
    {
        position.y += 1.0f;
    }
    else
    {
        position.y -= speed;
    }
    
    self.position = position;
}

// 초기화
-(id)init
{
    self = [super init];
    if (!self) return (nil);
 
    self.positionType = CCPositionTypeNormalized;
    self.zOrder = -10;
    
    if (DisplaySetting.isWide == YES)
    {
        self.scaleX = 0.5;
        self.scaleY = 0.5;
    }
    else
    {
        self.scaleX = 0.5;
        self.scaleY = 0.5 * (960.0 / 1136.0);
    }
    
    CCSprite *bg1 = [[CCSprite alloc] initWithImageNamed:@"mond2.jpg"];

    bg1.anchorPoint = ccp(0.0, -1.015);
    bg1.position = ccp(0.0, 0.0);
    
    [self addChild:bg1];
    
    CCSprite *bg2 = [[CCSprite alloc] initWithImageNamed:@"mond2.jpg"];
    
    bg2.anchorPoint = ccp(0.0, 0.0);
    bg2.position = ccp(0.0, 0.0);
    
    [self addChild:bg2];
    
    return self;
}

@end
