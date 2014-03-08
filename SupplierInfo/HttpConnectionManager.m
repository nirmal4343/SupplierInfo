//
//  HttpConnectionManager.m
//  SupplierInfo
//
//  Created by NIrmal Thakur on 9/13/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import "HttpConnectionManager.h"
#import "HttpRequest.h"

@implementation HttpConnectionManager
@synthesize   status, statusMessage;

static NSString *connectionUrl = @"http://192.168.1.73:8080/SampleSpringMVC/coffee.do";
static HttpConnectionManager *connectionMgr;

+(HttpConnectionManager *) getHTTPConnectionMgr {
    if(connectionMgr != NULL){
        return connectionMgr;
    }else{
        connectionMgr = [[HttpConnectionManager alloc] init];
        return connectionMgr;
    }
}
-(NSData *) postHttpRequest:(HttpRequest *) requestObj
{

    NSURL *url=[NSURL URLWithString:connectionUrl];
    
    NSData *postData = [[requestObj getRequestData] dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/xml" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *response = nil;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSLog(@"Response code: %d", [response statusCode]);
    return urlData;
        
}

-(NSData *) getSuppliersList:(HttpRequest *) requestObj
{

    NSString *post =[[NSString alloc] initWithFormat:@"command=view"];
    NSURL *url=[NSURL URLWithString:connectionUrl];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/xml" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
       
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *response = nil;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSLog(@"Response code: %d", [response statusCode]);
    return urlData;
    
}

- (void)dealloc {
    [connectionUrl release];
    [status release];
    [statusMessage release];
    [super dealloc];
}

@end
