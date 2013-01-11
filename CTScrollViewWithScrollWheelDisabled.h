//
//  CTScrollViewWithScrollWheelDisabled.h
//  CTScrollSplitterDemo
//
//  Created by Dmitry Nikolaev on 11.01.13.
//  Copyright (c) 2013 Cocotype. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CTScrollViewWithScrollWheelDisabled : NSScrollView

- (void) defaultScrollWheel: (NSEvent *) theEvent;

@end
