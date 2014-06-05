//
//  CourseObject.m
//  GradeMachine
//
//  Created by Thomas M. Mroz on 6/4/14.
//  Copyright (c) 2014 BGHS. All rights reserved.
//

#import "Course.h"

@implementation Course


-(Course *) initWithTitle: (NSString *) courseTitle
{
    self.courseTitle = courseTitle;
    return self;
}
-(Course *) initWithTitle: (NSString *) courseTitle andPeriod: (NSString*) coursePeriod
{
    self.courseTitle = courseTitle;
    self.coursePeriod = coursePeriod;
    return self;
}

-(id)initWithDictionary:(NSDictionary *)theDictionary
{
    self = [super init];
    self.courseTitle = theDictionary[@"name"];
    self.coursePeriod = theDictionary[@"period"];
    return self;
}
-(NSDictionary *)encode
{
    return @{@"name":self.courseTitle,@"period":self.coursePeriod};
}

@end
