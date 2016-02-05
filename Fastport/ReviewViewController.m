//
//  ReviewViewController.m
//  Fastport
//
//  Created by Syed Muaz on 11/23/14.
//  Copyright (c) 2014 team41. All rights reserved.
//

#import "ReviewViewController.h"
#import "PaymentViewController.h"

@interface ReviewViewController () {
    UIImagePickerController *photoPicker;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;

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
- (IBAction)goSubmit:(id)sender;
@end

@implementation ReviewViewController

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
    [self.scrollView setContentSize:CGSizeMake(320, 653)];
    
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
    //[self.dateissued setText:@"21 MAY 2014"];
    //[self.dateexpiry setText:@"05 NOV 2019"];
    //[self.issueingoffice setText:@"KELANA JAYA"];

    
    UIView *overlayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    // important - it needs to be transparent so the camera preview shows through!
    overlayView.opaque=NO;
    overlayView.backgroundColor=[UIColor clearColor];
    
    // parent view for our overlay
    UIView *cameraView=[[UIView alloc] initWithFrame:self.view.bounds];
    
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"camera.png"]];
    [cameraView addSubview:img];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(shootPicture) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(123.0, 440.0, 78.0, 83.0);
    [overlayView addSubview:button];
    
    [cameraView addSubview:overlayView];
    
    photoPicker = [[UIImagePickerController alloc] init];
    
    photoPicker.delegate = self;
    photoPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    // hide the camera controls
    photoPicker.showsCameraControls=NO;
    [photoPicker setCameraOverlayView:cameraView];
    
    [self presentViewController:photoPicker animated:YES completion:NULL];
    

}

-(void) shootPicture {
    NSLog(@"shoot pic");
    [photoPicker takePicture];
}

- (void)imagePickerController:(UIImagePickerController *)photoPicker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *selectedImage = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    GPUImageFilter *selectedFilter;
    selectedFilter = [[GPUImageGrayscaleFilter alloc] init];


    UIImage *filteredImage = [selectedFilter imageByFilteringImage:selectedImage];
    [self.profileImage setImage:filteredImage];

    //[self.profileImage setImage:selectedImage];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)goSubmit:(id)sender {
    PaymentViewController *vc = [[PaymentViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    vc = nil;
    
}
@end
