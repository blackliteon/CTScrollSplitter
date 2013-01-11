//
//  CTScrollSplitter.h
//  CTScrollSplitterDemo
//
//  Created by Dmitry Nikolaev on 11.01.13.
//  Copyright (c) 2013 Cocotype. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class CTScrollViewWithScrollWheelDisabled;

@interface CTScrollSplitter : NSView

@property (unsafe_unretained, nonatomic) NSResponder *horizontalScrollResponder;
@property (unsafe_unretained, nonatomic) CTScrollViewWithScrollWheelDisabled *verticalScrollView;

@end
