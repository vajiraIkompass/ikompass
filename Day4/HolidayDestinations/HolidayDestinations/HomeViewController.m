//
//  ViewController.m
//  HolidayDestinations
//
//  Created by Vajira on 12/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "HomeViewController.h"
#import "HolidayViewController.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UITextField *travelerName;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton*)sender
{
    
    //UIViewController *destinationViewController = segue.destinationViewController;
    HolidayViewController *destinationViewController = segue.destinationViewController;
    
    destinationViewController.title = sender.currentTitle;
    destinationViewController.travelerName = self.travelerName.text;
    
    if([segue.identifier isEqualToString:@"Australia"]) {
        //destinationViewController.view.backgroundColor = [UIColor greenColor];
        destinationViewController.imageOfCountry = [UIImage imageNamed: @"australia"];
        destinationViewController.travelCountry = @"australia";
    }
    else {
        //destinationViewController.view.backgroundColor = [UIColor redColor];
        destinationViewController.imageOfCountry = [UIImage imageNamed:@"greece"];
        destinationViewController.travelCountry = @"greece";
    }
}

-(IBAction)unwindToThisViewController:(UIStoryboardSegue *)segue
{
        
        
}


@end

