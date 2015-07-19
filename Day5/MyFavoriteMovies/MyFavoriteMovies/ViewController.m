//
//  ViewController.m
//  MyFavoriteMovies
//
//  Created by Vajira on 18/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "ViewController.h"
#import "PreviewViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

//@property NSDictionary *movieDictionary;
@property NSArray *movieArray;
@property (weak, nonatomic) IBOutlet UITableView *movieTable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
    NSDictionary *movieDictionary1 = [NSDictionary dictionaryWithObjectsAndKeys:@"Bond Identity",@"name",@"Matt Damon",@"actor",@"Action",@"genre", nil];
    NSDictionary *movieDictionary2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Terminator",@"name",@"Arnold",@"actor",@"Action",@"genre", nil];
    NSDictionary *movieDictionary3 = [NSDictionary dictionaryWithObjectsAndKeys:@"Titanic",@"name",@"some actor",@"actor",@"Love",@"genre", nil];
    self.movieArray = [NSArray arrayWithObjects:movieDictionary1, movieDictionary2, movieDictionary3 , nil];
    NSLog(@"%@", [self.movieDictionary objectForKey:@"name"]);
    */

    //Internet request
    NSURL *url = [NSURL URLWithString:@"http://www.ikompass.com.sg/iOS.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        //NSString *jsonRequest = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //NSLog(@"%@", jsonRequest);
        
        self.movieArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        [self.movieTable reloadData];

    }];
    
    
    
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
    
    PreviewViewController *pvc = segue.destinationViewController;
    NSIndexPath *currentIndex = [self.movieTable indexPathForCell:sender];
    
    switch (currentIndex.row) {
        case 0:
            pvc.movieImage = [UIImage imageNamed:@"bourneIdentity"];
            break;
        case 1:
            pvc.movieImage = [UIImage imageNamed:@"crash"];
            break;
        case 2:
            pvc.movieImage = [UIImage imageNamed:@"taken"];
            break;
        default:
            pvc.movieImage = [UIImage imageNamed:@"theEqualizer"];
            break;
    }
}


@end
