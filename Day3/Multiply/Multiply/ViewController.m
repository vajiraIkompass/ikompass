//
//  ViewController.m
//  Multiply
//
//  Created by Vajira on 11/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *numberTextField;

@property (weak, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;

@property (weak, nonatomic) IBOutlet UILabel *sign;

@property (weak, nonatomic) IBOutlet UISlider *sliderChange;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Auto load the keyboard
    //[self.numberTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onCalculateButtonPressed:(UIButton *)sender {
    
    [self doCalculateButtonPressed:sender];
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    
    //Update the label value, based on the slider value. For the convenience, consider only int values
    self.multiplierLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
    
    
    
    
    
}

//Do the math work
-(void)doCalculateButtonPressed:(UIButton *)sender {
    
    NSNumber *nsNumberResult;
    
    //Change the math operation based on user selection
    if (self.operatorSegmentControl.selectedSegmentIndex == 0) {
        nsNumberResult = [NSNumber numberWithLong:([self.numberTextField.text intValue]*[self.multiplierLabel.text intValue])];
    } else {
        nsNumberResult = [NSNumber numberWithLong:([self.numberTextField.text intValue]/[self.multiplierLabel.text intValue])];
    }
    
    //Change the color based on the math-answer
    if(nsNumberResult >= [NSNumber numberWithLong:20]) {
        self.view.backgroundColor = [UIColor greenColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
    //Get the mod values for 3 & 5
    double modValueOf3 = fmod([nsNumberResult doubleValue], 3);
    double modValueOf5 = fmod([nsNumberResult longValue], 5);
    
    //NSLog(@"value: %ld - %ld yy", modValueOf3, modValueOf5); //Print the mod values
    
    //Change the math-answer based on mod values
    if (modValueOf3==0 && modValueOf5==0) {
        self.answerLabel.text = @"fizzbuzz";
    } else if (modValueOf3==0){
        self.answerLabel.text = @"fizz";
    } else if(modValueOf5==0){
        self.answerLabel.text = @"buzz";
    }
    else{
        self.answerLabel.text = [NSString stringWithFormat:@"%lf",[nsNumberResult doubleValue]];
    }
    
    //Resign first responder. This will hide the keyboard
    [self.numberTextField resignFirstResponder];

}

//Change the math-operator label based on user selection
- (IBAction)changeSegment:(UISegmentedControl *)sender {

    if (self.operatorSegmentControl.selectedSegmentIndex == 0) {
        self.sign.text = @"*";
    }
    else {
        self.sign.text = @"/";
    }

}

@end
