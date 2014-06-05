//
//  AddAssignmentViewController.m
//  GradeMachine
//
//  Created by Alison K. Knappik on 6/5/14.
//  Copyright (c) 2014 BGHS. All rights reserved.
//

#import "AddAssignmentViewController.h"
#import "AssignmentTableViewCell.h"

@interface AddAssignmentViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *addAssignmentTextField;
@property (weak, nonatomic) IBOutlet UITextField *addPointsTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;


@property NSMutableArray *assignments;


@end

@implementation AddAssignmentViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    Assignment *one = [[Assignment alloc] initWithTitle:@"Worksheet 1" andPointValue:
@"15"];
    Assignment *two = [[Assignment alloc] initWithTitle:@"Worksheet 2" andPointValue:
                       @"15"];
    self.assignments =[NSMutableArray arrayWithObjects: one, two, nil];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.assignments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Assignment *selected= [self.assignments objectAtIndex:indexPath.row];
    AssignmentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AssignmentCellID"];
    cell.assignmentNameLabel.text = selected.assignmentTitle;
    cell.assignmentPointsLabel.text = selected.assignmentPointValue;
    return cell;
}


- (IBAction)onSubmitButtonPressed:(id)sender
{
    Assignment *tempNewAssignment = [[Assignment alloc]init];
    tempNewAssignment.assignmentTitle = self.addAssignmentTextField.text;
    tempNewAssignment.assignmentPointValue = self.addPointsTextField.text;
    
    [self.assignments addObject:tempNewAssignment];
    [self.addAssignmentTextField resignFirstResponder];
    [self.addPointsTextField resignFirstResponder];
    self.addAssignmentTextField.text = @"";
    self.addPointsTextField.text = @"";
    [self.addAssignmentTableView reloadData];
}




@end
