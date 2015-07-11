//
//  ViewController.m
//  GimmeRed
//
//  Created by Vajira on 11/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UILabel *studentGradeLabel;
@property (weak, nonatomic) IBOutlet UITextField *studenGradeText;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)onClickButton1:(UIButton *)sender {
    
    NSLog(@"title %@", sender.titleLabel.text);
    
    self.colorLabel.backgroundColor = [UIColor redColor];
    self.colorLabel.text = @"I'm red";
    
}


- (IBAction)showGradeButtonPressed:(UIButton *)sender {

    //NSString *userValue = self.studenGradeText.text;
    
    Student *std =[[Student alloc] init];
    //NSString *studentgrade = [std getCalculationsOfGrade:[NSNumber numberWithInt:75]];
    
    //NSString *studentgrade = [std getCalculationsOfGrade:[NSNumber numberWithFloat:[userValue floatValue] ]];
    
    NSNumber *stdNumGrade = [NSNumber numberWithInt:80];
    
    NSString *studentgrade = [std getCalculationsOfGrade:stdNumGrade];
    
    self.colorLabel.text = studentgrade;
    
    
    
}


@end
