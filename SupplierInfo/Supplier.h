//
//  Supplier.h
//  SupplierInfo
//
//  Created by NIrmal Thakur on 9/15/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Supplier : NSObject{
    
    NSString *supplierName;
    NSString *phone;
    NSString *email;
}

@property (nonatomic,retain) NSString *supplierName;
@property (nonatomic,retain) NSString *phone;
@property (nonatomic,retain) NSString *email;
    

@end
	