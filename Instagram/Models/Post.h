//
//  Post.h
//  Instagram
//
//  Created by David Lara on 7/7/20.
//  Copyright © 2020 David Lara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@interface Post : PFObject<PFSubclassing>

@property (strong, nonatomic) NSString *postID;
@property (strong, nonatomic) NSString *userID;
@property (strong, nonatomic) PFUser *author;
@property (strong, nonatomic) NSString *caption;
@property (strong, nonatomic) PFFileObject *image;
@property (strong, nonatomic) NSNumber *likeCount;
@property (strong, nonatomic) NSNumber *commentCount;
@property (strong, nonatomic) PFRelation *likes;

+ (void)postUserImage:(UIImage * _Nullable)image withCaption:(NSString * _Nullable)caption withCompletion:(PFBooleanResultBlock _Nullable)completion;

@end

NS_ASSUME_NONNULL_END
