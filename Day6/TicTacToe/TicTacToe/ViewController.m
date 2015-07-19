//
//  ViewController.m
//  TicTacToe
//
//  Created by Vajira on 19/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "ViewController.h"

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

@property NSArray *labelArray;
@property NSInteger currentPlayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.labelArray = [NSArray arrayWithObjects:self.labelOne, self.labelTwo,self.labelThree, self.labelFour, self.labelFive, self.labelSix, self.labelSeven, self.labelEight, self.labelNine, nil];
    
    self.currentPlayer = 0;
    self.whichPlayerLabel.text = @"Play: Player 1";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)onLabelTapped:(UITapGestureRecognizer *)sender {
    
    CGPoint point = [sender locationInView:self.view];
    
    UILabel *tappedLabel = [self findLabelUsingPoint:point];
    
    if (tappedLabel) {
        tappedLabel.backgroundColor = [UIColor redColor];

        if (self.currentPlayer > 0) {
            self.whichPlayerLabel.text = @"Play: Player 1";
            self.currentPlayer --;
            
            tappedLabel.text = @"X";
        }
        else
        {
            self.whichPlayerLabel.text = @"Play: Player 2";
            self.currentPlayer ++;
            
            tappedLabel.text = @"O";
        }
    }
    
    NSLog(@" %f - %f", point.x, point.y);
}



-(UILabel*)findLabelUsingPoint:(CGPoint)point {
    
    //Checking which label contains the touch point
    for (UILabel *tmpLabel in self.labelArray) {

        if(tmpLabel && (CGRectContainsPoint(tmpLabel.frame, point))) {
            return tmpLabel;
        }
    }
    
    return nil;
}



@end
