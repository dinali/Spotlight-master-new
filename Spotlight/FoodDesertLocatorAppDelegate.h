//
//  FoodDesertLocatorDelegate.h
//  Spotlight
//
//  Created by Dina Li on 2/6/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FoodDesertLocatorViewController;

@interface FoodDesertLocatorAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FoodDesertLocatorViewController *viewController;
}

@property (strong, nonatomic) UIWindow *window;
//@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (strong, nonatomic) FoodDesertLocatorViewController *viewController;

@end

