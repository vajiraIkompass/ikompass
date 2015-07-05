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
        [john calculateParkingFees:TRUE];
        john.firstName = @"John";
        john.lastName = @"Tan";
        john.grade = 75;
        john.isLessThan30Kms=TRUE;
        NSLog(@"parking fee for %@ is %.2f", john.firstName, [john parkingFee]);
        
        Student *roger = [[Student alloc] init];
        [roger calculateParkingFees:FALSE];
        roger.firstName = @"John";
        roger.lastName = @"Tan";
        roger.grade = 75;
        roger.isLessThan30Kms=FALSE;
        NSLog(@"parking fee for %@ is %.2f", roger.firstName, [roger parkingFee]);
        
        Student *vajira = [[Student alloc] init];
        [vajira calculateParkingFees:TRUE];
        vajira.firstName = @"vajira";
        vajira.lastName = @"r";
        vajira.grade = 75;
        vajira.isLessThan30Kms=TRUE;
        NSLog(@"parking fee for %@ is %.2f", vajira.firstName, [vajira parkingFee]);
        
        Student *yanBin = [[Student alloc] init];
        [yanBin calculateParkingFees:TRUE];
        yanBin.firstName = @"yanBin";
        yanBin.lastName = @"p";
        yanBin.grade = 75;
        yanBin.isLessThan30Kms=TRUE;
        NSLog(@"parking fee for %@ is %.2f", yanBin.firstName, [yanBin parkingFee]);
        
        Student *roshan = [[Student alloc] init];
        [roshan calculateParkingFees:NO];
        roshan.firstName = @"roshan";
        roshan.lastName = @"t";
        roshan.grade = 75;
        roshan.isLessThan30Kms=NO;
        NSLog(@"parking fee for %@ is %.2f", roshan.firstName, [roshan parkingFee]);
        
        NSLog(@"-----------------------------");
        
        NSArray *students = @[john, roger, vajira, yanBin, roshan];
            
        for (Student *eachStudent in students)
        {
            [eachStudent calculateParkingFees:eachStudent.isLessThan30Kms];
            
            if(true)
            {
                
            }
            else{
                
            }
            
            NSLog(@"parking fee for %@ is %.2f", eachStudent.firstName, [eachStudent parkingFee]);
        }
        
        NSLog(@"-----------------------------");

        [vajira calculateStudentParkingFees];
        NSLog(@"parking fee for %@ is %.2f", vajira.firstName, vajira.parkingFee);
        
    }

    return 0;
}
