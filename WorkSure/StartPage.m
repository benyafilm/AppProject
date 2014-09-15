//
//  StartPage.m
//  SkoiiZBeautyZ
//
//  Created by Anunya Sukitjanuparp on 9/11/2557 BE.
//  Copyright (c) 2557 Anunya Sukitjanuparp. All rights reserved.
//

#import "StartPage.h"

@interface StartPage ()

@end

@implementation StartPage

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
//    for (NSString* family in [UIFont familyNames])
//    {
//        NSLog(@"%@", family);
//        
//        for (NSString* name in [UIFont fontNamesForFamilyName: family])
//        {
//            NSLog(@"  %@", name);
//        }
//    }
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.text = @"Using Custom Fonts";
//    //_appName.font= [UIFont fontWithName:@"TS-SOM TUM-Shadow-np" size:29];
//    [label setFont:[UIFont fontWithName:@"TS-SOMTUM-np-Bold" size:29]];
//    [self.view addSubview:label];
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

- (IBAction)startButton:(id)sender {
}
@end
