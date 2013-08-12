//
//  
//  
//
//  Created by Lion User on 09/12/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ASPlayViewController.h"
#import <QuartzCore/QuartzCore.h>



@interface ASPlayViewController ()

@end

@implementation ASPlayViewController


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

 - (void)viewDidLoad
{
     
    [super viewDidLoad];
    
  }


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}




- (IBAction)btnBackClick:(id)sender {
     [[ super ownerSelectorClose] performSelector:[super selectorClose]];
}



-(void)beforePlaying{
    
}


-(void)showMessage:(NSString *)message{
    
    
        [super showMessage:message];
    
}

@end
