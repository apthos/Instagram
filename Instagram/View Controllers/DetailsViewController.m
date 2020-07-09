//
//  DetailsViewController.m
//  Instagram
//
//  Created by David Lara on 7/8/20.
//  Copyright © 2020 David Lara. All rights reserved.
//

#import "DetailsViewController.h"
#import "Post.h"
#import "NSDate+DateTools.h"
@import Parse;

@interface DetailsViewController ()

@property (strong, nonatomic) Post *post;
@property (strong, nonatomic) IBOutlet PFImageView *photoView;
@property (strong, nonatomic) IBOutlet UIButton *likeButton;
@property (strong, nonatomic) IBOutlet UIButton *commentButton;
@property (strong, nonatomic) IBOutlet UILabel *likesLabel;
@property (strong, nonatomic) IBOutlet UILabel *authorLabel;
@property (strong, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setPost:self.post];
}

- (void)setPost:(Post *)post {
    _post = post;
    
    self.photoView.file = self.post.image;
    [self.photoView loadInBackground];
    self.authorLabel.text = self.post.author.username;
    self.captionLabel.text = self.post.caption;
    self.likesLabel.text = [NSString stringWithFormat:@"%@ Likes", self.post.likeCount];
    self.timeLabel.text = [self.post.createdAt timeAgoSinceNow];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
