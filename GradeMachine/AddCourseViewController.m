//
//  AddCourseViewController.m
//  GradeMachine
//
//  Created by Thomas M. Mroz on 6/5/14.
//  Copyright (c) 2014 BGHS. All rights reserved.
//

#import "AddCourseViewController.h"


@interface AddCourseViewController ()
@property (weak, nonatomic) IBOutlet UITextField *addCourseTitleField;
@property (weak, nonatomic) IBOutlet UITextField *addCoursePeriodField;

@end

@implementation AddCourseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onAddCoursePressed:(id)sender
{
    self.addCourse.courseTitle = self.addCourseTitleField.text;
    self.addCourse.coursePeriod = self.addCoursePeriodField.text;
    [self.addCourseTitleField resignFirstResponder];
    [self.addCoursePeriodField resignFirstResponder];
}






@end
