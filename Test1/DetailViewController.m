//
//  DetailViewController.m
//  Test1
//
//  Created by Temp Admin on 05/09/15.
//  Copyright (c) 2015 Temp Admin. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController
@synthesize post, postView;

-(id) initWithPost:(Post *)aPost
{
    self = [super init];
    post = aPost;
    DetailPostView* aView = [[DetailPostView alloc] initWithPost:self.post];
    self.postView = aView;
    
    return self;
}

-(void) loadView
{
    [super loadView];
    
    [self.view addSubview:postView];
    
    
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

-(void) setPost:(Post *)post_
{
    //we need to change only image on likeButton, but who knows =)
    post = post_;
    [postView setLikeButtonImageForPost:post];
    
}

-(void) setDelegateForPostView:(id<PostLikeDelegate>) delegate
{
    [postView setLikePostDelegate:delegate];
}
@end
