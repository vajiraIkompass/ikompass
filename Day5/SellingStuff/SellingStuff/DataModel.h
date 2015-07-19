//
//  DataModel.h
//  SellingStuff
//
//  Created by Vajira on 18/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@interface DataModel : NSObject

@property NSMutableArray *productsArray;
-(NSNumber *)getTotalPrice:(NSArray *)byProducts;
-(NSNumber *)getTotalPrice;

@end
