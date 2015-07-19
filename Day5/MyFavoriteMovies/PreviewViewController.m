//
//  PreviewViewController.m
//  MyFavoriteMovies
//
//  Created by Vajira on 18/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "PreviewViewController.h"

@interface PreviewViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imageView.image = self.movieImage;
    
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
