//
//  SupplierResponseVO.h
//  SupplierInfo
//
//  Created by NIrmal Thakur on 9/13/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SupplierResponseVO : NSObject {
    NSString *responseCode;
    NSString * responseMessage;
    NSMutableArray *supplierList;
}

@property (nonatomic,retain)NSString * responseCode;
@property (nonatomic,retain)NSString * responseMessage;
@property (nonatomic,retain)NSMutableArray *supplierList;


@end
