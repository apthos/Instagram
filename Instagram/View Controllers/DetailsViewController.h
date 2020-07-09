//
//  DetailsViewController.h
//  Instagram
//
//  Created by David Lara on 7/8/20.
//  Copyright © 2020 David Lara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController

- (void)setPost:(Post *)post;

@end

NS_ASSUME_NONNULL_END
