//
//  ToDo.m
//  EveryDo
//
//  Created by Jun Oh on 2019-01-22.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

- (instancetype) init {
    return [self initWithTitle:@"Default Title" andToDoDescription:@"Default Description" andPriorityNumber:100];
}

- (instancetype)initWithTitle:(NSString *)title andToDoDescription:(NSString *)toDoDescription andPriorityNumber:(NSInteger)priorityNumber {
    self = [super init];
    if(self) {
        _title = title;
        _toDoDescription = toDoDescription;
        _priorityNumber = priorityNumber;
        _isCompleted = NO;
    }
    return self;
}

@end
