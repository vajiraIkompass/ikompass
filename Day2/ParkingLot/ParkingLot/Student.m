//
//  Student.m
//  ParkingLot
//
//  Created by Vajira on 5/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "Student.h"

@implementation Student

-(float)calculateParkingFeesByQualifiedDistance:(BOOL)qualifiedByDistance grade:(int)studentGrade;
{
    float discountRate = 0;
    
    if(qualifiedByDistance)
    {
        if(studentGrade >= 70)
        {
            discountRate = 1;
        }
        else if(studentGrade < 70 && self.grade >= 60)
        {
            discountRate = 0.2;
        }
    }
    
    
    float parkingDiscount = (float)kPARKING_COST;
    
    self.parkingFee = parkingDiscount - (parkingDiscount*discountRate);

    return self.parkingFee;
}


-(void)calculateStudentParkingFees
{
    
    float discountRate = 0;
    
    if(self.isLessThan30Kms)
    {
        if(self.grade >= 70)
        {
            discountRate = 0.2;
        }
        else if(self.grade < 70 && self.grade >= 60)
        {
            discountRate = 0.15;
        }
    }

    //NSLog(@"discount rate %f", discountRate);
    
    float parkingDiscount = (float)kPARKING_COST;
    
    self.parkingFee = parkingDiscount - (parkingDiscount*discountRate);
}


@end
