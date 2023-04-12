//
//  CoreDataManager.m
//  ToDoList_Objective-C
//
//  Created by Сергей Лукичев on 11.04.2023.
//

#import <Foundation/Foundation.h>
#import "CoreDataManager.h"
#import "AppDelegate.h"

@implementation CoreDataManager

- (instancetype)init {
    self = [super init];
    if (self) {
        _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        _context = _appDelegate.persistentContainer.viewContext;
    }
    return self;
}

- (void)createStartedData {
    NSManagedObject *item1 = [NSEntityDescription insertNewObjectForEntityForName: @"ToDoItem" inManagedObjectContext: _context];
    [item1 setValue: [[NSUUID UUID] UUIDString] forKey: @"guid"];
    [item1 setValue: @"Купить продукты" forKey: @"text"];
    [item1 setValue: [NSDate dateWithTimeIntervalSinceNow: 7200] forKey: @"notificationDate"];
    [item1 setValue: [NSDate date] forKey: @"creationDate"];

    [_appDelegate saveContext];

    NSManagedObject *item2 = [NSEntityDescription insertNewObjectForEntityForName: @"ToDoItem" inManagedObjectContext: _context];
    [item2 setValue: [[NSUUID UUID] UUIDString] forKey: @"guid"];
    [item2 setValue: @"Купить подарок" forKey: @"text"];
    [item2 setValue: [NSDate dateWithTimeIntervalSinceNow: 3600] forKey: @"notificationDate"];
    [item2 setValue: [NSDate date] forKey: @"creationDate"];

    [_appDelegate saveContext];
}

- (NSArray *)fetchData {
    NSFetchRequest *requestExamLocation = [NSFetchRequest fetchRequestWithEntityName:@"ToDoItem"];
    return [_context executeFetchRequest: requestExamLocation error: nil];
}

- (void)removeAllItems {
    NSFetchRequest *requestExamLocation = [NSFetchRequest fetchRequestWithEntityName:@"ToDoItem"];
    NSArray *fetchedObjects = [_context executeFetchRequest: requestExamLocation error: nil];
    
    for (NSManagedObject *object in fetchedObjects) {
        [_context deleteObject: object];
    }
    
    [_appDelegate saveContext];
}


- (void)saveItemWithText:(NSString *)text andNotificationDate:(NSDate *)notificationDate {
    NSManagedObject *item = [NSEntityDescription insertNewObjectForEntityForName: @"ToDoItem" inManagedObjectContext: _context];
    [item setValue: [[NSUUID UUID] UUIDString] forKey: @"guid"];
    [item setValue: text forKey: @"text"];
    [item setValue: notificationDate forKey: @"notificationDate"];
    [item setValue: [NSDate date] forKey: @"creationDate"];

    [_appDelegate saveContext];
}

- (void)removeItemWith:(NSString *)guid {
    NSFetchRequest *requestExamLocation = [NSFetchRequest fetchRequestWithEntityName:@"ToDoItem"];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"guid == %@", guid];
    [requestExamLocation setPredicate:predicate];
    
    NSArray *fetchedObjects = [_context executeFetchRequest: requestExamLocation error: nil];
    
    if (fetchedObjects.count > 0) {
        NSManagedObject *objectToDelete = fetchedObjects[0];
        [_context deleteObject:objectToDelete];
    }
    
    [_appDelegate saveContext];
}

@end
