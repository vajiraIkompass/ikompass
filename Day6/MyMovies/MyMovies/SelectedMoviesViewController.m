//
//  SelectedMoviesViewController.m
//  MyMovies
//
//  Created by Vajira on 19/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "SelectedMoviesViewController.h"
#import "Movie.h";

@interface SelectedMoviesViewController () <UITableViewDataSource, UITableViewDelegate>

@property NSArray *savedMoviesArray;

@end

@implementation SelectedMoviesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Movie" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    self.savedMoviesArray = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.savedMoviesArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell2" forIndexPath:indexPath];
    
    NSManagedObject *tmpObject = [self.savedMoviesArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [tmpObject valueForKeyPath:@"name"];
    
    
    //NSDictionary *tmpDictionary = [self.movieArray objectAtIndex:indexPath.row];
    
    //cell.textLabel.text = [tmpDictionary objectForKey:@"name"];
    //cell.detailTextLabel.text = [tmpDictionary objectForKey:@"actor"];
    
    return cell;
}

@end
