//
//  ViewController.m
//  Fastport
//
//  Created by Syed Muaz on 11/23/14.
//  Copyright (c) 2014 team41. All rights reserved.
//

#import "ViewController.h"
#import "PassportFormViewController.h"
#import "CameraViewController.h"
#import "ReviewViewController.h"
#import "RunOCRViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *detailsView;
@property (weak, nonatomic) IBOutlet UILabel *jenisLabel;
@property (weak, nonatomic) IBOutlet UILabel *kodLabel;
@property (weak, nonatomic) IBOutlet UILabel *passportNoLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *warganegaraLabel;
@property (weak, nonatomic) IBOutlet UILabel *nricLabel;
@property (weak, nonatomic) IBOutlet UILabel *dobLabel;
@property (weak, nonatomic) IBOutlet UILabel *pobLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightsLabel;
@property (weak, nonatomic) IBOutlet UILabel *issuedLabel;
@property (weak, nonatomic) IBOutlet UILabel *expiryLabel;
@property (weak, nonatomic) IBOutlet UILabel *officeLabel;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIImageView *addButtonImage;

- (IBAction)openMenu:(id)sender;
- (IBAction)reminderExpiry:(id)sender;
- (IBAction)goBack:(id)sender;
- (IBAction)goRenew:(id)sender;
- (IBAction)goEdit:(id)sender;
- (IBAction)goAdd:(id)sender;
- (IBAction)goAddPage:(id)sender;


- (void)transitionType:(NSString *)type direction:(NSString *)direction duration:(CFTimeInterval)time for:(CALayer *)layer;
- (void)fadeAnim:(UIView *)object duration:(NSTimeInterval)time alpha:(float)alpha;
- (void)slideAnim:(UIView *)object duration:(NSTimeInterval)time alpha:(float)alpha positionX:(int)intX positionY:(int)intY;


@end

@implementation ViewController


- (void)transitionType:(NSString *)type direction:(NSString *)direction duration:(CFTimeInterval)time for:(CALayer *)layer
{
    CATransition *transition1 = [CATransition animation];
    transition1.duration = time;
    transition1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    transition1.type = type;
    transition1.subtype = direction;
    [layer addAnimation:transition1 forKey:nil];
}

-(void)fadeAnim:(UIView *)object duration:(NSTimeInterval)time alpha:(float)alpha
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:time];
    
    [object setAlpha:alpha];
    
    [UIView commitAnimations];
    
    
}

-(void)slideAnim:(UIView *)object duration:(NSTimeInterval)time alpha:(float)alpha positionX:(int)intX positionY:(int)intY
{
    [object setAlpha:alpha];
    
    CGRect frame = object.frame;
    frame.origin.x = intX;
    frame.origin.y = intY;
    
    [UIView beginAnimations:nil context:nil];
    
    object.frame = frame;
    
    [UIView commitAnimations];
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"viewdidappear");
    
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"SavedData"];
    if ([str isEqualToString:@"yes"]) {
        [self.addButton setHidden:YES];
        [self.addButtonImage setHidden:YES];
        
        self.nameLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];
        self.passportNoLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"passportNo"];
        self.jenisLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"type"];
        self.kodLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"code"];
        self.nricLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"nric"];
        self.dobLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"dob"];
        self.pobLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"pob"];
        self.sexLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"sex"];
        self.warganegaraLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"citizen"];
        self.heightsLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"height"];
        self.issuedLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"dateissued"];
        self.expiryLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"dateissued"];
        self.officeLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"issueingoffice"];
        
        [self.detailsView setHidden:NO];

        self.detailsView.transform = CGAffineTransformMakeRotation(-M_PI / 2);
        [self.detailsView setFrame:CGRectMake(324, 0, 320, 568)];
        
        [[NSUserDefaults standardUserDefaults] setObject:@"no" forKey:@"SavedData"];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.scrollView setContentSize:CGSizeMake(960, 568)];
    [self.scrollView setPagingEnabled:YES];
    
    
    self.detailsView.transform = CGAffineTransformMakeRotation(-M_PI / 2);
    [self.detailsView setFrame:CGRectMake(320, 0, 320, 568)];
    [self.detailsView setHidden:YES];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openMenu:(id)sender {
    [self fadeAnim:self.menuButton duration:1.0 alpha:0];
    [self slideAnim:self.menuView duration:2.0 alpha:1.0 positionX:538 positionY:7];

}

- (IBAction)reminderExpiry:(id)sender {
}

- (IBAction)goBack:(id)sender {
    [self fadeAnim:self.menuButton duration:1.0 alpha:1];
    [self slideAnim:self.menuView duration:2.0 alpha:1.0 positionX:538 positionY:-218];
}

- (IBAction)goRenew:(id)sender {
    
    ReviewViewController *vc = [[ReviewViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    vc = nil;
}

- (IBAction)goEdit:(id)sender {
    PassportFormViewController *vc = [[PassportFormViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    vc = nil;

}

- (IBAction)goAdd:(id)sender {
    [self.scrollView setContentOffset:CGPointMake(640, 0) animated:YES];
}

- (IBAction)goAddPage:(id)sender {
    RunOCRViewController *vc = [[RunOCRViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    vc = nil;
    
}
@end
