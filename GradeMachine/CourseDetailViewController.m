//
//  CourseDetailViewController.m
//  GradeMachine
//
//  Created by Alison K. Knappik on 6/4/14.
//  Copyright (c) 2014 BGHS. All rights reserved.
//

#import "CourseDetailViewController.h"


@interface CourseDetailViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *courseDetailView;

@end

@implementation CourseDetailViewController



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text = @"Assignments";
        }
            break;
        case 1:
        {
            cell.textLabel.text = @"Students";
        }
            break;
        case 2:
        {
            cell.textLabel.text = @"Grade Report";
        }
            break;

        default:
            break;
    }
    return cell;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //NSIndexPath *selectedIndexPath =self.courseDetailView.indexPathForSelectedRow;
    //NSString *selectedOption = [self.assignmentList objectAtIndex:selectedIndexPath.row];

    AddAssignmentViewController *assignmentViewController = segue.destinationViewController;
    
        assignmentViewController.navigationItem.title = self.theCoursePicked.courseTitle;

}



@end
