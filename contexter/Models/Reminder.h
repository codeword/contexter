//
//  Reminder.h
//  contexter
//
//  Created by Jonathan Barnes on 10/17/12.
//  Copyright (c) 2012 Jonathan Barnes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Reminder : NSManagedObject
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * createdAt;
+ (Reminder *)createInContext:(NSManagedObjectContext *) context
                    WithTitle:(NSString *)title;
+ (NSArray *)allInContext:(NSManagedObjectContext *)context;
@end
