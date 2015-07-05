//
//  Student.m
//  ParkingLot
//
//  Created by Vajira on 5/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "Student.h"

@implementation Student

-(float)calculateParkingFees:(BOOL)qualifiedByDistance
{
    float discountRate = 0;
    
    if(qualifiedByDistance)
    {
        discountRate = 0.1;
    }
    else
    {
        discountRate = 0;
    }
    
    float parkingDiscount = (float)kPARKING_COST;
    
    //NSLog(@"%f", parkingDiscount);
    
    self.parkingFee = parkingDiscount - (parkingDiscount*discountRate);

    return self.parkingFee;
}


-(void)calculateStudentParkingFees
{
    
    float discountRate = 0;
    
    if(self.isLessThan30Kms)
    {
        discountRate += 0.1;
        
        if(self.grade >= 70)
        {
            discountRate += 0.1;
        }
        else if(self.grade >= 60)
        {
            discountRate += 0.05;
        }

    }

    
    NSLog(@"discount rate %f", discountRate);
    
    float parkingDiscount = (float)kPARKING_COST;
    
    self.parkingFee = parkingDiscount - (parkingDiscount*discountRate);
}


@end
