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
    [self checkIfLiked];
    
}

- (void)checkIfLiked {
    PFRelation *likes = self.post.likes;
    PFQuery *query = [likes query];
    [query whereKey:@"objectId" equalTo:PFUser.currentUser.objectId];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (object) {
            self.liked = YES;
            [self.likeButton setSelected:YES];
        }
        else {
            self.liked = NO;
            [self.likeButton setSelected:NO];
        }
        
    }];
}

- (IBAction)onCommentPress:(id)sender {
    
}

- (IBAction)onLikePress:(id)sender {
    [PFUser.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (self.liked) {
            self.liked = NO;
            [self.post.likes removeObject:PFUser.currentUser];
            self.post.likeCount = [NSNumber numberWithLong:(self.post.likeCount.longValue - 1)];
        }
        else {
            self.liked = YES;
            [self.post.likes addObject:PFUser.currentUser];
            self.post.likeCount = [NSNumber numberWithLong:(self.post.likeCount.longValue + 1)];
        }
        
        [self.post saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                [self setPost:self.post];
            }
            else {
                NSLog(@"Error: %@", error.localizedDescription);
            }
        }];
    }];
}

@end
