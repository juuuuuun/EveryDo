//
//  ViewController.m
//  EveryDo
//
//  Created by Jun Oh on 2019-01-22.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "ViewController.h"
#import "ToDo.h"
#import "ToDoManager.h"
#import "ToDoTableViewCell.h"
#import "DetailViewController.h"
#import "CreateToDoViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) ToDoManager* toDoManager;
@property (nonatomic, weak) UITableView* toDoTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.toDoManager = [[ToDoManager alloc] init];
    // Some hardcode ToDo objects to test the program
    [self.toDoManager createToDoWithTitle:@"ToDo" andToDoDescription:@"This" andPriorityNumber:1];
    [self.toDoManager createToDoWithTitle:@"Title of ToDo2" andToDoDescription:@"Description of ToDo2" andPriorityNumber:2];
    [self.toDoManager createToDoWithTitle:@"Example ToDo" andToDoDescription:@"Example Description" andPriorityNumber:3];
    
    UITableView* toDoTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    toDoTableView.delegate = self;
    toDoTableView.dataSource = self;
    
    toDoTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:toDoTableView];
    
    [NSLayoutConstraint constraintWithItem:toDoTableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:toDoTableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:toDoTableView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:toDoTableView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0].active = YES;
    
    [toDoTableView registerClass:[ToDoTableViewCell class] forCellReuseIdentifier:@"toDoCell"];
    
    [toDoTableView reloadData];
    
    self.navigationItem.title = @"To-Do List";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addToDoItem:)];
    
    self.toDoTableView = toDoTableView;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTableView:) name:@"com.EveryDo.AddedToDo" object:nil];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.toDoTableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    
    [self.toDoManager markAsComplete:indexPath.row];
    
    [self.toDoTableView moveRowAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForRow:self.toDoManager.toDoList.count-1 inSection:indexPath.section]];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Mark as Complete";
}

- (void) updateTableView:(NSNotification *)notification {
    NSIndexPath* createdPath = [NSIndexPath indexPathForRow:[self.toDoManager returnFirstCompletedIndex]-1 inSection:0];
    [self.toDoTableView insertRowsAtIndexPaths:@[createdPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


- (void) addToDoItem:(UIBarButtonItem *)sender {
    CreateToDoViewController* createToDoViewController = [[CreateToDoViewController alloc] init];
    createToDoViewController.toDoManager = self.toDoManager;
    UINavigationController* createNavigationController = [[UINavigationController alloc] initWithRootViewController:createToDoViewController];
    
    [self showDetailViewController:createNavigationController sender:self];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"toDoCell" forIndexPath:indexPath];
    
    ToDo* toDoItem = self.toDoManager.toDoList[indexPath.row];
    cell.toDoItem = toDoItem;
    [cell populateCell];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.toDoManager.toDoList.count;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController* detailViewController = [[DetailViewController alloc] init];
    detailViewController.toDoItem = self.toDoManager.toDoList[indexPath.row];

    [self.navigationController pushViewController:detailViewController animated:YES];
    return NO;
}




@end
