#import "Fixtures.h"
#import <CoreData/CoreData.h>

@implementation Fixtures
//static NSManagedObjectModel *__managedObjectModel;
//static NSPersistentStoreCoordinator *__coordinator;

+ (DependencyInjector *)injector
{
  return [[DependencyInjector alloc] init];
}


#pragma mark - Private methods
//+ (void)resetPersistentStoreCoordinator {
//  __coordinator = nil;
//}
//
//+ (NSManagedObjectContext *)context {
//  NSManagedObjectContext *managedObjectContext = [[NSManagedObjectContext alloc] init];
//  [managedObjectContext setPersistentStoreCoordinator:[self coordinator]];
//  return managedObjectContext;
//}
//
//+ (NSManagedObjectModel *)managedObjectModel {
//  if (__managedObjectModel == nil) {
//    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"contexter" withExtension:@"momd"];
//    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
//  }
//  return __managedObjectModel;
//}
//
//+ (NSPersistentStoreCoordinator *)coordinator {
//  if (__coordinator == nil) {
//    NSError *error = nil;
//    //        NSURL *storeURL = [[B2BAppDelegate applicationDocumentsDirectory] URLByAppendingPathComponent:@"b2bspec.sqlite"];
//    __coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
//    [__coordinator addPersistentStoreWithType:NSInMemoryStoreType
//                                configuration:nil URL:nil options:nil error:&error];
//  }
//  return __coordinator;
//}
@end
