//
//  
// 
//
//  Created by Alex on 8/2/13.
//  Copyright (c) 2013 AlexSem. All rights reserved.
//

#import "ASPlayCHILDViewController.h"
#import <QuartzCore/QuartzCore.h>



@interface ASPlayCHILDViewController ()

@end

@implementation ASPlayCHILDViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}




- (IBAction)btnBackClick:(id)sender {
    
    [[super ownerSelectorClose] performSelector:[super selectorClose]];//_selectorClose];
}


-(void)beforePlaying{
   
}


-(void)showMessage:(NSString *)message{
    [super showMessage:message];
}

@end

