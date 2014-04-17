//
//  AppDelegate.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 13..
//  Copyright 이강용 2014년. All rights reserved.
//
// -----------------------------------------------------------------------

#import "AppDelegate.h"
#import "DisplaySetting.h"
#import "IntroScene.h"
#import "HelloWorldScene.h"

@implementation AppDelegate

// 
-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // This is the only app delegate method you need to implement when inheriting from CCAppDelegate.
	// This method is a good place to add one time setup code that only runs when your app is first launched.
	
	// Setup Cocos2D with reasonable defaults for everything.
	// There are a number of simple options you can change.
	// If you want more flexibility, you can configure Cocos2D yourself instead of calling setupCocos2dWithOptions:.
    
	[self setupCocos2dWithOptions:@{
		// Show the FPS and draw call label.
		CCSetupShowDebugStats: @(YES),
		
		// More examples of options you might want to fiddle with:
		// (See CCAppDelegate.h for more information)
		
		// Use a 16 bit color buffer: 
        // CCSetupPixelFormat: kEAGLColorFormatRGB565,
		
        // Use a simplified coordinate system that is shared across devices.
        // CCSetupScreenMode: CCScreenModeFixed,
		
        // Run in portrait mode.
        // CCSetupScreenOrientation: CCScreenOrientationPortrait,
		
        // Run at a reduced framerate.
        // CCSetupAnimationInterval: @(1.0/30.0),
		
        // Run the fixed timestep extra fast.
        // CCSetupFixedUpdateInterval: @(1.0/180.0),
		
        // Make iPad's act like they run at a 2x content scale. (iPad retina 4x)
        // CCSetupTabletScale2X: @(YES),
	}];
	
    return YES;
}

// 사용하는 휴대폰의 화면의 사이즈에 따라서 최초로 시작되는 Scene을 선택한다.
-(CCScene *)startScene
{
    if ([DisplaySetting isWide] == YES)
    {
        return [IntroScene scene]; // 4인치
    }
    else
    {
        return [IntroScene scene]; // 3.5인치
    }
}

@end
