//
//  DataModel.m
//  SellingStuff
//
//  Created by Vajira on 18/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

-(NSNumber *)getTotalPrice:(NSArray *)byProducts {
    
    if(byProducts == nil || byProducts.count < 1)
    {
        return [NSNumber numberWithInt:0];
    }
    
    int totalPrice = 0;
    for (Product *tmpProduct in byProducts) {
        totalPrice += tmpProduct.price;
    }
    
    return [NSNumber numberWithInt:totalPrice];
}

-(NSNumber *)getTotalPrice {
    
    if(self.productsArray == nil || self.productsArray.count < 1)
    {
        return [NSNumber numberWithInt:0];
    }
    
    int totalPrice = 0;
    for (Product *tmpProduct in self.productsArray) {
        totalPrice += tmpProduct.price;
    }
    
    return [NSNumber numberWithInt:totalPrice];
}


@end
