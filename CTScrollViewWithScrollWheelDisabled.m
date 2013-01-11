//
//  CTScrollViewWithScrollWheelDisabled.m
//  CTScrollSplitterDemo
//
//  Created by Dmitry Nikolaev on 11.01.13.
//  Copyright (c) 2013 Cocotype. All rights reserved.
//

#import "CTScrollViewWithScrollWheelDisabled.h"

@implementation CTScrollViewWithScrollWheelDisabled

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
}

- (void) scrollWheel:(NSEvent *)theEvent {
    [[self nextResponder] scrollWheel:theEvent];
}

- (void) defaultScrollWheel: (NSEvent *) theEvent {
    [super scrollWheel:theEvent];
}

@end
