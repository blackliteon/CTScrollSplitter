## CTScrollSplitter for Mac: Split vertical & horizontal scroll between different views

Sometimes we want to have one view with horizontal scrolling contains some subview with vertical scrolling, for instance, NSTextView. Default NSScrollView implementation don't allow that, and once your mouse over the NSScrollView all subsequent scroll events will go to that scroller.

CSScrollSplitter is NSView subclass that intercept all scroll events and distribute them between horizontal & vertical scroller.

Compatible with Mac OS X 10.6 and later.