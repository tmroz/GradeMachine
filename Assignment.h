//
//  Assignment.h
//  GradeMachine
//
//  Created by Thomas M. Mroz on 6/4/14.
//  Copyright (c) 2014 BGHS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Assignment : NSObject
@property NSString *assignmentTitle;
@property NSString *assignmentPointValue;

-(Assignment *) initWithTitle: (NSString *) assignmentName;
-(Assignment *) initWithTitle: (NSString *) assignmentName andPointValue: (NSString*) pointValue;

@end
