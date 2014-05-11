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

-(void)update:(CCTime)delta
{
    CGPoint position = self.position;
    
    if (position.y < -1.0f)
    {
        position.y = 0.0f;
    }
    else
    {
        position.y -= 0.005f;
    }
    
    self.position = position;
}

// 초기화
-(id)init
{
    self = [super init];
    if (!self) return (nil);
 
    self.positionType = CCPositionTypeNormalized;
    self.scale = 0.5;
    self.zOrder = -10;

    CCSprite *bg1 = [[CCSprite alloc] initWithImageNamed:@"mond2.jpg"];

    bg1.anchorPoint = ccp(0.0, -1.025);
    bg1.position = ccp(0.0, 0.0);
    
    [self addChild:bg1];
    
    CCSprite *bg2 = [[CCSprite alloc] initWithImageNamed:@"mond2.jpg"];
    
    bg2.anchorPoint = ccp(0.0, 0.0);
    bg2.position = ccp(0.0, 0.0);
    
    [self addChild:bg2];
    
    return self;
}

@end
