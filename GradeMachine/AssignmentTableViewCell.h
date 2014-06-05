//
//  AssignmentTableViewCell.h
//  GradeMachine
//
//  Created by Alison K. Knappik on 6/5/14.
//  Copyright (c) 2014 BGHS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssignmentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *assignmentNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *assignmentPointsLabel;

@end
