//
//  FoodDesertLocatorViewController.m
//  Spotlight
//
//  Created by Dina Li on 2/6/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

#import "FoodDesertLocatorViewController.h"

@interface FoodDesertLocatorViewController ()

@end

@implementation FoodDesertLocatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// set the delegate for the map view
	_ERSmapView.layerDelegate = self;
	
	//create an instance of a tiled map service layer
    AGSTiledMapServiceLayer *tiledLayer = [[AGSTiledMapServiceLayer alloc] initWithURL:[NSURL URLWithString:kTiledMapServiceURL]];
	
	//Add it to the map view
	[self.ERSmapView addMapLayer:tiledLayer withName:@"Tiled Layer"];
    
	//Add it to the map view
    self.dynamicLayer = [[AGSDynamicMapServiceLayer alloc] initWithURL:[NSURL URLWithString:kDynamicMapServiceURL]];
	
	//set visible layers
	self.dynamicLayer.visibleLayers = [NSArray arrayWithObjects:[NSNumber numberWithInt:2], nil];
	
	//name the layer. This is the name that is displayed if there was a property page, tocs, etc...
	[self.ERSmapView addMapLayer:self.dynamicLayer withName:@"Dynamic Layer"];
	
	//set transparency
	self.dynamicLayer.opacity = 0.2;
    
    NSLog(@"after adding mapLayer");
    NSLog(@"URL = %@", kDynamicMapServiceURL);
    NSLog(@"URL = %@", kTiledMapServiceURL);
	
}

#pragma mark AGSMapViewLayerDelegate methods

-(void) mapViewDidLoad:(AGSMapView*)mapView {
    
	// comment to disable the GPS on start up
	[self.ERSmapView.locationDisplay startDataSource];
    self.ERSmapView.locationDisplay.autoPanMode = AGSLocationDisplayAutoPanModeDefault;
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (IBAction)opacitySliderValueChanged:(id)sender {
	// set the layer's opacity based on the value of the slider
	self.dynamicLayer.opacity = ((UISlider *)sender).value;
}


@end
