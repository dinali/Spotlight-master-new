//
//  FoodDesertLocatorViewController.h
//  Spotlight
//  Description: display the Food Desert Locator
//  Note: this has a lot of frameworks, custom bundle, etc. See the ArcGIS Runtime SDK for iOS
//  Created by Dina Li on 2/6/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ArcGIS/ArcGIS.h>

//contants for data layers - ERS data layers are only dynamic
#define kTiledMapServiceURL @"http://server.arcgisonline.com/ArcGIS/rest/services/ESRI_StreetMap_World_2D/MapServer"
// #define kDynamicMapServiceURL @"http://sampleserver1.arcgisonline.com/ArcGIS/rest/services/Specialty/ESRI_StateCityHighway_USA/MapServer"

// Food Availability
//#define kDynamicMapServiceURL @"http://gis.ers.usda.gov/ArcGIS/rest/services/fa_access/MapServer"

// Food Desert Locator

#define kDynamicMapServiceURL @"http://gis.ers.usda.gov/ArcGIS/rest/services/FoodDesert_6529/MapServer"

// http://gis.ers.usda.gov/ArcGIS/rest/services/ra_People/MapServer
// http://gis.ers.usda.gov/ArcGIS/rest/services/fa_access/MapServer

//Set up constant for predefined where clause for search
#define kLayerDefinitionFormat @"STATE_NAME = '%@'"


@interface FoodDesertLocatorViewController : UIViewController <AGSMapViewLayerDelegate> {
	
	//container for map layers
	AGSMapView *_mapView;
	
	//this map has a dynamic layer, need a view to act as a container for it
	//AGSDynamicMapServiceLayer *_dynamicLayer;
	//UIView *_dynamicLayerView;
}

//map view is an outlet so we can associate it with UIView
//in IB
@property (nonatomic, retain) IBOutlet AGSMapView *mapView;
@property (nonatomic, assign) AGSDynamicMapServiceLayer *dynamicLayer;
@property (nonatomic, assign) UIView *dynamicLayerView;

- (IBAction)opacitySliderValueChanged:(id)sender;

@end

