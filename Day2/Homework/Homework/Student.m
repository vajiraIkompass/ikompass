//
//  Student.m
//  Homework
//
//  Created by Vajira on 10/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "Student.h"

@implementation Student

-(float)calculateCurrentGroupMark:(float)byCurrentGroupMark bonus:(float)byBonusMark
{
    //Calculating new grade with the bonus mark
    float newGrade = self.grade + byBonusMark;
    
    //Assumption: Student grade should between 0 - 100 marks
    if (newGrade < 0.0) {
        newGrade = 0.0;
    }
    else if (newGrade > 100.0) {
        newGrade = 100.0;
    }
    
    return byCurrentGroupMark + newGrade;
}

@end
