//
//  ViewController.m
//  ConstraintAnimation
//
//  Created by Cast on 6/7/17.
//  Copyright © 2017 MAS. All rights reserved.
//

#import "ViewController.h"


typedef NS_ENUM(NSInteger, InnerViewAlpha) {
    InnerViewAlphaLow = 0,
    InnerViewAlphaMedium = 1,
    InnerViewAlphaHigh = 2
};





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
    
    // inner view layer
    _innerView.layer.borderColor = [UIColor whiteColor].CGColor;
    _innerView.layer.borderWidth = 1.3f;
    _innerView.alpha = [self alphaWithType:InnerViewAlphaLow];
}

#pragma mark - Appearance Helpers
-(float)alphaWithType:(NSInteger)type{
    
    if (type == 0) {
        return 0.20f;
    }else if (type == 1) {
        return 0.45f;
    }else if (type==3) {
        return 0.75f;
    }else{
        return 1.00f;
    }
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
        _innerView.alpha = [self alphaWithType:InnerViewAlphaHigh];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        // completion
        innerViewPosition = (self.view.bounds.size.height/2.00f) - (self.innerView.bounds.size.height/2.00f);
        self.constraintInnerViewTop.constant = innerViewPosition;
        [UIView animateWithDuration:0.4f animations:^{
            // animation 2
            _innerView.alpha = [self alphaWithType:InnerViewAlphaMedium];
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            // completion 2
            _innerView.alpha = 1.0f;
        }];
        
    }];
    
}


@end
