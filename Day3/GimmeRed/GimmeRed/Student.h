//
//  Student.h
//  GimmeRed
//
//  Created by Vajira on 11/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Student : NSObject

@property NSString *firstName;
@property NSString *lastName;
@property NSNumber *grade;

-(NSString *)getCalculationsOfGrade:(NSNumber *)studentGrade;

@end
