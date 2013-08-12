//
// 
//  
//
//  Created by Alex on 4/7/13.
//  Copyright (c) 2013 AlexSem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASPlayParentViewController.h"


typedef enum AnimationType {
    SSAnimationMove,
    SSAnimationRotation,
    SSAnimationSlide,
    
} tAnimationType;

typedef enum LevetType{
    SSChild,
    SSTeen,
    SSRanger,
} tLevelType;

@interface ASMainViewController : UIViewController





@property (strong, nonatomic) IBOutlet UIView *mView;
@property (weak, nonatomic) IBOutlet UIButton *btnMove;
@property (weak, nonatomic) IBOutlet UIButton *btnRotation;
@property (weak, nonatomic) IBOutlet UIButton *btnSlide;
@property (weak, nonatomic) IBOutlet UIButton *btnSlideleft;
@property (weak, nonatomic) IBOutlet UIButton *btnMoveUp;
@property (weak, nonatomic) IBOutlet UITextField *txtDelta;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;





@property (weak, nonatomic) IBOutlet UIView *mainView;

- (IBAction)btnPlayClick:(id)sender;
- (IBAction)stClicked:(id)sender;

- (IBAction)btnAnimationClicked:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnChildlevel;

@property (weak, nonatomic) IBOutlet UIButton *btnRangerLevel;

- (IBAction)btnLevelClicked:(UIButton *)sender;

@end
