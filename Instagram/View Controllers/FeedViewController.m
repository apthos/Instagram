//
//  FeedViewController.m
//  Instagram
//
//  Created by David Lara on 7/6/20.
//  Copyright © 2020 David Lara. All rights reserved.
//

#import "FeedViewController.h"
#import "LoginViewController.h"
#import "SceneDelegate.h"
#import <Parse/Parse.h>
#import "PostCell.h"
#import "Post.h"
#import "DetailsViewController.h"
#import "InfiniteScrollActivityView.h"

@import MBProgressHUD;

@interface FeedViewController () <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (strong, nonatomic) NSMutableArray *posts;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) NSNumber *pagesLoaded;
@property (assign, nonatomic) BOOL isMoreDataLoading;
@property (strong, nonatomic) InfiniteScrollActivityView *loadingMoreView;
@property (weak, nonatomic) IBOutlet UITableView *feedTableView;

- (IBAction)onLogoutPress:(id)sender;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.feedTableView.delegate = self;
    self.feedTableView.dataSource = self;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(beginRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.feedTableView insertSubview:self.refreshControl atIndex:0];
    
    self.pagesLoaded = @(1);
    
    //Setup for infinite scrolling indicator
    CGRect frame = CGRectMake(0, self.feedTableView.contentSize.height, self.feedTableView.bounds.size.width, InfiniteScrollActivityView.defaultHeight);
    self.loadingMoreView = [[InfiniteScrollActivityView alloc] initWithFrame:frame];
    self.loadingMoreView.hidden = true;
    [self.feedTableView addSubview:self.loadingMoreView];
    
    UIEdgeInsets insets = self.feedTableView.contentInset;
    insets.bottom += InfiniteScrollActivityView.defaultHeight;
    self.feedTableView.contentInset = insets;
}

- (void)viewWillAppear:(BOOL)animated {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self fetchPosts];
}

- (void)beginRefresh:(UIRefreshControl *)refreshControl {
    [self fetchPosts];
}

- (void)fetchPosts {
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query orderByDescending:@"createdAt"];
    [query includeKey:@"author"];
    [query includeKey:@"createdAt"];
    long limit = 5 * self.pagesLoaded.longValue;
    query.limit = limit;
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.posts = (NSMutableArray *) posts;
            
            self.isMoreDataLoading = NO;
            
            [self.feedTableView reloadData];
            [self.refreshControl endRefreshing];
            
            if (!self.loadingMoreView.isHidden) {
                [self.loadingMoreView endAnimating];
            }
            else {
                [MBProgressHUD hideHUDForView:self.view animated:YES];
            }
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

- (IBAction)onLogoutPress:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
        else {
            SceneDelegate *sceneDelegate = (SceneDelegate *) self.view.window.windowScene.delegate;
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            sceneDelegate.window.rootViewController = loginViewController;
            
        }
    }];
    
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostCell *cell = [self.feedTableView dequeueReusableCellWithIdentifier:@"PostCell"];
    
    Post *post = self.posts[indexPath.row];
    [cell setPost:post];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(!self.isMoreDataLoading) {
        int scrollViewContentHeight = self.feedTableView.contentSize.height;
        int scrollOffsetThreshold = scrollViewContentHeight - self.feedTableView.bounds.size.height;
        
        if (scrollView.contentOffset.y > scrollOffsetThreshold && self.feedTableView.isDragging) {
            self.isMoreDataLoading = YES;
            self.pagesLoaded = [NSNumber numberWithLong:(self.pagesLoaded.longValue + 1)];
            
            CGRect frame = CGRectMake(0, self.feedTableView.contentSize.height, self.feedTableView.contentSize.width, InfiniteScrollActivityView.defaultHeight);
            self.loadingMoreView.frame = frame;
            [self.loadingMoreView startAnimating];
            
            [self fetchPosts];
        }
        
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([sender isKindOfClass:[PostCell class]]) {
        PostCell *tappedCell = sender;
        NSIndexPath *indexPath = [self.feedTableView indexPathForCell:tappedCell];
        Post *post = self.posts[indexPath.row];
        
        DetailsViewController *detailsViewController = [segue destinationViewController];
        detailsViewController.post = post;
    }
    
}


@end
