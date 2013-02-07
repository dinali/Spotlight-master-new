//
//  CollectionViewCell.m
//  Spotlight
//
//  Created by Dina Li on 2/4/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

@synthesize imageView = _imageView;
@synthesize descriptionLabel = _descriptionLabel;
//@synthesize descriptionTextView = _descriptionTextView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
