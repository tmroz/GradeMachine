//
//  ViewController.m
//  GradeMachine
//
//  Created by Thomas M. Mroz on 6/4/14.
//  Copyright (c) 2014 BGHS. All rights reserved.
//

#import "ViewController.h"
#import "Course.h"
#import "Student.h"
#import "CourseDetailViewController.h"
#import "AddCourseViewController.h"

#define LatestUpdatekey @"Latest Update"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myCourseTableView;
@property Course *addCourseElement;

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.addCourseElement = [[Course alloc]initWithTitle:@"Add a New Course" andPeriod:@"and Period"];
    [super viewDidLoad];
    [self load];

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
    cell.detailTextLabel.text = selectedCourse.coursePeriod;
    cell.imageView.image = [UIImage imageNamed:@"214logo"];

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


        [self performSegueWithIdentifier:@"addCourseSegue" sender:self];



    }

}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.courseList.count -1)
    {
        return UITableViewCellEditingStyleInsert;
    }
    else
    {
        return UITableViewCellEditingStyleDelete;
    }
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.myCourseTableView setEditing:editing animated:YES];
    [self save];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"courseDetailsSegue"]) {
        NSIndexPath *selectedIndexPath = self.myCourseTableView.indexPathForSelectedRow;
        Course *selectedCourse = [self.courseList objectAtIndex:selectedIndexPath.row];
        CourseDetailViewController *courseViewController = segue.destinationViewController;
        courseViewController.theCoursePicked = selectedCourse;
    }
    if([segue.identifier isEqualToString:@"addCousrseSegue"])
    {
        
        
    }
}

- (IBAction)unwindCourse:(UIStoryboardSegue *)segue
{
    AddCourseViewController *addvc = segue.sourceViewController;

    [self.courseList removeLastObject];
    [self.courseList addObject: addvc.addedCourse];
    [self.courseList addObject: self.addCourseElement];

    [self.myCourseTableView reloadData];
  
    [self save];
}

- (void)save
{

    NSURL *plist = [[self documentsDirectory]URLByAppendingPathComponent:@"paste.plist"];
    NSMutableArray *courseDictionaries = [NSMutableArray array];
    for (Course *c in self.courseList)
    {
        [courseDictionaries  addObject:c.encode];
    }
    [courseDictionaries writeToURL:plist atomically:YES];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSDate date] forKey:LatestUpdatekey];
    [defaults synchronize];
    NSLog(@"saved");

}

- (void)load
{
    NSURL *plist = [[self documentsDirectory]URLByAppendingPathComponent:@"paste.plist"];
    self.courseList = [NSMutableArray arrayWithContentsOfURL:plist];

    NSMutableArray *tempCourses = [NSMutableArray array];

    for (NSDictionary *d in self.courseList)
    {
        Course *c = [[Course alloc] initWithDictionary:d];
        [tempCourses addObject: c];

    }
    self.courseList = tempCourses;
   
}

-(NSURL *)documentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
}



@end
