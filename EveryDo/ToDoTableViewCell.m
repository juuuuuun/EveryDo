//
//  ToDoTableViewCell.m
//  EveryDo
//
//  Created by Jun Oh on 2019-01-22.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "ToDoTableViewCell.h"
#import "ToDo.h"

@implementation ToDoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)populateCell {
    self.textLabel.text = [NSString stringWithFormat: @"%li %@", self.toDoItem.priorityNumber, self.toDoItem.title];
    self.detailTextLabel.text = self.toDoItem.toDoDescription;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
