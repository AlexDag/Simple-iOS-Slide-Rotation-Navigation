//
//  
//  
//
//  Created by Alex on 4/7/13.
//  Copyright (c) 2013 AlexSem. All rights reserved.
//

#import "ASMainViewController.h"
#import "ASPlayViewController.h"
#import "ASPlayCHILDViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface ASMainViewController ()

@end

@implementation ASMainViewController{
    
    
         // set your controllers here .......
    ASPlayViewController *playController;
    ASPlayCHILDViewController *playChildController;
    
    CATransform3D initTransform;
    CGRect initFrame,initPlayFrame,initPlayChildFrame;;
    
    
    
    UIViewAnimationOptions animetionOptions;
    float timeAnimation,timeAnimationBack;;
    tAnimationType animationType;
    tLevelType levelType;
    
    
    UIView  *viewPlayer;
    ASPlayParentViewController *player;
    SEL selectorBackAction;
    
        // right=1  left=-1
    int slideDirection;
        // down=1 up=-1 
    int moveDirection;

    
}

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
	 playController =   [self.storyboard instantiateViewControllerWithIdentifier:@"playView"];
    playChildController =   [self.storyboard instantiateViewControllerWithIdentifier:@"playViewChild"];
    
    
    [[self view]addSubview:playController.view];
    [[self view] sendSubviewToBack:playController.view];
    
    [[self view]addSubview:playChildController.view];
    [[self view] sendSubviewToBack:playChildController.view];

    
    playChildController.view.hidden=TRUE;
    playController.view.hidden = true;
    
    
    CGRect rect = playController.view.frame;
    rect.origin.y = 0;
    rect.origin.x=0;
    playController.view.frame = rect;
    initPlayFrame = rect;
    
    
    initFrame = rect;

    
    rect = playChildController.view.frame;
    rect.origin.y = 0;
    rect.origin.x=0;
    playChildController.view.frame = rect;
    initPlayChildFrame = rect;
    
    
    
    animetionOptions =  UIViewAnimationOptionCurveEaseOut;// UIViewAnimationOptionCurveEaseIn;
    timeAnimation = 1.0;
    timeAnimationBack=1.0;
    
    animationType = SSAnimationMove;
    levelType = SSChild;
    viewPlayer = playChildController.view;
    player = playChildController;
    
    playChildController.selectorClose = @selector(moveBackAction);
    playChildController.ownerSelectorClose = self;
    playController.ownerSelectorClose = self;
    
    player.view.hidden = true;
    
    moveDirection =1;
   
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
	

// go back
- (void)moveBackAction {
    
    [self blockBtnsEnabled:FALSE];
    
    CGPoint mycenter = playController.view.center;
     [UIView animateWithDuration:timeAnimationBack
                          delay:0
                        options: animetionOptions
                     animations:^{
                           viewPlayer.center = CGPointMake(mycenter.x ,mycenter.y - moveDirection*viewPlayer.frame.size.height);

                         // self.navigationController.navigationBar.center = navCenter;
                     }
                     completion:^(BOOL finished){
                         [self blockBtnsEnabled:TRUE];
                     }];
    

}
- (void)moveAction {
        [self blockBtnsEnabled:FALSE];
    [[self view]bringSubviewToFront:viewPlayer];
    viewPlayer.hidden = false;
    
    
    CGPoint mycenter = self.view.center;
    mycenter.y-=20;
    viewPlayer.center = CGPointMake(mycenter.x , mycenter.y -  moveDirection*viewPlayer.frame.size.height);

    
    [player beforePlaying];
    
    [UIView animateWithDuration:timeAnimation
                          delay:0
                        options: animetionOptions
                     animations:^{
                         viewPlayer.center = mycenter;
                     }
                     completion:^(BOOL finished){
                         //[player  performSelector:@selector(showMessage:) withObject:@"move  after completion" afterDelay:1.9];

                     }];
    
    
}


- (void)slideAction {
    
    
    [self blockBtnsEnabled:FALSE];
    [[self view]bringSubviewToFront:viewPlayer];
    viewPlayer.hidden = false;
    
    
    CGPoint mycenter = self.view.center;
      //status bar correction
    mycenter.y-=20;
    mycenter.x += slideDirection* _stepper.value;
    

   viewPlayer.center = CGPointMake(mycenter.x +  slideDirection*viewPlayer.frame.size.width, mycenter.y);

    
    [player beforePlaying];
    
    [UIView animateWithDuration:timeAnimation
                          delay:0
                        options: animetionOptions
                     animations:^{
                         viewPlayer.center = mycenter;
                     }
                     completion:^(BOOL finished){
                         //[player  performSelector:@selector(showMessage:) withObject:@"slide  after completion" afterDelay:1.9];
                     }];
    
    
}

// go back
- (void)slideBackAction {
    CGPoint mycenter = viewPlayer.center;
    [UIView animateWithDuration:timeAnimationBack
                          delay:0
                        options: animetionOptions
                     animations:^{
                         viewPlayer.center = CGPointMake(mycenter.x + slideDirection*viewPlayer.frame.size.width,mycenter.y );
                         
                         // self.navigationController.navigationBar.center = navCenter;
                     }
                     completion:^(BOOL finished){
                             [self blockBtnsEnabled:TRUE];
                     }];
    
    
}



- (IBAction)btnPlayClick:(id)sender {

    
    viewPlayer.frame = initFrame;
    player.selectorClose = selectorBackAction;

    
    switch (animationType) {
        case SSAnimationMove:{
               [self moveAction];
                break;
        }
        case SSAnimationRotation:
        {
            [self rotationClicked];
            break;
        }
            
        case SSAnimationSlide:
        {
            [self slideAction];
            break;
        }
            
        default:
            break;
    }
    
}

- (IBAction)stClicked:(id)sender {
    UIStepper *stepper = sender;
    NSNumber *value = [NSNumber numberWithDouble:stepper.value];
    _txtDelta.text =   [value stringValue];
    
}





- (void)rotationClicked{
        [self blockBtnsEnabled:FALSE];
    [[self view]bringSubviewToFront:viewPlayer];
    viewPlayer.hidden = TRUE;
    
    
    CALayer *layer = viewPlayer.layer;
    initTransform = layer.transform;

     CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
    rotationAndPerspectiveTransform = CATransform3DIdentity;
    rotationAndPerspectiveTransform.m34 = 1.0 / -800;
    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, -90.0f * M_PI / 180.0f, 1.0f, 0.0f, 0.0f);
    layer.transform = rotationAndPerspectiveTransform;
    
    
    
    
    
    
     [player beforePlaying];
         
    
    [UIView animateWithDuration:timeAnimation
                          delay:0
                        options:animetionOptions
                     animations:^{
                         CALayer *layer = _mainView.layer;
                         initTransform = layer.transform;
                         CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
                         rotationAndPerspectiveTransform.m34 = 1.0 / -800;
                         rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, +90.0f * M_PI / 180.0f, 1.0f, 0.0f, 0.0f);
                         layer.transform = rotationAndPerspectiveTransform;
                     }
                     completion:^(BOOL finished){
                         [self playViemInitPositionHidden:FALSE];
                     }];
 
}
-(void)playViemInitPositionHidden:(BOOL)hidden{
    
    viewPlayer.hidden = hidden;
    
    [UIView animateWithDuration:timeAnimation
                          delay:0
                        options:animetionOptions
                     animations:^{
                         CALayer *layer = viewPlayer.layer;
                         
                         initTransform = layer.transform;
                         
                         CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
                         rotationAndPerspectiveTransform.m34 = 1.0 / -800;
                         rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, +0.0f * M_PI / 180.0f, 1.0f, 0.0f, 0.0f);
                         layer.transform = rotationAndPerspectiveTransform;
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done");
                         //f(!hidden)
                             // [player  performSelector:@selector(showMessage:) withObject:@"rotate after completion" afterDelay:1.9];
                     }];

    
    
}
- (IBAction)rotateBackAction{
    
    
    
    CALayer *layer = _mainView.layer;
    initTransform = layer.transform;
    CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
    rotationAndPerspectiveTransform.m34 = 1.0 / -800;
    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, +0.0f * M_PI / 180.0f, 1.0f, 0.0f, 0.0f);
    layer.transform = rotationAndPerspectiveTransform;
    
    
    initTransform = layer.transform;
    rotationAndPerspectiveTransform = CATransform3DIdentity;
    rotationAndPerspectiveTransform.m34 = 1.0 / -800;
    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, -90.0f * M_PI / 180.0f, 1.0f, 0.0f, 0.0f);
    layer.transform = rotationAndPerspectiveTransform;
    
   
    [UIView animateWithDuration:timeAnimation
                          delay:0
                        options:animetionOptions
                     animations:^{
                         CALayer *layer = viewPlayer.layer;
                         initTransform = layer.transform;
                         CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
                         rotationAndPerspectiveTransform.m34 = 1.0 / -800;
                         rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, +90.0f * M_PI / 180.0f, 1.0f, 0.0f, 0.0f);
                         layer.transform = rotationAndPerspectiveTransform;
                     }
                     completion:^(BOOL finished){
                        viewPlayer.hidden = TRUE;
                         [[self view] sendSubviewToBack:viewPlayer];
                         [UIView animateWithDuration:timeAnimation
                                               delay:0
                                             options:animetionOptions
                                          animations:^{
                                              CALayer *layer = _mainView.layer;
                                              
                                              initTransform = layer.transform;
                                              
                                              CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
                                              rotationAndPerspectiveTransform.m34 = 1.0 / -800;
                                              rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, +0.0f * M_PI / 180.0f, 1.0f, 0.0f, 0.0f);
                                              layer.transform = rotationAndPerspectiveTransform;
                                          }
                                          completion:^(BOOL finished){
                                            
                                               [self playViemInitPositionHidden:TRUE];
                                              
                                                  [self blockBtnsEnabled:TRUE];
                                          }];
                     }];

    
}




- (void)viewDidUnload {
    [self setMainView:nil];
    [self setMView:nil];
    [self setBtnMove:nil];
    [self setBtnRotation:nil];
    [self setBtnSlide:nil];
    [self setBtnChildlevel:nil];
  
    [self setBtnRangerLevel:nil];
    [super viewDidUnload];
}

-(void)clearBtnColor{
    [_btnMove setBackgroundColor:[UIColor clearColor]];
    [_btnRotation setBackgroundColor:[UIColor clearColor]];
    [_btnSlide setBackgroundColor:[UIColor clearColor]];
     [_btnSlideleft setBackgroundColor:[UIColor clearColor]];
     [_btnMoveUp setBackgroundColor:[UIColor clearColor]];
}

- (IBAction)btnAnimationClicked:(UIButton *)sender {
    [self clearBtnColor];
    [sender setBackgroundColor:[UIColor greenColor]];
    switch (sender.tag) {
        case 0:
        case 4:
            animationType = SSAnimationMove;
            selectorBackAction=@selector(moveBackAction);
            moveDirection = sender.tag==0 ? 1 : -1;
            break;
        case 1:
            animationType = SSAnimationRotation;
            selectorBackAction=@selector(rotateBackAction);
            break;
        case 2:
        case 3:
            animationType = SSAnimationSlide;
            selectorBackAction=@selector(slideBackAction);
            slideDirection =  sender.tag==2? 1 : -1;
            break;
       default:
            break;
    }
}

-(void)blockBtnsEnabled:(BOOL)enabled{
    [_btnMove setEnabled:enabled];
    [_btnRotation setEnabled:enabled];
    [_btnSlide setEnabled:enabled];
}
-(void)clearBtnlevelColor{
    [_btnChildlevel setBackgroundColor:[UIColor clearColor]];
  
    [_btnRangerLevel setBackgroundColor:[UIColor clearColor]];
    
}

- (IBAction)btnLevelClicked:(UIButton *)sender {
    
    
    playController.view .hidden= true;
    playChildController.view.hidden = true;
    
    
    [self clearBtnlevelColor];
    [sender setBackgroundColor:[UIColor greenColor]];
    switch (sender.tag) {
        case 0:{
            levelType = SSChild;
            viewPlayer = playChildController.view;
            player = playChildController;
            initFrame = initPlayChildFrame;
            
            break;
        }
            
        case 1:{
            levelType = SSTeen;
            viewPlayer = playChildController.view;
            player = playChildController;
            initFrame = initPlayChildFrame;
            
            break;
        }
            
            
        case 2:{
            levelType = SSRanger;
            viewPlayer = playController.view;
            player = playController;
            initFrame = initPlayFrame;
            break;
        }
            
        default:
            break;
    }
    
}
@end
