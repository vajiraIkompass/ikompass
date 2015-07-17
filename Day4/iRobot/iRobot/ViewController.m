//
//  ViewController.m
//  iRobot
//
//  Created by Vajira on 18/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *theFuture;
@property (weak, nonatomic) IBOutlet UILabel *thePast;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onDrag:(UIPanGestureRecognizer *)panGesture {
    
    NSLog(@"OnDrag");
    CGPoint point = [panGesture locationInView:self.view];
    self.theFuture.center = point;
    
    if(CGRectContainsPoint(self.thePast.frame, point)) {
        self.theFuture.backgroundColor = [UIColor redColor];
        
        self.theFuture.text = @"Days of the Future, past, present";
        [self.theFuture sizeToFit];
    }
    
}


@end
