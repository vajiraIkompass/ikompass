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

@property NSMutableArray *shopItemsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //Load the existing data
    [self doReadShoppingList];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.shopItemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Populating the table view
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    NSManagedObject *tmpShopItemObject = [self.shopItemsArray objectAtIndex:indexPath.row];
    
    //Set cell text
    cell.textLabel.text = [tmpShopItemObject valueForKeyPath:@"item"];
    
    //Set cell style
    if ([[tmpShopItemObject valueForKey:@"isDone"] boolValue])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

//Adding new item and saving it
- (IBAction)onClickSaveButton:(UIButton *)sender {
    
    //Call save and reload the data if new data is available
    NSString *strItem = self.textboxShopItem.text;
    
    if (strItem && (strItem.length > 0)) {
        
        [self doSaveShoppingItem];
        [self doReadShoppingList];
        
        self.textboxShopItem.text = nil;
        [self.textboxShopItem resignFirstResponder];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self doUpdateItem:tableView byIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self doDeleteItem:editingStyle byIndexPath:indexPath];
}


//-- main data model operations --
//Note: these operations can be pushed to a seperate 'DataModel' class as well


//Create the current shopping list using already saved items
-(void)doReadShoppingList {
    
    //Get the data from the storage
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ShopItem" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    //self.shopItemsArray = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil]; //Need a mutable array in order to avoid getting data from physical storage
    self.shopItemsArray = [[NSMutableArray alloc] init];
    self.shopItemsArray = [[self.managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
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
    NSManagedObject *tmpShopItem = [NSEntityDescription insertNewObjectForEntityForName:@"ShopItem" inManagedObjectContext:self.managedObjectContext];
    //Setting values for the object
    [tmpShopItem setValue:strItem forKey:@"item"];
    [tmpShopItem setValue:FALSE forKey:@"isDone"];
    
    [self.managedObjectContext save:nil];
}

//Delete a shop item
-(void)doDeleteItem:(UITableViewCellEditingStyle)editingStyle byIndexPath:(NSIndexPath *) indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Delete object from database
        [self.managedObjectContext deleteObject:[self.shopItemsArray objectAtIndex:indexPath.row]];
        
        NSError *saveError = nil;
        
        if ([self.managedObjectContext save:&saveError]) {
            
            //Remove the item from the array and table view respectively
            [self.shopItemsArray removeObjectAtIndex:indexPath.row];
            [self.shoppingList deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        else {
            
            //Show popup to show the error
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Error deleting the item"
                                  message:nil
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
            [alert show];

            //NSLog(@"Shop item cant delete from the local database %@ %@", saveError, [saveError localizedDescription]);
            
            return; //stop operation
        }

    }
}

//Updating a shop item
-(void)doUpdateItem:(UITableView *)tableView byIndexPath:(NSIndexPath *) indexPath{
    
    //Getting the item object for edit
    NSManagedObject *ShopItem = [self.shopItemsArray objectAtIndex:indexPath.row];
    
    //Getting the current cell
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    BOOL isChecked = FALSE;
    
    //Toggle the tick
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark)
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        isChecked = TRUE;
    }

    //Update the object values
    [ShopItem setValue:[NSNumber numberWithBool:isChecked] forKey:@"isDone"];

    NSError *saveError = nil;
    
    if (![self.managedObjectContext save:&saveError]) {

        //Show popup to show the error
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Error updating the item"
                              message:nil
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
        
        //NSLog(@"Shop item cant update to the local database %@ %@", saveError, [saveError localizedDescription]);
        
        //Reset the tick
        if (isChecked) {
            cell.accessoryType = UITableViewCellAccessoryNone;
        } else {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
    
}


@end
