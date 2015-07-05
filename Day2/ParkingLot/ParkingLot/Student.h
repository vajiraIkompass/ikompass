//
//  Student.h
//  ParkingLot
//
//  Created by Vajira on 5/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kPARKING_COST 10

@interface Student : NSObject

@property NSString *firstName;
@property NSString *lastName;
@property int grade;
@property BOOL isLessThan30Kms;
@property float parkingFee;

-(float)calculateParkingFees:(BOOL)qualifiedByDistance;
-(void)calculateStudentParkingFees;


@end
