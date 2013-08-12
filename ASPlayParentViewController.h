//
//  ASPlayParentViewController.h
//  
//
//  Created by Alex on 8/2/13.
//  Copyright (c) 2013 AlexSem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASPlayParentViewController : UIViewController<UIActionSheetDelegate>

@property(assign,nonatomic) SEL selectorClose;
@property(assign,nonatomic) id ownerSelectorClose;


-(void) beforePlaying;
-(void)showMessage:(NSString*)message;
@end
