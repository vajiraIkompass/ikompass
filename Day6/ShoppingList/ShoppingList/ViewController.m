//
//  ViewController.m
//  ShoppingList
//
//  Created by Vajira on 19/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "ViewController.h"
#import "ShopItem.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textboxShopItem;
@property (weak, nonatomic) IBOutlet UITableView *shoppingList;

@property NSArray *shopItemsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //Load the existing data
    [self doReadShoppingList];
}


//Create the current shopping list using already saved items
-(void)doReadShoppingList {
    
    //Get the data from the storage
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ShopItem" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    self.shopItemsArray = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    //Reload the table
    [self.shoppingList reloadData];
}

//Saving the shopping item
-(void)doSaveShoppingItem {
    
    NSString *strItem = self.textboxShopItem.text;
    
    //If the item is empty, ignore
    if (!(strItem && (strItem.length > 0))) {
        return;
    }
    
    //Save data locally
    NSManagedObject *shopItem = [NSEntityDescription insertNewObjectForEntityForName:@"ShopItem" inManagedObjectContext:self.managedObjectContext];
    [shopItem setValue:strItem forKey:@"item"];
    [self.managedObjectContext save:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.shopItemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Populating the table view
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    NSManagedObject *tmpObject = [self.shopItemsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [tmpObject valueForKeyPath:@"item"];
    
    return cell;
}

- (IBAction)onClickSaveButton:(UIButton *)sender {
    
    //Call save and reload the data if new data is available
    NSString *strItem = self.textboxShopItem.text;
    
    if (strItem && (strItem.length > 0)) {
        
        [self doSaveShoppingItem];
        [self doReadShoppingList];
        
        self.textboxShopItem.text = nil;
    }
}


@end
