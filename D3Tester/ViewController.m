//
//  ViewController.m
//  D3Tester
//
//  Created by Steven Vandeweghe on 5/24/13.
//  Copyright (c) 2013 Blue Crowbar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	NSString *htmlPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"index" ofType:@"html"];
	NSString *html = [NSString stringWithContentsOfFile:htmlPath usedEncoding:nil error:nil];
	[self.webView loadHTMLString:html baseURL:[NSURL fileURLWithPath:[htmlPath stringByDeletingLastPathComponent]]];
}


- (BOOL)shouldAutorotate
{
	return NO;
}


#pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	[self.webView stringByEvaluatingJavaScriptFromString:@"showData([200, 350], ['Blue', 'Crowbar'])"];
}

@end
