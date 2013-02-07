//
//  EffectsViewController.h
//  Spotlight
//
//  Created by Dina Li on 2/4/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"
#import "CustomHeaderView.h"

@interface EffectsViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSMutableArray *myImages;
    NSMutableArray *myDescriptions;
}

@property (strong, nonatomic) NSMutableArray *myImages;
@property (strong, nonatomic) NSMutableArray *myDescriptions;


@end
