//
//  
//  
//
//  Created by Lion User on 09/12/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "ASPlayParentViewController.h"




@interface ASPlayViewController: ASPlayParentViewController



- (IBAction)btnBackClick:(id)sender;

-(void) beforePlaying;
-(void)showMessage:(NSString *)message;
@end
