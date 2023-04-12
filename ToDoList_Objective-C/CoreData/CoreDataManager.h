//
//  CoreDataManager.h
//  ToDoList_Objective-C
//
//  Created by Сергей Лукичев on 11.04.2023.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface CoreDataManager : NSObject

@property AppDelegate *appDelegate;
@property NSManagedObjectContext *context;

- (instancetype)init;

-(NSArray *)fetchData;
-(void)createStartedData;
-(void)saveItemWithText: (NSString *)text andNotificationDate:(NSDate *)notificationDate;
-(void)removeItemWith: (NSString *)guid;
-(void)removeAllItems;

@end
