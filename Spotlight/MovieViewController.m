//
//  MovieViewController.m
//  Spotlight
//
//  Created by Dina Li on 2/6/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

#import "MovieViewController.h"

@implementation MovieViewController

@synthesize moviePlayer;
@synthesize descriptionLabel = _descriptionLabel;
@synthesize logoView = _logoView;
@synthesize youTubeView = _youTubeView;


-(void) embedYouTube{
    
    // NOTE the strange format of the YouTube URL!
   // NSString *video_ID = @"vGOrvTTuwJc";  // ERS Food Prices video on YouTube
    NSString *video_ID = @"NuMSALx7mFs";
    
    NSString *htmlStr = [NSString stringWithFormat:@"<iframe class=\"youtube-player\" type=\"text/html\" width=\"750\" height=\"640\"src=\"http://www.youtube.com/embed/%@\" frameborder=\"0\"></iframe>",video_ID];
    
    [_youTubeView loadHTMLString:htmlStr baseURL:nil];
}

-(void) viewDidLoad{
    [self embedYouTube];
}


@end
