//
//  OverviewViewController.m
//  Spotlight
//
//  Created by Dina Li on 1/31/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

#import "OverviewViewController.h"

@interface OverviewViewController ()

@end

@implementation OverviewViewController


// nav bar designer: Jonathan Mulkey

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    if([[UINavigationBar class] respondsToSelector:@selector(appearance)]) //iOS >=5.0
    {
        // one image should be smaller for landscape versus portrait
        // TODO: appears on next page
      //  [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"CustomNavBG@2x.png"] forBarMetrics:UIBarMetricsDefault];
        
      //  [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nCustomNavBG.png"] forBarMetrics:UIBarMetricsLandscapePhone];
    }
    
    // UIImage resizableImageWithCapInsets: use to change the size of the image dynamically

}

- (void) viewDidAppear:(BOOL)animated
{
//    if([[UINavigationBar class] respondsToSelector:@selector(appearance)]) //iOS >=5.0
//    {
//        // one image should be smaller for landscape versus portrait
//        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"CustomNavBG@2x.png"] forBarMetrics:UIBarMetricsDefault];
//        
//        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nCustomNavBG.png"] forBarMetrics:UIBarMetricsLandscapePhone];
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
