//
//  FoodDesertLocatorDelegate.m
//  Spotlight
//
//  Created by Dina Li on 2/6/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

#import "FoodDesertLocatorAppDelegate.h"
#import "FoodDesertLocatorViewController.h"

@implementation FoodDesertLocatorAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    // Override point for customization after app launch
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}
@end
