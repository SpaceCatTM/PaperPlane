//
//  GameOver.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 5. 17..
//  Copyright 2014년 이강용. All rights reserved.
//

#import "GameOver.h"
#import "GameScene.h"

@implementation GameOver

-(void)initAndAddScore:(NSInteger)score
{
    CCLabelTTF *label;
    
    label = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%ld", (long)score]
                               fontName:@"Chalkduster"
                               fontSize:36.0f];
    
    label.positionType = CCPositionTypeNormalized;
    label.color = [CCColor redColor];
    label.position = CGPointMake(0.5f, 0.5f);
    
    [self addChild:label];
}

-(void)initAndAddRestartButton
{
    CCButton *restartButton = [CCButton buttonWithTitle:@"[ Restart ]" fontName:@"Verdana-Bold" fontSize:18.0f];
    
    restartButton.positionType = CCPositionTypeNormalized;
    restartButton.position = CGPointMake(0.5, 0.35);
    [restartButton setTarget:self selector:@selector(onRestartClicked:)];
    
    [self addChild:restartButton];
}

// 초기화
-(id)initWithScore:(NSInteger)score
{
    self = [super init];
    if (!self) return (nil);
    
    self.contentSize = CGSizeMake(300, 500);
    self.positionType = CCPositionTypeNormalized;
    self.position = CGPointMake(0, 0);
    
    [self initAndAddScore:score];
    [self initAndAddRestartButton];
   
    return self;
}

// 클릭 이벤트
- (void)onRestartClicked:(id)sender
{
    [[CCDirector sharedDirector] replaceScene:[GameScene scene]];
}
@end
