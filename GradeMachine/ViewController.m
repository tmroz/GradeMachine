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
    Course *course1 = [[Course alloc] initWithTitle:@"AP Computer Science" andPeriod:@"Period 1"];
    Course *course2 = [[Course alloc] initWithTitle:@"Add Course"];
    Course *course3 = [[Course alloc] initWithTitle:@"Programming 1"];
    self.courseList =[NSMutableArray arrayWithObjects: course1, course3, course2, nil];
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
        [self.myCourseTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.myCourseTableView reloadData];

    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {

        NSLog(@"you can edit now");
        //access add course viewcontroller to enter new data (title & period) with modal seque
        [self addItem];
        [self.myCourseTableView reloadData];
    }

}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.courseList.count - 1)
    {
        return UITableViewCellEditingStyleInsert;
    }
    else
    {
        return UITableViewCellEditingStyleDelete;
    }
}


- (void)addItem
{
    NSLog(@"give name");
    // ItemInputController is a view controller used to display textFields, etc.
    // whatever you need for your new item... You have to write it, name it however you want
   // ItemInputController *itemInputController = [[ItemInputController alloc] init];

    //UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:itemInputController];

    //[[self navigationController] presentModalViewController:navigationController animated:YES];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.myCourseTableView setEditing:editing animated:YES];

}



@end
