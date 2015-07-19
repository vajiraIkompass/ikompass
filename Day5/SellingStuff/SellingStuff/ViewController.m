//
//  ViewController.m
//  SellingStuff
//
//  Created by Vajira on 18/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "ViewController.h"
#import "DataModel.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property DataModel *dataModel;
@property (weak, nonatomic) IBOutlet UITextField *labelTotal;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Product *product1 = [[Product alloc]initWithName:@"Blue Jeans"];
    product1.price = 100;
    
    //Product *product2 = [[Product alloc]init];
    
    /*
    Product *product1 = [[Product alloc]init];
    product1.name = @"Blue Jeans";
    product1.price = 100;
    
    Product *product2 = [[Product alloc]init];
    product2.name = @"Pink Socks";
    product2.price = 200;
    
    Product *product3 = [[Product alloc]init];
    product3.name = @"Sony Camera";
    product3.price = 50;
    
    Product *product4 = [[Product alloc]init];
    product4.name = @"Toshiba Laptop";
    product4.price = 4300;
    
    Product *product5 = [[Product alloc]init];
    product5.name = @"Car";
    product5.price =300;
    
    Product *product6 = [[Product alloc]init];
    product6.name = @"House";
    product6.price = 600;
    */
    
    self.dataModel = [[DataModel alloc]init];
    
    //self.dataModel.productsArray = [NSMutableArray arrayWithObjects:product1, product2, product3, product4, product5, product6, nil];
    self.dataModel.productsArray = [NSMutableArray arrayWithObjects:product1, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataModel.productsArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell  = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    
    Product *tmpProduct = [self.dataModel.productsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = tmpProduct.name;
    cell.detailTextLabel.text =  [NSString stringWithFormat:@"%d", tmpProduct.price];


    return cell;
}

- (IBAction)buttonGetTotalPrice:(UIButton *)sender {
    
    NSNumber *totalPrice = [self.dataModel getTotalPrice:self.dataModel.productsArray];
    self.labelTotal.text = [NSString stringWithFormat:@"$%d", [totalPrice intValue]];
    
    int i=9;
    NSInteger *x=0;
    
    x += i;
    NSLog(@"value of x: %zd = %tu", x, x);
    

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ProductDetailViewController *pvc = segue.destinationViewController;
    
    UITableViewCell *cell = sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    pvc.product = [self.dataModel.productsArray objectAtIndex:indexPath.row];
    
}



@end
