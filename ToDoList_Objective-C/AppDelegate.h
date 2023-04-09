//
//  AppDelegate.h
//  ToDoList_Objective-C
//
//  Created by Сергей Лукичев on 09.04.2023.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

