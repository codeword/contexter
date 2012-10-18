//
//  AppDelegate.h
//  contexter
//
//  Created by Jonathan Barnes on 10/11/12.
//  Copyright (c) 2012 Jonathan Barnes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DependencyInjector.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) DependencyInjector *injector;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
