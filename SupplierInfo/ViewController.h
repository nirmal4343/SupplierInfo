//
//  ViewController.h
//  SupplierInfo
//
//  Created by NIrmal Thakur on 9/13/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SupplierMediator.h"

@interface ViewController : UIViewController {
    
    SupplierMediator *supplierMeaditor;
    IBOutlet UITextField *name;
    IBOutlet UITextField *phone;
    IBOutlet UITextField *email;
    UIActivityIndicatorView *proDialog;
    NSMutableArray * itemList;
}

@property (nonatomic,retain) IBOutlet UITextField *name;
@property (nonatomic,retain) IBOutlet UITextField *phone;
@property (nonatomic,retain) IBOutlet UITextField *email;
@property (nonatomic,retain) SupplierMediator *supplierMeaditor;
@property (nonatomic,retain) NSMutableArray *itemList;
@property (nonatomic,retain) UIActivityIndicatorView * proDialog;

- (IBAction)submitSuppliersInfo:(id)sender;
- (IBAction)viewSupplierInfo:(id)sender;
- (void) setSupplierList:(NSMutableArray *) list;

@end
		