//
//  UploadPhoto.h
//  SkoiiZBeautyZ
//
//  Created by Anunya Sukitjanuparp on 9/11/2557 BE.
//  Copyright (c) 2557 Anunya Sukitjanuparp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UploadPhoto : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *showIm;

@property (weak, nonatomic) IBOutlet UIButton *upload;
- (IBAction)Upload:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *goSkoiiz;
@property (nonatomic, strong) IBOutlet UIImage *selectedImage;
//@property (nonatomic) int randomNum;

@end
