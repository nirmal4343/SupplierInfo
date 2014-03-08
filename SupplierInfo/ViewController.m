//
//  ViewController.m
//  SupplierInfo
//
//  Created by NIrmal Thakur on 9/13/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import "ViewController.h"
#import "SuppliersListView.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize name,phone,email,supplierMeaditor,itemList,proDialog;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
}

-(void)dismissKeyboard {
    [name resignFirstResponder];
    [phone resignFirstResponder];
    [email resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitSuppliersInfo:(id)sender {
    
    /*
    proDialog = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    proDialog.center = self.view.center;
    proDialog.frame=CGRectMake(150, 150, 16, 16);
    [proDialog startAnimating];
    [self.view addSubview:proDialog];
     */
    
    SupplierMediator *supplierMed = [[SupplierMediator alloc] init];
    self.supplierMeaditor = supplierMed;
    [supplierMed release];  
    
	[SupplierMediator detachNewThreadSelector:@selector (submitSupplierInfo:)
                                     toTarget:self.supplierMeaditor
                                   withObject:@{ @"name" : name.text, @"phone" : phone.text , @"email" :email.text }];
   
}

- (IBAction)viewSupplierInfo:(id)sender {
    
    SupplierMediator *supplierMed = [[SupplierMediator alloc] init];
    supplierMed.homeScreen = self;
    self.supplierMeaditor = supplierMed;
    self.supplierMeaditor.mainScreen = self;
    
    
    [supplierMed release];
    
    [SupplierMediator detachNewThreadSelector:@selector (getSupplierList:)
                                     toTarget:self.supplierMeaditor
                                   withObject:nil];

    
}

-(void) setSupplierList:(NSMutableArray *) list{
    NSLog(@"setting supplier list %d" , [list count]);
    self.itemList = list;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSLog(@" prepareForSegue Numbers of items %d " , [itemList count]);
    
    if([[segue identifier] isEqualToString:@"toSupplierList"]){
        
        SuppliersListView *supplierListVIEW = [segue destinationViewController];
        NSArray *myArray = [NSArray arrayWithArray:self.itemList];
        supplierListVIEW.supplierList = myArray;
        
    }
   
}
@end
