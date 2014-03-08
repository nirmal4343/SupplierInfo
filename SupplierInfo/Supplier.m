//
//  Supplier.m
//  SupplierInfo
//
//  Created by NIrmal Thakur on 9/15/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import "Supplier.h"

@implementation Supplier

@synthesize supplierName,phone,email;



-(void)dealloc{

    [supplierName release];
    [phone release];
    [email release];
    [super dealloc];
}

@end
