//
//  main.m
//  ParkingLot
//
//  Created by Vajira on 5/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {

    
        Student *john = [[Student alloc] init];
        //[john calculateParkingFees:TRUE grade:75];
        john.firstName = @"John";
        john.familyName = @"Tan";
        john.grade = 75;
        john.isLessThan30Kms=TRUE;
        //NSLog(@"parking fee for %@ is %.2f", john.firstName, [john parkingFee]);
        
        Student *roger = [[Student alloc] init];
        //[roger calculateParkingFees:FALSE];
        roger.firstName = @"Roger";
        roger.familyName = @"Tan";
        roger.grade = 75;
        roger.isLessThan30Kms=FALSE;
        //NSLog(@"parking fee for %@ is %.2f", roger.firstName, [roger parkingFee]);
        
        Student *vajira = [[Student alloc] init];
        //[vajira calculateParkingFees:TRUE];
        vajira.firstName = @"vajira";
        vajira.familyName = @"r";
        vajira.grade = 75;
        vajira.isLessThan30Kms=TRUE;
        //NSLog(@"parking fee for %@ is %.2f", vajira.firstName, [vajira parkingFee]);
        
        Student *yanBin = [[Student alloc] init];
        //[yanBin calculateParkingFees:TRUE];
        yanBin.firstName = @"yanBin";
        yanBin.familyName = @"p";
        yanBin.grade = 75;
        yanBin.isLessThan30Kms=TRUE;
        //NSLog(@"parking fee for %@ is %.2f", yanBin.firstName, [yanBin parkingFee]);
        
        Student *roshan = [[Student alloc] init];
        //[roshan calculateParkingFees:NO];
        roshan.firstName = @"roshan";
        roshan.familyName = @"t";
        roshan.grade = 75;
        roshan.isLessThan30Kms=NO;
        //NSLog(@"parking fee for %@ is %.2f", roshan.firstName, [roshan parkingFee]);
        
        
        //Creating a student array
        NSArray *students = @[john, roger, vajira, yanBin, roshan];
        
        
        //Calculate parking fees for each studet based on their home-distance and grade
        for (Student *eachStudent in students) {
            [eachStudent calculateParkingFeesByQualifiedDistance:eachStudent.isLessThan30Kms grade:eachStudent.grade];
            NSLog(@"parking fee for %@ is %.2f", eachStudent.firstName, [eachStudent parkingFee]);
        }
        

        //Calculate parking fees for each studet based on their home-distance and grade, using 'self'
        for (Student *eachStudent in students) {
            [eachStudent calculateStudentParkingFees];
            NSLog(@"parking fee for %@ is %.2f", eachStudent.firstName, eachStudent.parkingFee);
        }
    }

    return 0;
}


