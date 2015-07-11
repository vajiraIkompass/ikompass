//
//  main.m
//  Homework
//
//  Created by Vajira on 10/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "ArtStudent.h"
#import "ScienceStudent.h"


//Calculating the average mark for the class
//Assumption: Individual student bonus is equal to the value given to the class
float calculateAvgForClass(NSArray *students, float classBonus) {
    
    //No students for the class
    if(students == nil || students.count == 0)
    {
        return 0.0;
    }
    
    //Calculating the average grade for the class
    float sumGrade = 0.0;
    
    for (Student *eachStudent in students)
    {
        sumGrade = [eachStudent calculateCurrentGroupMark:sumGrade bonus:classBonus];
    }
    
    return (sumGrade/[students count]);
}

//Calculating the standard deviation for the class
float calculateStdForClass(NSArray *students) {
    
    //No students for the class
    if(students == nil || students.count == 0) {
        return 0.0;
    }
    
    NSMutableArray *numbers = [NSMutableArray array];
    
    //Create a grade array to calculate standard deviation
    for (Student *eachStudent in students) {
        [numbers addObject:[NSNumber numberWithInt:eachStudent.grade]];
    }

    //Calculating the standard deviation
    NSExpression *expression = [NSExpression expressionForFunction:@"stddev:" arguments:@[[NSExpression expressionForConstantValue:numbers]]];
    NSNumber *value = [expression expressionValueWithObject:nil context:nil];

    return [value floatValue];
}


//Main
int main(int argc, const char * argv[]) {
    @autoreleasepool {

        //Q1: Creating 10 student objects, with values
        Student *john = [[Student alloc] init],
                *roger = [[Student alloc] init],
                *vajira = [[Student alloc] init],
                *yanBin = [[Student alloc] init],
                *alan = [[Student alloc] init],
                *student6 = [[Student alloc] init],
                *student7 = [[Student alloc] init],
                *student8 = [[Student alloc] init],
                *student9 = [[Student alloc] init],
                *student10 = [[Student alloc] init];
        
        
        john.firstName = @"John";
        john.familyName = @"Tan";
        john.grade = 65;
        
        roger.firstName = @"Roger";
        roger.familyName = @"Tan";
        roger.grade = 75;
        
        vajira.firstName = @"Vajira";
        vajira.familyName = @"Rathnayake";
        vajira.grade = 85;
        
        yanBin.firstName = @"YanBin";
        yanBin.familyName = @"Tan";
        yanBin.grade = 80;
        
        alan.firstName = @"Alan";
        alan.familyName = @"Xin";
        alan.grade = 70;
        
        student6.firstName = @"Student6";
        student6.familyName = @"Tan";
        student6.grade = 60;
        
        student7.firstName = @"Student7";
        student7.familyName = @"Tan";
        student7.grade = 72;
        
        student8.firstName = @"Student8";
        student8.familyName = @"Tan";
        student8.grade = 89;
        
        student9.firstName = @"Student9";
        student9.familyName = @"Tan";
        student9.grade = 92;
        
        student10.firstName = @"Student10";
        student10.familyName = @"Tan";
        student10.grade = 50;
        
        //Q2: Creating a student array
        NSArray *students = @[john, roger, vajira, yanBin, alan, student6, student7, student8, student9, student10];
        
        //Q3: Calculate the average grade for the class
        float averageGradeWithoutBonus = calculateAvgForClass(students, 0.0);
        NSLog(@"Average grade for the class: %.2f", averageGradeWithoutBonus);
        
        //Q4: Calculate the average mark with bonus
        float averageGradeWithBonus = calculateAvgForClass(students, 5.0);
        NSLog(@"Average grade with bonus: %.2f", averageGradeWithBonus);
        
        //Q5: Get the class classification
        //Assumption: Class classification is based on the marks without bonus
        NSString *classClassification = @"Average";
        
        int roundAverageGradeWithoutBonus = round(averageGradeWithoutBonus);
        
        if ( roundAverageGradeWithoutBonus >= 70) {
            classClassification = @"Excellent";

        } else if ( roundAverageGradeWithoutBonus < 70 && roundAverageGradeWithoutBonus >= 60) {
            classClassification = @"Good";
            
        }
        
        NSLog(@"Class clacification for this class is: %@", classClassification);
        
        //Q6: Calculating the standard deviation for the class
        //Assumption: Class standard deviation is based on the marks without bonus
        float stdGradeWithoutBonus = calculateStdForClass(students);
        
        NSLog(@"Standard Deviation for this class is: %.2f", stdGradeWithoutBonus);
        
        //Q7: Creating sub classes
        //Q8: Creating sub class objects
        
        ArtStudent  *artStudent1 = [[ArtStudent alloc] init],
                    *artStudent2 = [[ArtStudent alloc] init],
                    *artStudent3 = [[ArtStudent alloc] init],
                    *artStudent4 = [[ArtStudent alloc] init],
                    *artStudent5 = [[ArtStudent alloc] init];
        
        
        artStudent1.firstName = @"artStudent1";
        artStudent1.familyName = @"Student";
        artStudent1.grade = 60;
        artStudent1.numberOfArtArtifacts = 5;

        
        artStudent2.firstName = @"artStudent2";
        artStudent2.familyName = @"Student";
        artStudent2.grade = 70;
        artStudent2.numberOfArtArtifacts = 7;
        
        artStudent3.firstName = @"artStudent3";
        artStudent3.familyName = @"Student";
        artStudent3.grade = 75;
        artStudent3.numberOfArtArtifacts = 9;

        artStudent4.firstName = @"artStudent4";
        artStudent4.familyName = @"Student";
        artStudent4.grade = 80;
        artStudent4.numberOfArtArtifacts = 4;
        
        artStudent5.firstName = @"artStudent5";
        artStudent5.familyName = @"Student";
        artStudent5.grade = 85;
        artStudent5.numberOfArtArtifacts = 12;

        
        ScienceStudent  *scienceStudent1 = [[ScienceStudent alloc] init],
                        *scienceStudent2 = [[ScienceStudent alloc] init],
                        *scienceStudent3 = [[ScienceStudent alloc] init],
                        *scienceStudent4 = [[ScienceStudent alloc] init],
                        *scienceStudent5 = [[ScienceStudent alloc] init];
        
        
        scienceStudent1.firstName = @"scienceStudent1";
        scienceStudent1.familyName = @"Student";
        scienceStudent1.grade = 40;
        scienceStudent1.numberOfExperimentsDone = 2;
        
        scienceStudent2.firstName = @"scienceStudent2";
        scienceStudent2.familyName = @"Student";
        scienceStudent2.grade = 42;
        scienceStudent2.numberOfExperimentsDone = 5;
        
        scienceStudent3.firstName = @"scienceStudent3";
        scienceStudent3.familyName = @"Student";
        scienceStudent3.grade = 60;
        scienceStudent3.numberOfExperimentsDone = 4;
        
        scienceStudent4.firstName = @"scienceStudent4";
        scienceStudent4.familyName = @"Student";
        scienceStudent4.grade = 78;
        scienceStudent4.numberOfExperimentsDone = 5;
        
        scienceStudent5.firstName = @"scienceStudent5";
        scienceStudent5.familyName = @"Student";
        scienceStudent5.grade = 65;
        scienceStudent5.numberOfExperimentsDone = 3;
        
        //Q9: Calculating the sum of numbers
        int startValue=1, endValue=100, sumOfValues=0;

        for(int i=startValue; i<=endValue; i++) {
            sumOfValues += i;
        }
        
        NSLog(@"Sum of numbers from %d to %d is: %d", startValue, endValue, sumOfValues);
        
    }
    return 0;
}





