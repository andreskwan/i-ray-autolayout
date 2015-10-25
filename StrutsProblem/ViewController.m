//
//  ViewController.m
//  StrutsProblem
//
//  Created by Andres Kwan on 10/23/15.
//  Copyright © 2015 Kwan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *topLeftView;
@property (weak, nonatomic) IBOutlet UIView *topRightView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//this callback is called when the view controller is rotating to a new orientation
- (void)viewWillLayoutSubviews
{
    if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))
    {
        CGRect rect = self.topLeftView.frame;
        rect.size.width = 254;
        rect.size.height = 130;
        //Structs also passed by value in Obj-C
        self.topLeftView.frame = rect;
        
        //Why? because here their values are changed
        //but self.topLeftView.frame value is the assigened (copied) previously
        rect = self.topRightView.frame;
        rect.origin.x = 294;
        rect.size.width = 254;
        rect.size.height = 130;
        self.topRightView.frame = rect;
        
        rect = self.bottomView.frame;
        rect.origin.y = 170;
        rect.size.width = 528;
        rect.size.height = 130;
        self.bottomView.frame = rect;
    }
    else //Portrait also needed when comming back from landsacpe
    {
        CGRect rect = self.topLeftView.frame;
        rect.size.width = 130;
        rect.size.height = 254;
        self.topLeftView.frame = rect;
        
        rect = self.topRightView.frame;
        rect.origin.x = 170;
        rect.size.width = 130;
        rect.size.height = 254;
        self.topRightView.frame = rect;
        
        rect = self.bottomView.frame;
        rect.origin.y = 295;
        rect.size.width = 280;
        rect.size.height = 254;
        self.bottomView.frame = rect;
    }
}
@end
