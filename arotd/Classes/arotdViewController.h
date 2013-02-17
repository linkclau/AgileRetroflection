//
//  arotdViewController.h
//  arotd
//
//  Created by Yaal on 15/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface arotdViewController : UIViewController <UIWebViewDelegate> {

	
}

@property (nonatomic, strong) IBOutlet UIWebView *webView;
@property (nonatomic, strong) IBOutlet UIView *splashView;

@end

