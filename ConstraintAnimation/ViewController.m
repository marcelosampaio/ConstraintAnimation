//
//  ViewController.m
//  ConstraintAnimation
//
//  Created by Cast on 6/7/17.
//  Copyright © 2017 MAS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    double innerViewPosition;
}

@end
static double defaultPosition = -720.00f;
@implementation ViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self resetInitial];

    
}
#pragma mark - Helpers
-(void)resetInitial{
    self.constraintInnerViewTop.constant = defaultPosition;
    // reset label to upside down
    _message.transform = CGAffineTransformMakeRotation(M_PI);
    // label layer
    _innerView.layer.borderColor = [UIColor whiteColor].CGColor;
    _innerView.layer.borderWidth = 1.3f;
}

#pragma mark - UI Actions
- (IBAction)proceed:(id)sender {
    
    // set constraints
    innerViewPosition = (self.view.bounds.size.height/2.00f) - (self.innerView.bounds.size.height/2.00f) + 75.00f;
    self.constraintInnerViewTop.constant = innerViewPosition;
    
    // animate view
    [UIView animateWithDuration:0.5f animations:^{
        // Animation
        //   for anti clockwise use -3.1415 or clockwise use M_PI
        _innerView.transform = CGAffineTransformMakeRotation(M_PI);
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        // completion
        innerViewPosition = (self.view.bounds.size.height/2.00f) - (self.innerView.bounds.size.height/2.00f);
        self.constraintInnerViewTop.constant = innerViewPosition;
        [UIView animateWithDuration:0.4f animations:^{
            // animation 2
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            // completion 2
        }];
        
    }];
    
}


@end
