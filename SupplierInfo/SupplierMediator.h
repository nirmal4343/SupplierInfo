//
//  SupplierMediator.h
//  SupplierInfo
//
//  Created by NIrmal Thakur on 9/13/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SupplierResponseVO.h"

@class ViewController;

@interface SupplierMediator : NSThread{
    
    ViewController *homeScreen;

}

- (void) submitSupplierInfo :(NSDictionary *)dict;
- (SupplierResponseVO *) getSupplierList:(NSDictionary *)dict;

@property (nonatomic,retain) UIViewController *mainScreen;
@property (nonatomic,retain) ViewController *homeScreen;

@end
