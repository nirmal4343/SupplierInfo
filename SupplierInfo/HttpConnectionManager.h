//
//  HttpConnectionManager.h
//  SupplierInfo
//
//  Created by NIrmal Thakur on 9/13/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HttpRequest;
@class XMLParserServerResponse;

@interface HttpConnectionManager : NSObject{

    NSString *status;
    NSString *statusMessage;
}

@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSString *statusMessage;

-(NSData *) postHttpRequest:(HttpRequest *) requestObj;
-(NSData *) getSuppliersList:(HttpRequest *) requestObj;

+(HttpConnectionManager *) getHTTPConnectionMgr;

@end
