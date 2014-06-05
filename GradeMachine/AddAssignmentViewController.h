//
//  AddAssignmentViewController.h
//  GradeMachine
//
//  Created by Alison K. Knappik on 6/5/14.
//  Copyright (c) 2014 BGHS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Assignment.h"

@interface AddAssignmentViewController : UIViewController

@property (nonatomic, strong) Assignment *assignmentAdded;
@property (nonatomic, strong) Assignment *assignmentPicked;
@property (weak, nonatomic) IBOutlet UITableView *addAssignmentTableView;

@end
