//
//  FoodDesertLocatorViewController.h
//  Spotlight
//  Description: display the Food Desert Locator
//  Note: this has a lot of frameworks, custom bundle, etc. See the ArcGIS Runtime SDK for iOS
//  Created by Dina Li on 2/6/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//  Deployment ESRI requirements: http://resources.arcgis.com/en/help/runtime-ios-sdk/concepts/index.html#Deploying_your_application/00pw00000065000000/

// start here: http://resources.arcgis.com/en/help/runtime-ios-sdk/concepts/index.html#/What_s_new_in_version_10_1_1/00pw00000067000000/
// need to delete and re-install package to get latest 10.1.1

#import <UIKit/UIKit.h>
#import <ArcGIS/ArcGIS.h>
//#import <MapKit/MapKit.h>

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

// MKMapViewDelegate: if using the Apple mapkit instead of ESRI
// formerly AGSMapViewLayerDelegate
@interface FoodDesertLocatorViewController : UIViewController <AGSLayerDelegate> {
	
	//container for map layers
	AGSMapView *_mapView;  // this has to have the _ prefix!
   // MKMapView *mapView;
	
	//this map has a dynamic layer, need a view to act as a container for it
	//AGSDynamicMapServiceLayer *dynamicLayer;
	//UIView *dynamicLayerView;
}

//map view is an outlet so we can associate it with UIView
//in IB
@property (nonatomic, retain) IBOutlet AGSMapView *mapView;  // this does not have the _
@property (nonatomic, assign) AGSDynamicMapServiceLayer *dynamicLayer;
@property (nonatomic, assign) UIView *dynamicLayerView;

- (IBAction)opacitySliderValueChanged:(id)sender;

@end

