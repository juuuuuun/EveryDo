//
//  ToDoManager.m
//  EveryDo
//
//  Created by Jun Oh on 2019-01-22.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "ToDoManager.h"
#import "ToDo.h"

@interface ToDoManager()

@property (nonatomic) NSMutableArray<ToDo *>* mutableToDoList;
@property (nonatomic) NSInteger firstCompleted;

@end

@implementation ToDoManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _mutableToDoList = [NSMutableArray array];
        _firstCompleted = 0;
    }
    return self;
}

- (NSInteger)returnFirstCompletedIndex {
    return self.firstCompleted;
}

- (ToDo *)createToDoWithTitle:(NSString *)title andToDoDescription:(NSString *)toDoDescription andPriorityNumber:(NSInteger)priorityNumber {
    ToDo* createdToDo = [[ToDo alloc] initWithTitle:title andToDoDescription:toDoDescription andPriorityNumber:priorityNumber];
    [self.mutableToDoList insertObject:createdToDo atIndex:self.firstCompleted];
    self.firstCompleted++;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"com.EveryDo.AddedToDo" object:nil];
    return createdToDo;
}

- (void)organizeList {
    [self.mutableToDoList sortUsingComparator:^NSComparisonResult(ToDo* obj1, ToDo* obj2) {
        if(obj1.isCompleted && !obj2.isCompleted) {
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
    [self.mutableToDoList sortUsingComparator:^NSComparisonResult(ToDo* obj1, ToDo* obj2) {
        if(obj2.isCompleted && !obj1.isCompleted) {
            return NSOrderedSame;
        } else {
            if(obj1.priorityNumber > obj2.priorityNumber) {
                return NSOrderedAscending;
            } else {
                return NSOrderedDescending;
            }
        }
    }];
}

- (void)markAsComplete:(NSInteger)index {
    self.mutableToDoList[index].isCompleted = YES;
    ToDo* toDoToMove = self.mutableToDoList[index];
    [self.mutableToDoList removeObjectAtIndex:index];
    [self.mutableToDoList addObject:toDoToMove];
    self.firstCompleted--;
}

- (NSArray<ToDo *> *)toDoList {
    return [self.mutableToDoList copy];
}

@end
