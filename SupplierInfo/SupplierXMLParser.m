//
//  XMLParserServerResponse.m
//  SupplierInfo
//
//  Created by NIrmal Thakur on 9/13/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import "SupplierXMLParser.h"

@implementation SupplierXMLParser

@synthesize suppliersList,supplier;


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
            namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
            attributes:(NSDictionary *)attributeDict {
    
    
    if([elementName isEqualToString:@"suppliers"]) {
        //Initialize the array.
        suppliersList = [[NSMutableArray alloc] init];
    }
    else if([elementName isEqualToString:@"supplier"]) {
        
        //Initialize the Supplier.
        supplier = [[Supplier alloc] init];
        
        //Extract the attribute here.

        
        NSLog(@"Reading id value :%@", [supplier supplierName]);
    }
    
    NSLog(@"Processing Element: %@", elementName);
    

}



- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	
    
	if(!currentElementValue)
		currentElementValue = [[NSMutableString alloc] initWithString:string];
	else
		[currentElementValue appendString:string];
    
	  NSLog(@"Processing Value: %@", currentElementValue);
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if([elementName isEqualToString:@"supplier"])
	{
        [suppliersList addObject:supplier];
	}
   
	else if([elementName isEqualToString:@"supplier-name"]) {
        supplier.supplierName = currentElementValue;
        
	}
    
	else if([elementName isEqualToString:@"phone"]) {
        supplier.phone = currentElementValue;
        
	}
    
	else if([elementName isEqualToString:@"email"]) {
        supplier.email = currentElementValue;
        
	}
        [currentElementValue release];
        currentElementValue = nil;
    
    

}

- (void) dealloc {
	
	[currentElementValue release];
    [suppliersList release];
    [supplier release];
	[super dealloc];
}

@end
