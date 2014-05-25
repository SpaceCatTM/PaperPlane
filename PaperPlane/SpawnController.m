//
//  SpawnController.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 26..
//  Copyright 2014년 이강용. All rights reserved.
//

#import "SpawnController.h"
#import "ObstacleDelegate.h"

#import "Meteor.h"
#import "Bomb.h"
#import "Wind.h"

#import "GameSetting.h"

@implementation SpawnController

-(void)addSpawnObject:(id)object
{
    [_spawnObjects addObject:object];
    [self.parent addChild:object];
}

-(void)removeSpawnObject:(id)object
{
    if ([_spawnObjects containsObject:object] == YES)
    {
        [_spawnObjects removeObject:object];
        [object removeFromParentAndCleanup:YES];
    }
}

struct Temp
{
    CGPoint spawnPosition;
};

static struct Temp P1[] =
{
    {0.1, 1.1},
    {0.1, 1.3},
    {0.1, 1.5},
    {0.1, 1.7},
    {0.1, 1.9}
};

static struct Temp P2[] =
{
    {0.1, 1.1},
    {0.1, 1.3},
    {0.5, 1.5},
    {0.7, 1.7},
    {0.9, 1.9}
};

-(void)spawnObject
{
    if ([_spawnObjects count] <= 3)
    {
        {
            Wind *object1 = [Wind node];
            object1.speed = GameSetting.windSpeed;

            Wind *object2 = [Wind node];
            object2.speed = -GameSetting.windSpeed;

            // 객체를 리스트에 추가한다.
            [self addSpawnObject:object1];
            [object1 spawn:ccp(0.0, 0.3)];

            [self addSpawnObject:object2];
            [object2 spawn:ccp(1.0, 0.6)];
        }
        
        NSInteger spawnPatturn = arc4random() % 2;
        
        if (spawnPatturn == 0)
        {
            for (NSInteger index = 0; index < sizeof(P1) / sizeof(struct Temp); index++)
            {
                Meteor *meteor = [Meteor node];
            
                // 객체를 리스트에 추가한다.
                [self addSpawnObject:meteor];
                [meteor spawn:P1[index].spawnPosition];
            }
        }
        else
        {
            for (NSInteger index = 0; index < sizeof(P2) / sizeof(struct Temp); index++)
            {
                Bomb *object = [Bomb node];
         
                // 객체를 리스트에 추가한다.
                [self addSpawnObject:object];
                [object spawn:P2[index].spawnPosition];
            }
        }
    }
}

-(void)startSpawn
{
    [self schedule:@selector(spawnObject) interval:0.5];
}

-(void)stopSpawn
{
    [self unschedule:@selector(spawnObject)];
}

-(id)init
{
    self = [super init];
    if (!self) return (nil);
    
    _spawnObjects = [NSMutableArray new];
    
    return self;
}

-(void)update:(CCTime)delta
{
    for (CCNode *object in _spawnObjects)
    {
        if (object.position.y < 0.0f)
        {
            [self removeSpawnObject:object];
            return;
        }
        else if (object.position.x < 0.0f || object.position.x > 1.0f)
        {
            [self removeSpawnObject:object];
            return;
        }
        else
        {
            [(id <ObstacleDelegate>)object move];
        }
    }
}
@end
