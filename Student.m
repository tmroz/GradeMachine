//
//  Student.m
//  GradeMachine
//
//  Created by Thomas M. Mroz on 6/4/14.
//  Copyright (c) 2014 BGHS. All rights reserved.
//

#import "Student.h"

@implementation Student

-(Student *) initWithName: (NSString *) name
{
    self.fullName = name;
    return self;

}

-(Student *) initWithname: (NSString *) name andID: (NSString*) studentEydee
{
    self.fullName = name;
    self.eydee = studentEydee;
    return self;
}


-(NSString *) description
{
    return [NSString stringWithFormat:@"%@: , Overall Grade: %@", self.fullName, self.overallGrade ];
}
@end
