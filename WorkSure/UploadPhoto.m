//
//  UploadPhoto.m
//  SkoiiZBeautyZ
//
//  Created by Anunya Sukitjanuparp on 9/11/2557 BE.
//  Copyright (c) 2557 Anunya Sukitjanuparp. All rights reserved.
//

#import "UploadPhoto.h"
#import "ViewController.h"



@interface UploadPhoto ()

@end

@implementation UploadPhoto
@synthesize selectedImage;

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)selectPhoto:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}

//press button to call method selectPhoto
- (IBAction)Upload:(id)sender {
    [self selectPhoto:_upload];
}

//when the UIImagePickerController picks image from the image roll.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    selectedImage = info[UIImagePickerControllerEditedImage];
    _showIm.image = selectedImage;
    [_showIm setImage:selectedImage];
    [picker dismissViewControllerAnimated:YES completion:NULL];
//    ViewController *processPicView = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
//    processPicView.isSomethingEnabled = YES;
//    [self pushViewController:processPicView animated:YES];
}
//when user presses the Cancel button on UIImagePicker
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"passImage"])
    {
        ViewController *nvc=segue.destinationViewController;
        //ViewController *nvc = (ViewController *)[[segue destinationViewController] topViewController];
//        UINavigationController *navController = (UINavigationController*)[segue destinationViewController];
//        ViewController *nvc = [navController topViewController];
//
        nvc.sourceImage=selectedImage; //imag2 is UIImage that globally declared in newViewController
        //[self pushViewController:nvc animated:YES];
    }
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"passImage"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        RecipeDetailViewController *destViewController = segue.destinationViewController;
//        destViewController.recipeName = [recipes objectAtIndex:indexPath.row];
//    }
//}

- (IBAction)uploadAction:(id)sender {


}


@end
