//
//  PassportFormViewController.m
//  Fastport
//
//  Created by Syed Muaz on 11/23/14.
//  Copyright (c) 2014 team41. All rights reserved.
//

#import "PassportFormViewController.h"

@interface PassportFormViewController ()
@property (weak, nonatomic) IBOutlet UITextField *passportNo;
@property (weak, nonatomic) IBOutlet UITextField *type;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *nric;
@property (weak, nonatomic) IBOutlet UITextField *dob;
@property (weak, nonatomic) IBOutlet UITextField *sex;
@property (weak, nonatomic) IBOutlet UITextField *pob;
@property (weak, nonatomic) IBOutlet UITextField *height;
@property (weak, nonatomic) IBOutlet UITextField *citizen;
@property (weak, nonatomic) IBOutlet UITextField *code;
@property (weak, nonatomic) IBOutlet UITextField *dateissued;
@property (weak, nonatomic) IBOutlet UITextField *dateexpiry;
@property (weak, nonatomic) IBOutlet UITextField *issueingoffice;

- (IBAction)goBack:(id)sender;
- (IBAction)goSave:(id)sender;
@end

@implementation PassportFormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)hideSignInView:(UITapGestureRecognizer*)Sender
{
    [self.name resignFirstResponder];
    [self.passportNo resignFirstResponder];
    [self.nric resignFirstResponder];
    [self.type resignFirstResponder];
    [self.code resignFirstResponder];
    [self.dob resignFirstResponder];
    [self.pob resignFirstResponder];
    [self.sex resignFirstResponder];
    [self.citizen resignFirstResponder];
    [self.height resignFirstResponder];
    [self.dateissued resignFirstResponder];
    [self.dateexpiry resignFirstResponder];
    [self.issueingoffice resignFirstResponder];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideSignInView:)];
    tap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tap];

    
    NSString *name = [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];
    [self.name setText:name];
    
    NSString *passportNo = [[NSUserDefaults standardUserDefaults] objectForKey:@"passportNo"];
    [self.passportNo setText:passportNo];
    
    [self.type setText:@"P"];
    [self.code setText:@"MYS"];
    
    [self.nric setText:@"851019105829"];
    [self.dob setText:@"19 OCT 1985"];
    [self.pob setText:@"SELANGOR"];
    [self.sex setText:@"L-M"];
    [self.citizen setText:@"MALAYSIA"];
    [self.height setText:@"177 cm"];
    [self.dateissued setText:@"21 MAY 2014"];
    [self.dateexpiry setText:@"05 NOV 2019"];
    [self.issueingoffice setText:@"KELANA JAYA"];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)goSave:(id)sender {
    [[NSUserDefaults standardUserDefaults] setObject:@"yes" forKey:@"SavedData"];
    //[self dismissViewControllerAnimated:YES completion:nil];

    [[NSUserDefaults standardUserDefaults] setObject:self.name.text forKey:@"name"];
    [[NSUserDefaults standardUserDefaults] setObject:self.passportNo.text forKey:@"passportNo"];
    [[NSUserDefaults standardUserDefaults] setObject:self.type.text forKey:@"type"];
    [[NSUserDefaults standardUserDefaults] setObject:self.code.text forKey:@"code"];
    [[NSUserDefaults standardUserDefaults] setObject:self.nric.text forKey:@"nric"];
    [[NSUserDefaults standardUserDefaults] setObject:self.dob.text forKey:@"dob"];
    [[NSUserDefaults standardUserDefaults] setObject:self.pob.text forKey:@"pob"];
    [[NSUserDefaults standardUserDefaults] setObject:self.sex.text forKey:@"sex"];
    [[NSUserDefaults standardUserDefaults] setObject:self.citizen.text forKey:@"citizen"];
    [[NSUserDefaults standardUserDefaults] setObject:self.height.text forKey:@"height"];
    [[NSUserDefaults standardUserDefaults] setObject:self.dateissued.text forKey:@"dateissued"];
    [[NSUserDefaults standardUserDefaults] setObject:self.dateexpiry.text forKey:@"dateexpiry"];
    [[NSUserDefaults standardUserDefaults] setObject:self.issueingoffice.text forKey:@"issueingoffice"];

    
    [self.navigationController popToRootViewControllerAnimated:YES];

}
@end
