//
//  CameraViewController.m
//  Fastport
//
//  Created by Syed Muaz on 11/23/14.
//  Copyright (c) 2014 team41. All rights reserved.
//

#import "CameraViewController.h"
#import "ReviewViewController.h"

@interface CameraViewController ()

@end

@implementation CameraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)loadView
{
    CGRect mainScreenFrame = [[UIScreen mainScreen] applicationFrame];
	UIView *primaryView = [[UIView alloc] initWithFrame:mainScreenFrame];
    primaryView.backgroundColor = [UIColor blueColor];
	self.view = primaryView;
    
    videoCamera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPreset640x480 cameraPosition:AVCaptureDevicePositionBack];
    videoCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    
    CGFloat halfWidth = round(mainScreenFrame.size.width / 2.0);
    CGFloat halfHeight = round(mainScreenFrame.size.height / 2.0);
    view1 = [[GPUImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, halfWidth, halfHeight)];
    view2 = [[GPUImageView alloc] initWithFrame:CGRectMake(halfWidth, 0.0, halfWidth, halfHeight)];
    view3 = [[GPUImageView alloc] initWithFrame:CGRectMake(0.0, halfHeight, halfWidth, halfHeight)];
    view4 = [[GPUImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    [self.view addSubview:view4];
    
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"camera.png"]];
    [self.view addSubview:img];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(takePhoto:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(123.0, 440.0, 78.0, 83.0);
    [self.view addSubview:button];
    
    GPUImageGrayscaleFilter *filter3 = [[GPUImageGrayscaleFilter alloc] init];
    [filter3 forceProcessingAtSize:view4.sizeInPixels];
    [videoCamera addTarget:filter3];
    [filter3 addTarget:view4];
    
    [videoCamera startCameraCapture];
}

-(void)takePhoto:(id)sender
{
    GPUImageStillCamera *stillCamera = [[GPUImageStillCamera alloc] init];
    stillCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    
    GPUImageGammaFilter *filter = [[GPUImageGammaFilter alloc] init];
    [stillCamera addTarget:filter];
    GPUImageView *filterView = (GPUImageView *)self.view;
    [filter addTarget:filterView];
    
    [stillCamera startCameraCapture];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
@end
