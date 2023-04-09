//
//  ToDoItem.m
//  ToDoList_Objective-C
//
//  Created by Сергей Лукичев on 09.04.2023.
//

#import <Foundation/Foundation.h>
#import "ToDoItem.h"

@implementation ToDoItem

- (instancetype)initWithText:(NSString *)text notificationDate:(NSDate *)notificationDate {
    self = [super init];
    if (self) {
        _text = [text copy];
        _creationDate = [NSDate date];
        _notificationDate = notificationDate;
    }
    return self;
}

@end
