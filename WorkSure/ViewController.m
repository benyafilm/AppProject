//
//  ViewController.m
//  WorkSure
//
//  Created by Anunya Sukitjanuparp on 9/9/2557 BE.
//  Copyright (c) 2557 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import <CoreImage/CoreImage.h>
#import <CoreImage/CoreImage.h>
#import <QuartzCore/QuartzCore.h>


@interface ViewController ()

@end

@implementation ViewController
@synthesize sourceImage;


- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
    
    //This works better
      //sourceImage = [UIImage imageNamed:@"forP.jpg"];
    UIImage *img1 = [self imageWithImage:sourceImage scaledToSize:CGSizeMake(270, 270)];
    [_img setImage:img1];
    //UIImage *bus0o = [UIImage imageNamed:@"cupopbus_bus-00"];
    
         UIImage* flippedImage = [UIImage imageWithCGImage:img1.CGImage
                                                scale:sourceImage.scale
                                          orientation:UIImageOrientationDownMirrored];
    [_img2 setImage:flippedImage];
    //[self.view performSelectorInBackground:@selector(markFaces:) withObject:_img];
    [self markFaces:_img];
    [_img2 setTransform:CGAffineTransformMakeScale(1, -1)];
    _img.hidden = YES;
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)faceDetector:(UIImageView *)facePicture
{
    // Load the picture for face detection
//    UIImageView* image = [[UIImageView alloc] initWithImage://[UIImage imageNamed:@"facedetectionpic.jpg"]];
//                          [UIImage imageNamed:@"people.jpg"]];
    
    // Draw the face detection image
   // [self.view addSubview:facePicture];
    
    // Execute the method used to markFaces in background
    [self.view performSelectorInBackground:@selector(markFaces:) withObject:facePicture];
    
    // flip image on y-axis to match coordinate system used by core image
   //[facePicture setTransform:CGAffineTransformMakeScale(1, -1)];
    
    // flip the entire window to make everything right side up
    //[self.view setTransform:CGAffineTransformMakeScale(1, -1)];
    
    
}

-(void)markFaces:(UIImageView *)facePicture
{
    // draw a CI image with the previously loaded face detection picture
    CIImage* image = [CIImage imageWithCGImage:facePicture.image.CGImage];
    
    
    // create a face detector - since speed is not an issue we'll use a high accuracy
    // detector
    CIDetector* detector = [CIDetector detectorOfType:CIDetectorTypeFace
                                              context:nil options:[NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh forKey:CIDetectorAccuracy]];
    
    // create an array containing all the detected faces from the detector
    NSArray* features = [detector featuresInImage:image];
    
    // we'll iterate through every detected face.  CIFaceFeature provides us
    // with the width for the entire face, and the coordinates of each eye
    // and the mouth if detected.  Also provided are BOOL's for the eye's and
    // mouth so we can check if they already exist.
    for(CIFaceFeature* faceFeature in features)
    {
        // get the width of the face
        CGFloat faceWidth = faceFeature.bounds.size.width;
        
        // create a UIView using the bounds of the face
        UIView* faceView = [[UIView alloc] initWithFrame:faceFeature.bounds];
        //UIView* faceB = [[UIView alloc] initWithFrame:facePicture.bounds];
        // add a border around the newly created UIView
        //faceView.layer.borderWidth = 1;
        //faceView.layer.borderColor = [[UIColor redColor] CGColor];
        //[faceView setTransform:CGAffineTransformMakeScale(1, -1)];
        
        // add the new view to create a box around the face
        [_img2 addSubview:faceView];
        
        if(faceFeature.hasLeftEyePosition)
        {
            // create a UIView with a size based on the width of the face
            UIView* leftEyeView = [[UIView alloc] initWithFrame:CGRectMake(faceFeature.leftEyePosition.x-faceWidth*0.15, faceFeature.leftEyePosition.y-faceWidth*0.15, faceWidth*0.3, faceWidth*0.3)];
//            UIImageView* eye=[[UIImageView alloc] initWithFrame:CGRectMake(faceFeature.leftEyePosition.x*0.5-faceWidth*0.05, faceFeature.leftEyePosition.y*0.48-faceWidth*0.05, faceWidth*0.15, faceWidth*0.15)];
            UIImageView* eye = [[UIImageView alloc] initWithFrame:CGRectMake((faceFeature.leftEyePosition.x-faceWidth*0.15)*0.5, (faceFeature.leftEyePosition.y-faceWidth*0.15)*0.5, (faceWidth*0.3)*0.5, (faceWidth*0.3)*0.5)];
            [eye setImage:[UIImage imageNamed:@"eye.png"]];
            
            // change the background color of the eye view
            [leftEyeView setBackgroundColor:[[UIColor yellowColor] colorWithAlphaComponent:0.3]];
            // set the position of the leftEyeView based on the face
            [leftEyeView setCenter:faceFeature.leftEyePosition];
            // round the corners
            leftEyeView.layer.cornerRadius = faceWidth*0.15;
            // add the view to the window
            //[self.window addSubview:leftEyeView];
            [_img2 addSubview:eye];
        }
        
        if(faceFeature.hasRightEyePosition)
        {
            // create a UIView with a size based on the width of the face
            UIView* leftEye = [[UIView alloc] initWithFrame:CGRectMake(faceFeature.rightEyePosition.x-faceWidth*0.15, faceFeature.rightEyePosition.y-faceWidth*0.15, faceWidth*0.3, faceWidth*0.3)];
//            UIImageView* eye1=[[UIImageView alloc] initWithFrame:CGRectMake(faceFeature.rightEyePosition.x*0.5-faceWidth*0.05, faceFeature.rightEyePosition.y*0.48-faceWidth*0.05, faceWidth*0.15, faceWidth*0.15)];
            UIImageView* eye1 = [[UIImageView alloc] initWithFrame:CGRectMake((faceFeature.rightEyePosition.x-faceWidth*0.15)*0.5, (faceFeature.rightEyePosition.y-faceWidth*0.15)*0.5, (faceWidth*0.3)*0.5, (faceWidth*0.3)*0.5)];
            [eye1 setImage:[UIImage imageNamed:@"eye.png"]];
            
            // change the background color of the eye view
            [leftEye setBackgroundColor:[[UIColor redColor] colorWithAlphaComponent:0.3]];
            // set the position of the rightEyeView based on the face
            [leftEye setCenter:faceFeature.rightEyePosition];
            // round the corners
            leftEye.layer.cornerRadius = faceWidth*0.15;
            // add the new view to the window
            //[self.window addSubview:leftEye];
            [_img2 addSubview:eye1];
        }
        
        if(faceFeature.hasMouthPosition)
        {
            // create a UIView with a size based on the width of the face
            UIView* mouth = [[UIView alloc] initWithFrame:CGRectMake(faceFeature.mouthPosition.x-faceWidth*0.2, faceFeature.mouthPosition.y-faceWidth*0.2, faceWidth*0.4, faceWidth*0.4)];
//            UIImageView* mouthPic=[[UIImageView alloc] initWithFrame:CGRectMake(faceFeature.mouthPosition.x*0.5-faceWidth*0.1, faceFeature.mouthPosition.y*0.48-faceWidth*0.1, faceWidth*0.25, faceWidth*0.15)];
            UIImageView* mouthPic = [[UIImageView alloc] initWithFrame:CGRectMake((faceFeature.mouthPosition.x-faceWidth*0.2)*0.5, (faceFeature.mouthPosition.y-faceWidth*0.2)*0.5, (faceWidth*0.4)*0.6, (faceWidth*0.4)*0.3)];
            [mouthPic setImage:[UIImage imageNamed:@"lips3.png"]];
            [mouthPic setTransform:CGAffineTransformMakeScale(1, -1)];
            // change the background color for the mouth to green
            [mouth setBackgroundColor:[[UIColor greenColor] colorWithAlphaComponent:0.3]];
            // set the position of the mouthView based on the face
            [mouth setCenter:faceFeature.mouthPosition];
            // round the corners
            mouth.layer.cornerRadius = faceWidth*0.2;
            // add the new view to the window
            //[self.window addSubview:mouth];
            [_img2 addSubview:mouthPic];
        }
    }
}



- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

//- (IBAction)uploadButton:(id)sender {
//    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//    picker.delegate = self;
//    picker.allowsEditing = YES;
//    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    [self presentViewController:picker animated:YES completion:NULL];
//}

//uploading pics methods

//- (IBAction)selectPhoto:(UIButton *)sender {
//    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//    picker.delegate = self;
//    picker.allowsEditing = YES;
//    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    [self presentViewController:picker animated:YES completion:NULL];
//}

//press button to call method selectPhoto
//- (IBAction)Upload:(id)sender {
//    [self selectPhoto:_uploadPic];
//}

////when the UIImagePickerController picks image from the image roll.
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//    UIImage *selectedImage = info[UIImagePickerControllerEditedImage];
//    sourceImage = selectedImage;
//    [_img setImage:sourceImage];
//    [picker dismissViewControllerAnimated:YES completion:NULL];
//}
////when user presses the Cancel button on UIImagePicker
//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
//    [picker dismissViewControllerAnimated:YES completion:NULL];
//}



@end
