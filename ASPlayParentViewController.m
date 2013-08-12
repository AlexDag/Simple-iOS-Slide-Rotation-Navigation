//
//  ASPlayParentViewController.m
//  
//
//  Created by Alex on 8/2/13.
//  Copyright (c) 2013 AlexSem. All rights reserved.
//

#import "ASPlayParentViewController.h"

@interface ASPlayParentViewController ()

@end

@implementation ASPlayParentViewController{
    UIActionSheet *activeSheet;
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showMessage:(NSString*)message {
    
    
    
    
    activeSheet = [[UIActionSheet alloc]initWithTitle:message delegate:self cancelButtonTitle:@"Exit" destructiveButtonTitle:Nil otherButtonTitles:@"OK", nil];
    
    
    [activeSheet showInView:self.view.window];
    
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:{
            
            break;
        }
            
        case 1:{
            [_ownerSelectorClose performSelector:_selectorClose ];
            break;
        }

        default:
            break;
    }
}

@end
