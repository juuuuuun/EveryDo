//
//  DetailViewController.m
//  EveryDo
//
//  Created by Jun Oh on 2019-01-22.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "DetailViewController.h"
#import "ToDo.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    UILabel* toDoTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    toDoTitle.translatesAutoresizingMaskIntoConstraints = NO;
    toDoTitle.textAlignment = NSTextAlignmentCenter;
    toDoTitle.text = self.toDoItem.title;
    toDoTitle.font = [UIFont boldSystemFontOfSize:32.0];
    
    [self.view addSubview:toDoTitle];
    
    [NSLayoutConstraint constraintWithItem:toDoTitle attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.0 constant:20.0].active = YES;
    [NSLayoutConstraint constraintWithItem:toDoTitle attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0].active = YES;
    
    UILabel* toDoPriority = [[UILabel alloc] initWithFrame:CGRectZero];
    toDoPriority.translatesAutoresizingMaskIntoConstraints = NO;
    toDoPriority.text = [NSString stringWithFormat:@"Priority: %li", self.toDoItem.priorityNumber];
    toDoPriority.font = [UIFont boldSystemFontOfSize:toDoPriority.font.pointSize];
    [self.view addSubview:toDoPriority];
    
    [NSLayoutConstraint constraintWithItem:toDoPriority attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:toDoTitle attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20.0].active = YES;
    [NSLayoutConstraint constraintWithItem:toDoPriority attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0].active = YES;
    
    UITextView* toDoDescription = [[UITextView alloc] initWithFrame:CGRectZero];
    toDoDescription.translatesAutoresizingMaskIntoConstraints = NO;
    toDoDescription.text = self.toDoItem.toDoDescription;
    toDoDescription.editable = NO;
    [self.view addSubview:toDoDescription];
    
    [NSLayoutConstraint constraintWithItem:toDoDescription attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:toDoPriority attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20.0].active = YES;
    [NSLayoutConstraint constraintWithItem:toDoDescription attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:toDoDescription attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-20.0].active = YES;
    [NSLayoutConstraint constraintWithItem:toDoDescription attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.8 constant:0].active = YES;
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
