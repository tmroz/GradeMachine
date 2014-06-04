//
//  Assignment.m
//  GradeMachine
//
//  Created by Thomas M. Mroz on 6/4/14.
//  Copyright (c) 2014 BGHS. All rights reserved.
//

#import "Assignment.h"

@implementation Assignment

-(Assignment *) initWithTitle: (NSString *) assignmentName
{
    self.assignmentTitle = assignmentName;
    return self;
}
-(Assignment *) initWithTitle: (NSString *) assignmentName andPointValue: (NSString*) pointValue
{
    self.assignmentTitle = assignmentName;
    self.assignmentPointValue = pointValue;
    return self;
}

-(NSString *) description
{
    return [NSString stringWithFormat:@"%@: %@", self.assignmentTitle, self.assignmentPointValue];
}

@end
