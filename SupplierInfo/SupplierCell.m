//
//  SupplierCell.m
//  SupplierInfo
//
//  Created by NIrmal Thakur on 9/15/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import "SupplierCell.h"

@implementation SupplierCell
@synthesize SupplierEmail,SupplierName,SupplierPhone;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
