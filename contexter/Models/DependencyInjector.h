//
//  DependencyInjector.h
//  contexter
//
//  Created by Jonathan Barnes on 10/17/12.
//  Copyright (c) 2012 Jonathan Barnes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DependencyInjector : NSObject
@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@end
