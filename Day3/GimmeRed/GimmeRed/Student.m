//
//  Student.m
//  GimmeRed
//
//  Created by Vajira on 11/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "Student.h"

@implementation Student


-(NSString *)getCalculationsOfGrade:(NSNumber *)studentGrade {
    
    
    if (studentGrade > [NSNumber numberWithInt:75]) {
        return @"A";
    } else  if (studentGrade > [NSNumber numberWithInt:65]) {
        return @"B";
    }
    else {
        return @"F";
    }
    
}


@end
