//
//  ToDo.h
//  EveryDo
//
//  Created by Jun Oh on 2019-01-22.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToDo : NSObject

@property (nonatomic) NSString* title;
@property (nonatomic) NSString* toDoDescription;
@property (nonatomic) NSInteger priorityNumber;
@property (nonatomic) BOOL isCompleted;

- (instancetype) initWithTitle:(NSString *)title
            andToDoDescription:(NSString *)toDoDescription
             andPriorityNumber:(NSInteger)priorityNumber;

@end

NS_ASSUME_NONNULL_END
