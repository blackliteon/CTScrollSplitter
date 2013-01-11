//
//  CTAppDelegate.m
//  CTScrollSplitterDemo
//
//  Created by Dmitry Nikolaev on 11.01.13.
//  Copyright (c) 2013 Cocotype. All rights reserved.
//

#import "CTAppDelegate.h"

@implementation CTAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self.scrollView setHasVerticalScroller:YES];
    
    NSTextView *tv = [[NSTextView alloc] initWithFrame:self.scrollView.bounds];
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"text" ofType:@"txt"];
    [tv setString:[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil]];
    [tv setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    
    [self.scrollView setDocumentView:tv];
    
    // splitter
    
    self.splitter.horizontalScrollResponder = self;
    self.splitter.verticalScrollView = self.scrollView;
}

- (void) scrollWheel:(NSEvent *)theEvent {
    if (theEvent.deltaX > 0) {
        self.slider.integerValue += 1;
    }
    if (theEvent.deltaX < 0) {
        self.slider.integerValue -= 1;
    }
}

@end
