//
//  CreateToDoViewController.h
//  EveryDo
//
//  Created by Jun Oh on 2019-01-22.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ToDoManager;

NS_ASSUME_NONNULL_BEGIN

@interface CreateToDoViewController : UIViewController

@property (nonatomic) ToDoManager* toDoManager;

@end

NS_ASSUME_NONNULL_END
