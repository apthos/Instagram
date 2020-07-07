//
//  Post.m
//  Instagram
//
//  Created by David Lara on 7/7/20.
//  Copyright © 2020 David Lara. All rights reserved.
//

#import "Post.h"
#import <Parse/Parse.h>

@implementation Post

//curiousity
@dynamic postID;
@dynamic userID;
@dynamic author;
@dynamic caption;
@dynamic image;
@dynamic likeCount;
@dynamic commentCount;

+ (nonnull NSString *)parseClassName {
    return @"Post";
}

+ (void)postUserImage:(UIImage * _Nullable) image withCaption:(NSString * _Nullable) caption withCompletion:(PFBooleanResultBlock  _Nullable) completion {
    Post *post = [Post new];
    post.image =  [self getPFFileFromImage:image];
    post.author = [PFUser currentUser];
    post.caption = caption;
    post.likeCount = @(0);
    post.commentCount = @(0);
    
    [post saveInBackgroundWithBlock: completion];
}

+ (PFFileObject *)getPFFileFromImage:(UIImage * _Nullable)image {
    if (!image) return nil;
    
    NSData *imageData = UIImagePNGRepresentation(image);
    if (!imageData) return nil;
    
    return [PFFileObject fileObjectWithName:@"image.png" data:imageData];
}

@end
