//
//  CourseDetailViewController.h
//  GradeMachine
//
//  Created by Alison K. Knappik on 6/4/14.
//  Copyright (c) 2014 BGHS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"
#import "AddAssignmentViewController.h"

@interface CourseDetailViewController : UIViewController

@property (nonatomic, strong) Course *theCoursePicked;
@property NSMutableArray *assignmentList;

@end
