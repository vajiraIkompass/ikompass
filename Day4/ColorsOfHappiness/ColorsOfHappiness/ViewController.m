//
//  ViewController.m
//  ColorsOfHappiness
//
//  Created by Vajira on 12/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSArray *colorArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Creating a color array based on UIColors
    UIColor *red = [UIColor redColor];
    UIColor *yellow = [UIColor yellowColor];
    UIColor *blue = [UIColor blueColor];
    UIColor *green = [UIColor greenColor];
    UIColor *gray = [UIColor grayColor];
    UIColor *purple = [UIColor purpleColor];
    
    self.colorArray = [NSArray arrayWithObjects:red,yellow,blue,green,gray,purple, nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //Define the number of row to show
    return self.colorArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    //Creating and formatting the raw-cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    //cell.textLabel.text = [NSString stringWithFormat:@"Row no %ld", indexPath.row];

    //Different color cells, based on the color array
    cell.backgroundColor = [self.colorArray objectAtIndex:indexPath.row];

    //Different color cells, based on cell location
    /*
    switch (indexPath.row) {
        case 0:
            cell.backgroundColor = [UIColor redColor];
            break;
        case 1:
            cell.backgroundColor = [UIColor greenColor];
            break;
        case 2:
            cell.backgroundColor = [UIColor yellowColor];
            break;
        case 3:
            cell.backgroundColor = [UIColor blueColor];
            break;
        default:
            cell.backgroundColor = cell.contentView.backgroundColor;
            break;
    }
    */

    return cell;
}



@end
