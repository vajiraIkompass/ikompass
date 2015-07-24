//
//  GameBoard.h
//  TicTacToe
//
//  Created by Vajira on 23/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameBoard : NSObject

-(BOOL)curretRoundWinner:(NSArray *)currentPlayingGrid;

-(instancetype)initWithArray:(NSArray *)playingGridArray;

@end
