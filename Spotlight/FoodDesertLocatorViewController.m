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

@synthesize mapView = _mapView;
@synthesize dynamicLayer = _dynamicLayer, dynamicLayerView = _dynamicLayerView;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// set the delegate for the map view
	_mapView.layerDelegate = self;
	
	//create an instance of a tiled map service layer
	AGSTiledMapServiceLayer *tiledLayer = [[AGSTiledMapServiceLayer alloc] initWithURL:[NSURL URLWithString:kTiledMapServiceURL]];
    
	//Add it to the map view
    
    //Now
    AGSLayer* layer = [self.mapView mapLayerForName:@"Tiled Layer"];
    
  //AGSLayer
 //   UIView <AGSLayer> *lyer = [_mapView addMapLayer:tiledLayer withName:@"Tiled Layer"];
        // Setting these two properties lets the map draw while still performing a zoom/pan
       
           // lyr.drawDuringPanning = YES; crashes here
           // lyr.drawDuringZooming = YES;
    NSLog(@"after adding mapLayer");
    NSLog(@"URL = %@", kDynamicMapServiceURL);
    
    // no more AGSLayerView
    
	//create an instance of a dynmaic map layer
	self.dynamicLayer = [[AGSDynamicMapServiceLayer alloc] initWithURL:[NSURL URLWithString:kDynamicMapServiceURL]];
	
	//set visible layers - index is the layer number
	self.dynamicLayer.visibleLayers = [NSArray arrayWithObjects:[NSNumber numberWithInt:3], nil];
	
	//name the layer. This is the name that is displayed if there was a property page, tocs, etc...
	self.dynamicLayerView = [self.mapView addMapLayer:self.dynamicLayer withName:@"ERS - Food Availability"];
	
	//set transparency
	self.dynamicLayerView.alpha = 0.5;
	
	AGSSpatialReference *sr = [AGSSpatialReference spatialReferenceWithWKID:4326];
	double xmin, ymin, xmax, ymax;
	xmin = -125.33203125;
	ymin = -1.58203125;
	xmax = -69.08203125;
	ymax = 79.27734375;
	
	// zoom to the United States
	AGSEnvelope *env = [AGSEnvelope envelopeWithXmin:xmin ymin:ymin xmax:xmax ymax:ymax spatialReference:sr];
	[self.mapView zoomToEnvelope:env animated:YES];
	
}

// deprecated
//- (void) mapView:(AGSMapView*) mapView didLoadLayerForLayerView:(UIView<AGSLayerView>*) layerView {
//  	NSLog(@"Layer added successfully");
//}
//
//- (void) mapView:(AGSMapView*) mapView  failedLoadingLayerForLayerView:(UIView<AGSLayerView>*) layerView withError:(NSError*) error {
//    NSLog(@"Error: %@",error);
//}

//3. Implement method for success
- (void) layerDidLoad:(AGSLayer*) layer{
    NSLog(@"Layer added successfully");
}

//4. Implement method for error
- (void) layer:(AGSLayer*) layer didFailToLoadWithError:(NSError*)error{
    NSLog(@"Error: %@",error);
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

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (IBAction)opacitySliderValueChanged:(id)sender {
	// set the layer's opacity based on the value of the slider
	self.dynamicLayerView.alpha = ((UISlider *)sender).value;
}


#pragma mark AGSMapViewLayerDelegate methods

-(void) mapViewDidLoad:(AGSMapView*)mapView {
    
	// comment to disable the GPS on start up
	[self.mapView.gps start];
}

@end
