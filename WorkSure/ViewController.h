//
//  ViewController.h
//  WorkSure
//
//  Created by Anunya Sukitjanuparp on 9/9/2557 BE.
//  Copyright (c) 2557 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//- (IBAction)processPicButton:(id)sender;
//- (IBAction)uploadButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
//@property (weak, nonatomic) IBOutlet UIButton *uploadPic;
@property(nonatomic) BOOL *isSomethingEnabled;
@property(nonatomic,strong) UIImage *sourceImage;

@end
