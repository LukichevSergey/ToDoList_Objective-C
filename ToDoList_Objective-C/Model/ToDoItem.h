//
//  ToDoItem.h
//  ToDoList_Objective-C
//
//  Created by Сергей Лукичев on 09.04.2023.
//

@interface ToDoItem : NSObject

@property (nonatomic, strong)   NSDate *creationDate;
@property (nonatomic, strong)   NSDate *notificationDate;
@property (nonatomic, copy)     NSString *text;

- (instancetype)initWithText:(NSString *)text notificationDate:(NSDate *)notificationDate;

@end
