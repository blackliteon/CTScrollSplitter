//
//  CTAppDelegate.h
//  CTScrollSplitterDemo
//
//  Created by Dmitry Nikolaev on 11.01.13.
//  Copyright (c) 2013 Cocotype. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CTScrollSplitter.h"
#import "CTScrollViewWithScrollWheelDisabled.h"

@interface CTAppDelegate : NSResponder <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (unsafe_unretained) IBOutlet CTScrollSplitter *splitter;
@property (unsafe_unretained) IBOutlet CTScrollViewWithScrollWheelDisabled *scrollView;
@property (unsafe_unretained) IBOutlet NSSlider *slider;

@end
