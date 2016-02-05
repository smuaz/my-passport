//
//  RunOCRViewController.m
//  Fastport
//
//  Created by Syed Muaz on 11/23/14.
//  Copyright (c) 2014 team41. All rights reserved.
//

#import "RunOCRViewController.h"
#import "RunOCRViewController.h"
#import "RecognitionViewController.h"
#import "AppDelegate.h"

@interface RunOCRViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)process:(id)sender;
@end

@implementation RunOCRViewController

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
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
	imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
    
	imagePicker.delegate = self;
	
	[self presentViewController:imagePicker animated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	
    UIImage *selectedImage = [info valueForKey:UIImagePickerControllerOriginalImage];

    [self dismissViewControllerAnimated:YES completion:nil];
	
    self.imageView.image = selectedImage;

	//self.imageView.image = image;
	[(AppDelegate*)[[UIApplication sharedApplication] delegate] setImageToProcess:selectedImage];
    
    RecognitionViewController *vc = [[RecognitionViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    vc = nil;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)process:(id)sender {
    RecognitionViewController *vc = [[RecognitionViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    vc = nil;
}
@end
