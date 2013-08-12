//
//  ASAppDelegate.h
//  iOS+Slide+Rotation+Move+Navigation
//
//  Created by Alex on 8/10/13.
//  Copyright (c) 2013 Asem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
