//
//  arotdViewController.m
//  arotd
//
//  Created by Yaal on 15/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "arotdViewController.h"

@implementation arotdViewController


-(id) init {
	return [super init];
}

@synthesize webView;
@synthesize splashView;

- (void)viewDidLoad {
    self.webView.backgroundColor = [UIColor viewFlipsideBackgroundColor];
    [self.webView loadRequest:[NSURLRequest requestWithURL:
                               [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index"
                                                                                      ofType:@"html"
                                                                                 inDirectory:@"web"]]
                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                           timeoutInterval:20.0]];

	[self.view addSubview:self.splashView];
}



- (BOOL)webView:(UIWebView *)theWebView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	NSURL *url = [request URL];
	if ([[url host] isEqualToString:@"twitter.com"]
		|| [[url host] isEqualToString:@"www.yaal.fr"]
		|| [[url scheme] isEqualToString:@"mailto"]) {
		[[UIApplication sharedApplication] openURL:url];
		return NO;
	} else if ([[url scheme] isEqualToString:@"loaded"]) {
		[self.view addSubview:self.webView];
		[self.splashView removeFromSuperview];
		return NO;
	}
	return YES;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self.webView loadRequest:[NSURLRequest requestWithURL:
                               [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index"
                                                                                      ofType:@"html"
                                                                                 inDirectory:@"web"]]
                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                           timeoutInterval:20.0]];
}


- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

@end
