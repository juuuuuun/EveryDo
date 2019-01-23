//
//  ToDoManager.h
//  EveryDo
//
//  Created by Jun Oh on 2019-01-22.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ToDo;

NS_ASSUME_NONNULL_BEGIN

@interface ToDoManager : NSObject

@property (nonatomic, readonly) NSArray<ToDo *>* toDoList;

- (ToDo *) createToDoWithTitle:(NSString *)title
            andToDoDescription:(NSString *)toDoDescription
             andPriorityNumber:(NSInteger)priorityNumber;

- (void) markAsComplete:(NSInteger)index;
- (NSInteger) returnFirstCompletedIndex;

@end

NS_ASSUME_NONNULL_END
