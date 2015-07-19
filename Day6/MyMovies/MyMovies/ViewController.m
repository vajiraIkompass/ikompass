//
//  ViewController.m
//  MyMovies
//
//  Created by Vajira on 19/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "ViewController.h"
#import "Movie.h"
#import "SelectedMoviesViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property NSArray *movieArray;
@property (weak, nonatomic) IBOutlet UITableView *movieTable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://www.ikompass.com.sg/iOS.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        self.movieArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        [self.movieTable reloadData];
        
        //NSString *jsonRequest = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //NSLog(@"%@", jsonRequest);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.movieArray.count;;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    
    NSDictionary *tmpDictionary = [self.movieArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [tmpDictionary objectForKey:@"name"];
    cell.detailTextLabel.text = [tmpDictionary objectForKey:@"actor"];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    SelectedMoviesViewController *smvc = segue.destinationViewController;
    smvc.managedObjectContext = self.managedObjectContext;
    
}


- (IBAction)onSaveButtonPresse:(UIBarButtonItem *)sender {
    
    for (NSDictionary *eachMovie in self.movieArray) {

        NSManagedObject *movie = [NSEntityDescription insertNewObjectForEntityForName:@"Movie" inManagedObjectContext:self.managedObjectContext];
        NSString *name = [eachMovie objectForKey:@"name"];
        
        [movie setValue:name forKey:@"name"];
        [movie setValue:[eachMovie objectForKey:@"actor"] forKey:@"actor"];
        [movie setValue:[eachMovie objectForKey:@"genre"] forKey:@"genre"];
        
    }

    [self.managedObjectContext save:nil];

}


@end
