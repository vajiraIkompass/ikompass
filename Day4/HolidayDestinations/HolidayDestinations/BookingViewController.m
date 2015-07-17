//
//  BookingViewController.m
//  HolidayDestinations
//
//  Created by Vajira on 12/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "BookingViewController.h"

@interface BookingViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblTravelerName;
@property (weak, nonatomic) IBOutlet UILabel *lblTravelDestination;
@property (weak, nonatomic) IBOutlet UILabel *lblTicketPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblTaxAmount;
@property (weak, nonatomic) IBOutlet UILabel *lblTotalAmount;

@property NSString *textmsg;

@end

@implementation BookingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.lblTravelerName.text = [NSString stringWithFormat:@"Name: %@", self.travelerName];
    
    self.lblTravelDestination.text = [NSString stringWithFormat:@"Country: %@", self.travelCountry];
    
    self.lblTicketPrice.text = [NSString stringWithFormat:@"Ticket Price: $%@", self.ticketPrice];
    
    //Calculating tax and total
    NSNumber *ticketCost = [NSNumber numberWithInt:[self.ticketPrice intValue]];
    NSNumber *taxAmount = [NSNumber numberWithFloat:[ticketCost intValue]*0.07];
    
    self.lblTaxAmount.text = [NSString stringWithFormat:@"GST: $%.2f",[taxAmount floatValue]];
    
    self.lblTotalAmount.text = [NSString stringWithFormat:@"Total Amount: $%.2f",([taxAmount floatValue]+[ticketCost floatValue])];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
