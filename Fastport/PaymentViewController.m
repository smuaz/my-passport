//
//  PaymentViewController.m
//  Fastport
//
//  Created by Syed Muaz on 11/23/14.
//  Copyright (c) 2014 team41. All rights reserved.
//

#import "PaymentViewController.h"

@interface PaymentViewController ()

- (IBAction)donePayment:(id)sender;
@end

@implementation PaymentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)donePayment:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
