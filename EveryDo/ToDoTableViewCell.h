//
//  ToDoTableViewCell.h
//  EveryDo
//
//  Created by Jun Oh on 2019-01-22.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ToDo;

NS_ASSUME_NONNULL_BEGIN

@interface ToDoTableViewCell : UITableViewCell

@property (nonatomic) ToDo* toDoItem;

- (void) populateCell;

@end

NS_ASSUME_NONNULL_END
