//
//  Reminder.m
//  contexter
//
//  Created by Jonathan Barnes on 10/17/12.
//  Copyright (c) 2012 Jonathan Barnes. All rights reserved.
//

#import "Reminder.h"

@implementation Reminder
@dynamic title;
@dynamic createdAt;

+ (Reminder *)createInContext:(NSManagedObjectContext *) context
                    WithTitle:(NSString *)title {
  Reminder *reminder = (Reminder *)[NSEntityDescription insertNewObjectForEntityForName:@"Reminder" inManagedObjectContext:context];
  reminder.title = title;
  reminder.createdAt = [NSDate date];
  [context save:nil];
  return reminder;
}

+ (NSArray *)allInContext:(NSManagedObjectContext *)context {
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reminder"];
  request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"createdAt" ascending:YES]];
  return [context executeFetchRequest:request error:nil];
}
@end
