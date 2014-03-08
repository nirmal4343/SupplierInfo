//
//  XMLParserServerResponse.h
//  SupplierInfo
//
//  Created by NIrmal Thakur on 9/13/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Supplier.h"


@interface SupplierXMLParser : NSObject{
	NSMutableString *currentElementValue;
    NSMutableArray *suppliersList;
    Supplier *supplier;
    
}

@property (nonatomic,retain) NSMutableArray *suppliersList;
@property (nonatomic,retain) Supplier *supplier;

@end
