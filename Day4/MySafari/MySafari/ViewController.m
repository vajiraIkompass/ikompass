//
//  ViewController.m
//  MySafari
//
//  Created by Vajira on 17/7/15.
//  Copyright (c) 2015 cosmic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIButton *buttonBack;
@property (weak, nonatomic) IBOutlet UIButton *buttonForward;
@property (weak, nonatomic) IBOutlet UIButton *buttonClear;
@property float initialWebOffset;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Setting default values
    self.buttonBack.enabled=NO;
    self.buttonForward.enabled=NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)webViewDidStartLoad:(UIWebView *)webView {
    //Start the loading spinner
    [UIApplication sharedApplication].networkActivityIndicatorVisible = true;
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    //Stop the loading spinner
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    //Enable web navigation
    [self onWebNavigation];
    
    //Setting page titile as the title of the navigation bar
    self.navigationItem.title =[webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    //Managing webview scrolling
    webView.scrollView.delegate = self;
    self.initialWebOffset= webView.scrollView.contentOffset.y;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //Loading the page on 'go' button press
    [self doLoadWebPage:textField.text];
    [textField resignFirstResponder];
    return YES;
}

-(void)doLoadWebPage:(NSString *)stringUrl {

    //If the url string is empty, stop processing the url
    if (!(stringUrl && stringUrl.length)) {
        return;
    }
    
    //Check whether url contain http or https, otherwise append it
    if ( !(([stringUrl rangeOfString:@"http://"].location == 0) || ([stringUrl rangeOfString:@"https://"].location == 0)) ) {
        stringUrl = [NSString stringWithFormat:@"http://%@", stringUrl];
    }
    
    //Create the URL and call the it
    NSURL *url = [NSURL URLWithString:stringUrl];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];

}

- (IBAction)onBackButtonPressed:(UIButton *)sender {
    
    //Managing web navigation backward
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
    
    [self onWebNavigation];
}

- (IBAction)onForwardButtonPressed:(UIButton *)sender {
    
    //Managing web navigation forward
    if ([self.webView canGoForward]) {
        [self.webView goForward];
    }
    
    [self onWebNavigation];
}

- (IBAction)onReloadButtonPressed:(UIButton *)sender {

    //Loding the url
    [self doLoadWebPage:self.urlTextField.text];
}

//Manage web navigation history
-(void)onWebNavigation {
    
    //Check whether can go back
    if ([self.webView canGoBack]) {
         self.buttonBack.enabled=YES;
    }
    else {
        self.buttonBack.enabled=NO;
    }
    
    //Check whether can go forward
    if ([self.webView canGoForward]) {
        self.buttonForward.enabled=YES;
    }
    else {
        self.buttonForward.enabled=NO;
    }
}

- (IBAction)touchUpNewFeatures:(UIButton *)sender {
    
    //Create action sheet for the message
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Coming soon!" message:nil
                                          preferredStyle:UIAlertControllerStyleActionSheet];
    
    //Cancel Button to close the action sheet
    UIAlertAction *actionCancel = [UIAlertAction
                    actionWithTitle:@"Cancel"
                    style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                    }];
    
    //Show the popup message
    [alertController addAction:actionCancel];
    [self presentViewController:alertController animated:YES
                     completion:nil];
    
}

- (IBAction)buttonClear:(UIButton *)sender {
    
    //Clear web url and content
    self.urlTextField.text = nil;
    [self.webView loadHTMLString:@"" baseURL:nil];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    //Managing the scroll location
    if([scrollView isEqual:self.webView.scrollView]) {
        float offset = scrollView.contentOffset.y;
        
        if(offset <= self.initialWebOffset) {
            [self scrolledToTop:YES];
        }
        else {
            [self scrolledToTop:NO];
        }
    }
}

//Do something based on the possion of the scorll
-(void)scrolledToTop:(BOOL)isTop {

    if (isTop) {
        self.urlTextField.alpha = 1;
        self.buttonClear.alpha = 1;
    } else {
        self.urlTextField.alpha = 0.2;
        self.buttonClear.alpha = 0.2;
    }
}


@end
