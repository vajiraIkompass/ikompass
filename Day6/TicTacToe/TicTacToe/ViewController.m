//
//  ViewController.m
//  TicTacToe
//
//  Created by Vajira on 19/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "ViewController.h"
#import "GameBoard.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThree;
@property (weak, nonatomic) IBOutlet UILabel *labelFour;
@property (weak, nonatomic) IBOutlet UILabel *labelFive;
@property (weak, nonatomic) IBOutlet UILabel *labelSix;
@property (weak, nonatomic) IBOutlet UILabel *labelSeven;
@property (weak, nonatomic) IBOutlet UILabel *labelEight;
@property (weak, nonatomic) IBOutlet UILabel *labelNine;

@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;

@property NSMutableArray *labelArray, *playArray;
@property BOOL isStartPlayer;
@property GameBoard *gameBoard;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initGame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Find and update the current move
- (IBAction)onLabelTapped:(UITapGestureRecognizer *)sender {
    
    CGPoint point = [sender locationInView:self.view];
    UILabel *tappedLabel = [self findLabelUsingPoint:point];
    NSString *player = @"";

    if (tappedLabel) {
        
        if (self.isStartPlayer) {
            player = @"X";
            tappedLabel.textColor = [UIColor redColor];
            
            self.whichPlayerLabel.text = @"Play: Player 'O'";
            self.isStartPlayer = NO;
        } else {
            player = @"O";
            tappedLabel.textColor = [UIColor blueColor];
            
            self.whichPlayerLabel.text = @"Play: Player 'X'";
            self.isStartPlayer = YES;
        }
        
        tappedLabel.text = player;
        
        [self.playArray replaceObjectAtIndex:tappedLabel.tag withObject:player];
        [self playCurrentRound:player];
        
        tappedLabel = nil;
    }

}

//Find the current playing square
-(UILabel*)findLabelUsingPoint:(CGPoint)point {

    //Checking which label contains the touch point
    for (UILabel *tmpLabel in self.labelArray) {

        if(tmpLabel && (CGRectContainsPoint(tmpLabel.frame, point)))
        {
            [self.labelArray removeObject:tmpLabel]; //To avoid playing the same place again
            return tmpLabel;
        }
    }

    return nil;
}

//Process the current-round's outcome
-(void)playCurrentRound:(NSString *)player {

    BOOL result = [self.gameBoard curretRoundWinner:self.playArray];
    
    if (result) {
        self.whichPlayerLabel.text = [NSString stringWithFormat: @"Win: Player '%@'", player];
        self.labelArray = nil;
        return;
    }

    if (self.labelArray.count==0) { //End of the game
        self.whichPlayerLabel.text = [NSString stringWithFormat: @"Draw: End of the game!"];
    }
}

//Initialize the game
-(void)initGame {

    //Create a button array and prepare squares
    self.labelArray = [NSMutableArray arrayWithObjects:self.labelOne, self.labelTwo,self.labelThree, self.labelFour, self.labelFive, self.labelSix, self.labelSeven, self.labelEight, self.labelNine, nil];
    
    for (UILabel *tmpLabel in self.labelArray) {
        tmpLabel.text = @"";
    }
    
    //Create gameboard grid for paly
    self.playArray = [NSMutableArray arrayWithObjects:@"", @"", @"", @"", @"", @"", @"", @"", @"", nil];
    self.gameBoard = [[GameBoard alloc] initWithArray:self.playArray];
    
    //Set the starting player
    self.isStartPlayer = YES;
    self.whichPlayerLabel.text = @"Play: Player 'X'";
}


//Restart the game
- (IBAction)onClickRestartGame:(UIButton *)sender {
    
    [self initGame];
}


@end
