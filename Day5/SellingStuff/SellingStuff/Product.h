//
//  Product.h
//  SellingStuff
//
//  Created by Vajira on 18/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (readonly) NSString *name;
@property int price;

-(instancetype)initWithName:(NSString *)name;

@end
