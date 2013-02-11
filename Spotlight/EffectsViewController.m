//
//  EffectsViewController.m
//  Spotlight
//
//  Created by Dina Li on 2/4/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

#import "EffectsViewController.h"

@interface EffectsViewController ()

@end

@implementation EffectsViewController

@synthesize myDescriptions = _myDescriptions;
@synthesize myImages = _myImages;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

/* load the images and description */
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _myImages = [@[@"Background1.tiff",
                      @"Background2.tiff",
                      @"Background3.tiff"] mutableCopy];
    _myDescriptions = [@[@"Agriculture accounts for 7% of US greenhouse gas emissions in 2008",
                       @"Agriculture is a major source of methane and nitrous oxide",
                       @"Agriculture and forestry offset 34% of national greenhouse gas emssions"] mutableCopy];
}
#pragma mark -
#pragma mark UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:
(UICollectionView *)collectionView
{
    return 1;
}

- (void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return _myImages.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *myCell = [collectionView
                                    dequeueReusableCellWithReuseIdentifier:@"Cell"
                                    forIndexPath:indexPath];
    
    UIImage *image;
    int row = [indexPath row];
    
    image = [UIImage imageNamed:_myImages[row]];
    
    NSLog(@"_myDescriptions[row] = %@", _myDescriptions[row]);
    
    myCell.descriptionLabel.text = _myDescriptions[row];
    myCell.imageView.image = image;
    
    return myCell;
}

#pragma mark -
#pragma mark UICollectionViewFlowLayoutDelegate
/* this works but then the labels don't line up with the images */

//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    UIImage *image;
//    int row = [indexPath row];
//    
//    image = [UIImage imageNamed:_myImages[row]];
//    
//    return image.size;
//}

// test on real device first, image disappears on click
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewFlowLayout *myLayout =
    [[UICollectionViewFlowLayout alloc]init];
    
    myLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self.collectionView setCollectionViewLayout:myLayout animated:YES];
}

#pragma mark -
#pragma mark Section header

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CustomHeaderView *header = nil;
    
    if ([kind isEqual:UICollectionElementKindSectionHeader])
    {
        header = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                    withReuseIdentifier:@"MyHeader"
                                                           forIndexPath:indexPath];
        
       header.sectionTitleLabel.text = @"  How does US agriculture impact climate change?";
    }
    return header;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
