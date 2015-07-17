//
//  ViewController.m
//  NasaBrowser
//
//  Created by Vajira on 12/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate, UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    NSString *stringUrl = @"http://www.ikompass.com.sg/";
    NSURL *url = [NSURL URLWithString:stringUrl];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    */
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = true;
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}


-(void)textFieldDidEndEditing:(UITextField *)textField {
    
    NSLog(@"%@", textField.text);
    
    /*
    NSString *stringUrl = @"http://www.ikompass.com.sg/";
    //NSString *stringUrl = textField.text;
    NSURL *url = [NSURL URLWithString:stringUrl];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
    
    
    NSLog(@"%@", textField.text);
    */
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    NSLog(@"--%@", textField.text);
    
    
    NSString *stringUrl = textField.text;
    NSURL *url = [NSURL URLWithString:stringUrl];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    return YES;
}






@end
