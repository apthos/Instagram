//
//  InfiniteScrollActivityView.m
//  Instagram
//
//  Created by David Lara on 7/10/20.
//  Copyright © 2020 David Lara. All rights reserved.
//

#import "InfiniteScrollActivityView.h"

@implementation InfiniteScrollActivityView

UIActivityIndicatorView* activityIndicatorView;
static CGFloat _defaultHeight = 60.0;

+ (CGFloat)defaultHeight {
    return _defaultHeight;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupActivityIndicator];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupActivityIndicator];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    activityIndicatorView.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
}

- (void)setupActivityIndicator {
    activityIndicatorView = [[UIActivityIndicatorView alloc] init];
    activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleMedium;
    activityIndicatorView.hidesWhenStopped = YES;
    [self addSubview:activityIndicatorView];
}

- (void)endAnimating {
    [activityIndicatorView stopAnimating];
    self.hidden = true;
}

- (void)startAnimating {
    self.hidden = false;
    [activityIndicatorView startAnimating];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
