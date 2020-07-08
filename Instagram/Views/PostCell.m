//
//  PostCell.m
//  Instagram
//
//  Created by David Lara on 7/8/20.
//  Copyright © 2020 David Lara. All rights reserved.
//

#import "PostCell.h"
#import "Post.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPost:(Post *)post {
    _post = post;
    
    self.photoView.file = post.image;
    [self.photoView loadInBackground];
    self.authorLabel.text = post.author.username;
    self.captionLabel.text = post.caption;
    self.likesLabel.text = [NSString stringWithFormat:@"%@ Likes", post.likeCount];
    
}

- (IBAction)onCommentPress:(id)sender {
    
}

- (IBAction)onLikePress:(id)sender {
    
}

@end
