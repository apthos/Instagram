//
//  PostCell.h
//  Instagram
//
//  Created by David Lara on 7/8/20.
//  Copyright © 2020 David Lara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell

@property (strong, nonatomic) Post *post;
@property (weak, nonatomic) IBOutlet PFImageView *photoView;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UILabel *likesLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;

- (void)setPost:(Post *)post;
- (IBAction)onLikePress:(id)sender;
- (IBAction)onCommentPress:(id)sender;

@end

NS_ASSUME_NONNULL_END
