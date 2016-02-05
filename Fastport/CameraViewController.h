//
//  CameraViewController.h
//  Fastport
//
//  Created by Syed Muaz on 11/23/14.
//  Copyright (c) 2014 team41. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"

@interface CameraViewController : UIViewController
{
    GPUImageView *view1, *view2, *view3, *view4;
    GPUImageVideoCamera *videoCamera;
}


@end
