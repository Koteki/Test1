//
//  FeedTableController.h
//  Test
//
//  Created by Temp Admin on 04/09/15.
//  Copyright (c) 2015 Temp Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "DetailViewController.h"
#import "PostTableViewCell.h"

@interface FeedTableController : UITableViewController <UITableViewDelegate, UITableViewDataSource, PostLikePressDelegate, PostLikeDelegate>
{
    NSMutableArray* posts;
    DetailViewController *detailViewController;
    NSInteger choosedPost;
}

@property (nonatomic, retain) NSMutableArray* posts;
@property (nonatomic, retain) DetailViewController *detailViewController;
@property (nonatomic, assign) NSInteger choosedPost;
@end
