//
//  HolidayViewController.m
//  HolidayDestinations
//
//  Created by Vajira on 12/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "HolidayViewController.h"

@interface HolidayViewController()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *lblTravelerName;
@property (weak, nonatomic) IBOutlet UILabel *lblTravelCost;

@property NSString *ticketPrice;


@end

@implementation HolidayViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.imageView.image = self.imageOfCountry;
    self.lblTravelerName.text = [NSString stringWithFormat:@"Hi, %@", self.travelerName];
    
    self.ticketPrice = @"";
    
    if ([self.travelCountry isEqualToString:@"australia"]) {
        self.ticketPrice = @"2000";
    } else if ([self.travelCountry isEqualToString:@"greece"]){
        self.ticketPrice=  @"3000";
    }
    
    self.lblTravelCost.text = [NSString stringWithFormat:@"$%@", self.ticketPrice];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    
    BookingViewController *bookingViewController = segue.destinationViewController;
    
    bookingViewController.travelerName = self.travelerName;
    bookingViewController.travelCountry = self.travelCountry;
    bookingViewController.ticketPrice = self.ticketPrice;
    
}

@end
