//
//  CreateToDoViewController.m
//  EveryDo
//
//  Created by Jun Oh on 2019-01-22.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "CreateToDoViewController.h"
#import "ToDo.h"
#import "ToDoManager.h"

@interface CreateToDoViewController ()

@property (nonatomic, weak) UITextField* createdTitle;
@property (nonatomic, weak) UITextView* createdDescription;
@property (nonatomic, weak) UITextField* createdPriorityNumber;

@end

@implementation CreateToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UITextField* toDoTitle = [[UITextField alloc] initWithFrame:CGRectZero];
    toDoTitle.translatesAutoresizingMaskIntoConstraints = NO;
    toDoTitle.backgroundColor = [UIColor orangeColor];
    toDoTitle.placeholder = @"Enter Title Here";
    [self.view addSubview:toDoTitle];
    
    [NSLayoutConstraint constraintWithItem:toDoTitle attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.0 constant:20.0].active = YES;
    [NSLayoutConstraint constraintWithItem:toDoTitle attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:toDoTitle attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.8 constant:0].active = YES;
    
    UITextField* toDoPriority = [[UITextField alloc] initWithFrame:CGRectZero];
    toDoPriority.translatesAutoresizingMaskIntoConstraints = NO;
    toDoPriority.backgroundColor = [UIColor greenColor];
    toDoPriority.placeholder = @"Enter Priority Value Here";
    [self.view addSubview:toDoPriority];
    
    [NSLayoutConstraint constraintWithItem:toDoPriority attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:toDoTitle attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20.0].active = YES;
    [NSLayoutConstraint constraintWithItem:toDoPriority attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:toDoPriority attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.8 constant:0].active = YES;
    
    UITextView* toDoDescription = [[UITextView alloc] initWithFrame:CGRectZero];
    toDoDescription.translatesAutoresizingMaskIntoConstraints = NO;
    toDoDescription.backgroundColor = [UIColor blueColor];
    [self.view addSubview:toDoDescription];
    
    [NSLayoutConstraint constraintWithItem:toDoDescription attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:toDoPriority attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20.0].active = YES;
    [NSLayoutConstraint constraintWithItem:toDoDescription attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:toDoDescription attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.8 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:toDoDescription attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-20.0].active = YES;
    
    
    
    self.navigationItem.title = @"Make Another To-Do";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelPressed:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donePressed:)];
    
    self.createdTitle = toDoTitle;
    self.createdDescription = toDoDescription;
    self.createdPriorityNumber = toDoPriority;
}



- (void) donePressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        if(!([self.createdTitle.text isEqualToString: @""] && [self.createdDescription.text isEqualToString: @""] &&
           [self.createdPriorityNumber.text isEqualToString: @""])) {
            [self.toDoManager createToDoWithTitle:self.createdTitle.text andToDoDescription:self.createdDescription.text andPriorityNumber:self.createdPriorityNumber.text.integerValue];
        }
    }];
}


- (void) cancelPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
