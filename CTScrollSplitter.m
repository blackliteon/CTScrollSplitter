//
//  CTScrollSplitter.m
//  CTScrollSplitterDemo
//
//  Created by Dmitry Nikolaev on 11.01.13.
//  Copyright (c) 2013 Cocotype. All rights reserved.
//

#import "CTScrollSplitter.h"
#import "CTScrollViewWithScrollWheelDisabled.h"

typedef enum {
    MovementTypeVertical = 0,
    MovementTypeHorizontal = 1
} CTOneWayScrollerMovementType;


@interface CTScrollSplitter ()

@property (assign, nonatomic) BOOL freeToChooseDirection;
@property (assign, nonatomic) BOOL isVerticalMovement;
@property (assign, nonatomic) CTOneWayScrollerMovementType movementType;

@end

@implementation CTScrollSplitter

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
    
    BOOL physicalScrollWheelEvent = (theEvent.subtype == NSMouseEventSubtype);
    
    // physical scroller can't have vertical & horizontal scroll movement in one gesture, so disable one-way scrolling for this types
    
    BOOL disableAction = NO; // if YES, neither super action procees no delegate will receive message
    BOOL shouldForwardScroll = NO; // should forward to delegate and ignore super implementation
    
    if (!physicalScrollWheelEvent) {
        
        // only when gesture started we free to chose initial direction
        
        if (self.freeToChooseDirection) {
            
            if (fabs(theEvent.deltaX) > fabs(theEvent.deltaY))
            {
                //                NSLog(@"detect horizontal movement");
                shouldForwardScroll = YES;
                self.isVerticalMovement = NO;
                self.movementType = MovementTypeHorizontal;
                self.freeToChooseDirection = NO;
            }
            
            if (fabs(theEvent.deltaX) < fabs(theEvent.deltaY))
            {
                //                NSLog(@"detect vertical movement");
                self.isVerticalMovement = YES;
                self.movementType = MovementTypeVertical;
                self.freeToChooseDirection = NO;
            }
        }
        
        // check current direction
        
        if (self.movementType == MovementTypeHorizontal && fabs(theEvent.deltaX)) {
            shouldForwardScroll = YES;
        }
        
        // disable action
        
        if (self.movementType == MovementTypeVertical && shouldForwardScroll) {
            disableAction = YES;
        }
        
        if (self.movementType == MovementTypeHorizontal && !shouldForwardScroll) {
            disableAction = YES;
        }
        
    } else { // physical mouse scroll
        
        if (fabs(theEvent.deltaX) > fabs(theEvent.deltaY))
        {
            shouldForwardScroll = YES;
        }
    }
    
    
    if (!disableAction) {
        if (shouldForwardScroll)
        {
            [self.horizontalScrollResponder scrollWheel:theEvent];
        }
        else
        {
            [self.verticalScrollView defaultScrollWheel:theEvent];
        }
    }
}

- (void)beginGestureWithEvent:(NSEvent *)event {
    self.freeToChooseDirection = YES;
}

@end
