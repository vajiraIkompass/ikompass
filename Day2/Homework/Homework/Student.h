//
//  Student.h
//  Homework
//
//  Created by Vajira on 10/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kPARKING_COST 10

@interface Student : NSObject

@property NSString *firstName;
@property NSString *familyName;
@property int grade;
@property BOOL isLessThan30Kms;
@property float parkingFee;

-(float)calculateCurrentGroupMark:(float)byCurrentGroupMark bonus:(float)byBonusMark;

@end
