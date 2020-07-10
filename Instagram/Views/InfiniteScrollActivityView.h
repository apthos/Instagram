//
//  InfiniteScrollActivityView.h
//  Instagram
//
//  Created by David Lara on 7/10/20.
//  Copyright © 2020 David Lara. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InfiniteScrollActivityView : UIView

@property (class, nonatomic, readonly) CGFloat defaultHeight;

- (void)startAnimating;
- (void)endAnimating;

@end

NS_ASSUME_NONNULL_END
