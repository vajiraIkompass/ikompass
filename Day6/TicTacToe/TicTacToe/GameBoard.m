//
//  GameBoard.m
//  TicTacToe
//
//  Created by Vajira on 23/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "GameBoard.h"

@interface GameBoard()

@property NSArray *playingGridArray;
@property int gridSize;

@end


@implementation GameBoard


-(instancetype)initWithArray:(NSArray *)playingGridArray {
    
    //ToDo: Validate the array is collection of strings
    //ToDo: Check whether the array count is a squre valuen of an integer
    
    if ( !(playingGridArray && (playingGridArray.count >=9)) ) {
        NSException *exception = [NSException exceptionWithName:@"Invalid playing grid!" reason:@"Not enough squares to play" userInfo:nil];
        [exception raise];
    }
    
    self.playingGridArray = playingGridArray;
    self.gridSize = sqrt(self.playingGridArray.count);

    return self;
}

-(instancetype)init {
    
    NSException *exception = [NSException exceptionWithName:@"Invalid method called" reason:@"Use the initWithArray method" userInfo:nil];
    [exception raise];

    return self;
}



-(BOOL)curretRoundWinner:(NSArray *)currentPlayingGrid {
    
    self.playingGridArray = currentPlayingGrid;

    NSString *cuttentText = @"";
    int countSimilar = 0;
    
    //Checking raw values
    for (int lpRaw=0; lpRaw<self.gridSize; lpRaw++) {
        
        countSimilar = 0;
        
        for (int lpCol=0; lpCol<self.gridSize; lpCol++) {

            cuttentText = [self.playingGridArray objectAtIndex:(lpRaw*self.gridSize+lpCol)];
            
            if ( cuttentText.length < 1 ) {
                continue; //Empty squres
            }
            else if ([[self.playingGridArray objectAtIndex:(lpRaw*self.gridSize)] isEqualToString:cuttentText]) {
                countSimilar++; //Text match
            }
            else {
                continue; //No point of checking further
            }
        }
        
        if (countSimilar==self.gridSize) {
            NSLog(@"Row win !!!");
            return YES;
        }
    }

    
    //Checking column values
    for (int lpRaw=0; lpRaw<self.gridSize; lpRaw++) {
        
        countSimilar = 0;
        
        for (int lpCol=0; lpCol<self.gridSize; lpCol++) {
            
            cuttentText = [self.playingGridArray objectAtIndex:(lpRaw+self.gridSize*lpCol)];
            
            if ( cuttentText.length < 1 ) {
                continue; //Empty squres
            }
            else if ([[self.playingGridArray objectAtIndex:(lpRaw)] isEqualToString:cuttentText]) {
                countSimilar++; //Text match
            }
            else {
                continue; //No point of checking further
            }
        }
        
        if (countSimilar==self.gridSize) {
            NSLog(@"Column win !!!");
            return YES;
        }
    }
    
    
    //Checking diagonal(\) values
    countSimilar = 0;
    for (int lpRaw=0, lpCol=0; lpRaw<self.gridSize; lpRaw++, lpCol++) {
        
        cuttentText = [self.playingGridArray objectAtIndex:(lpRaw*self.gridSize+lpCol)];
        
        if ( cuttentText.length < 1 ) {
            continue; //Empty squres
        }
        else if ([[self.playingGridArray objectAtIndex:0] isEqualToString:cuttentText]) {
            countSimilar++; //Text match
        }
        else {
            continue; //No point of checking further
        }
        
        if (countSimilar==self.gridSize) {
            NSLog(@"Diagonal win !!!");
            return YES;
        }
    }
    
    //Checking diagonal(/) values
    countSimilar = 0;
    for (int lpRaw=(self.gridSize-1), lpCol=0; lpRaw>=0; lpRaw--, lpCol++) {
        
        cuttentText = [self.playingGridArray objectAtIndex:(lpRaw*self.gridSize+lpCol)];
        
        if ( cuttentText.length < 1 ) {
            continue; //Empty squres
        }
        else if ([[self.playingGridArray objectAtIndex:(self.gridSize-1)] isEqualToString:cuttentText]) {
            countSimilar++; //Text match
        }
        else {
            continue; //No point of checking further
        }
        
        if (countSimilar==self.gridSize) {
            NSLog(@"Diagonal win !!!");
            return YES;
        }
    }

    return NO;
}



@end
