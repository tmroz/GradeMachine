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
@property NSMutableArray *points;

@end

@implementation AddAssignmentViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AssignmentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AssignmentCellID"];
    cell.assignmentNameLabel.text = [self.assignments objectAtIndex:indexPath.row];
    cell.assignmentPointsLabel.text = [self.points objectAtIndex:indexPath.row];
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onSubmitButtonPressed:(id)sender
{
    NSString *nextAssignment = self.addAssignmentTextField.text;
    NSString *nextPoint = self.addPointsTextField.text;
    [self.assignments addObject:nextAssignment];
    [self.points addObject:nextPoint];
    [self.addAssignmentTextField resignFirstResponder];
    self.addAssignmentTextField.text = @"";
    self.addPointsTextField.text = @"";
    
    
    [self.addAssignmentTableView reloadData];
}




@end
