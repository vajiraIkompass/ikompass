//
//  Product.m
//  SellingStuff
//
//  Created by Vajira on 18/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "Product.h"

@interface Product()

@property (readwrite) NSString *name;

@end

@implementation Product

-(instancetype)initWithName:(NSString *)name {
    
    self = [super init];
    self.name = name;
    
    return self;
}

-(instancetype)init {
    
    NSException *exception = [NSException exceptionWithName:@"Invalid method called" reason:@"Use the initWithName method" userInfo:nil];
    [exception raise];
    
    //NSLog(@"Please use the 'initWithName'");
    //abort();
    return self;
}

@end
