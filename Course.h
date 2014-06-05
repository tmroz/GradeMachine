//
//  CourseObject.h
//  GradeMachine
//
//  Created by Thomas M. Mroz on 6/4/14.
//  Copyright (c) 2014 BGHS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Course : NSObject
@property NSString *courseTitle;
@property NSString *coursePeriod;
@property NSMutableArray *courseAssignments;
@property NSMutableArray *courseStudents;

-(Course *) initWithTitle: (NSString *) courseTitle;
-(Course *) initWithTitle: (NSString *) courseTitle andPeriod: (NSString*) coursePeriod;

-(NSDictionary *)encode;
-(id) initWithDictionary:(NSDictionary *)theDictionary;

@end
