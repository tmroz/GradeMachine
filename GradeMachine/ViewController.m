//
//  ViewController.m
//  GradeMachine
//
//  Created by Thomas M. Mroz on 6/4/14.
//  Copyright (c) 2014 BGHS. All rights reserved.
//

#import "ViewController.h"
#import "Course.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myCourseTableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    Course *course1 = [[Course alloc] initWithTitle:@"Test Course" andPeriod:@"Period 1"];
    self.courseList =[NSMutableArray arrayWithObjects: course1, nil];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.courseList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Course *selectedCourse= [self.courseList objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"courseCellID"];
    cell.textLabel.text = selectedCourse.courseTitle;

    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source
        [self.courseList removeObjectAtIndex:indexPath.row];
        [tableView reloadData];

    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {

    }

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    /**if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return NO;
        }
    }*/
    return YES;
    
}
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.myCourseTableView setEditing:editing animated:YES];
    if (editing) {
        //addButton.enabled = NO;
    } else {
        //addButton.enabled = YES;
    }
}


@end
