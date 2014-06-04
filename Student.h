//
//  Student.h
//  GradeMachine
//
//  Created by Thomas M. Mroz on 6/4/14.
//  Copyright (c) 2014 BGHS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property NSString *fullName;
@property NSString *eydee;
@property NSString *overallGrade;
@property NSMutableArray *studentAssignments;

-(Student *) initWithName: (NSString *) name;
-(Student *) initWithname: (NSString *) name andID: (NSString*) studentEydee;




@end
