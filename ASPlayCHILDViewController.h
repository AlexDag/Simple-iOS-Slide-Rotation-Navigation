//
//  
//  
//
//  Created by Alex on 8/2/13.
//  Copyright (c) 2013 AlexSem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASPlayParentViewController.h"



@interface ASPlayCHILDViewController : ASPlayParentViewController

- (IBAction)btnBackClick:(id)sender;

-(void)beforePlaying;
-(void)showMessage:(NSString *)message;

@end
