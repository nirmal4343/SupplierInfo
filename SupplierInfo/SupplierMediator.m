//
//  SupplierMediator.m
//  SupplierInfo
//
//  Created by NIrmal Thakur on 9/13/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import "SupplierMediator.h"
#import "HttpRequest.h"
#import "HttpConnectionManager.h"
#import "SupplierXMLParser.h"

@implementation SupplierMediator

@synthesize mainScreen,homeScreen;

- (void) submitSupplierInfo :(NSDictionary *)dict{
    
    NSLog(@" Name ** %@  " , dict[@"name"]);
    NSLog(@" Phone ** %@  " , dict[@"phone"]);
    NSLog(@" Email ** %@  " , dict[@"email"]);
    
    HttpRequest *requestObject = [[HttpRequest alloc] init];
    [requestObject addParam:@"supplierName" addValue:dict[@"name"]];
    [requestObject addParam:@"phone" addValue:dict[@"phone"]];
    [requestObject addParam:@"email" addValue:dict[@"email"]];
    [requestObject addParam:@"command" addValue:@"submit"];
    
    HttpConnectionManager * httpConn = [HttpConnectionManager getHTTPConnectionMgr];
    NSData *response = [httpConn postHttpRequest:requestObject];
    
    
    
    NSString *string = [[[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding] autorelease];
   
    
    NSRange range = [[NSString stringWithFormat:@"%@",string] rangeOfString:@"success"];
    
    if (range.location != NSNotFound) {
        [self performSelectorOnMainThread:@selector(showSuccess) withObject:nil waitUntilDone:NO];
    }
    else{
        [self performSelectorOnMainThread:@selector(showFail) withObject:nil waitUntilDone:NO];
    }
    
}
    // Success dialog box
-(void) showSuccess{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Supplier information"
                                                             message:@"Successfully submit!!"
                                                            delegate:nil
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
    [alert show];
    [alert release];
}
    // Failure dialog box
-(void) showFail{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Supplier information"
                                                    message:@"Failed!!"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

    // get SupplierList implementation

-(SupplierResponseVO *) getSupplierList:(NSDictionary *)dict{

    
    NSLog(@"Pulling suppliers list");
    
    
    HttpRequest *requestObject = [[HttpRequest alloc] init];
    [requestObject addParam:@"command" addValue:@"view"];
    
    HttpConnectionManager * httpConn = [HttpConnectionManager getHTTPConnectionMgr];
    NSData *response = [httpConn getSuppliersList:requestObject];
    
    // * Start parsing the list
    
    //  NSString *string = [[[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding] autorelease];
    //NSLog(@"** Response Received  *** %@ " , string);

    if(response != nil){
     NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:response];
    
     SupplierXMLParser *supplierParser = [[SupplierXMLParser alloc] init];
    
    // Set deligate
    [xmlParser setDelegate:supplierParser];
    
    //Start parsing the XML file.
    BOOL success = [xmlParser parse];
    
    //NSLog(@"Numbers of items %d " , [[supplierParser suppliersList] count]);
    if (success) {
         [self performSelectorOnMainThread:@selector(showList:) withObject:[supplierParser suppliersList] waitUntilDone:NO];
    }
    }
    return NULL;
}

-(void) showList:(NSMutableArray *) items{
    [homeScreen setSupplierList:items];
    [mainScreen performSegueWithIdentifier:@"toSupplierList" sender:self];
}

@end
