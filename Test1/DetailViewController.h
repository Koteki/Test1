//
//  DetailViewController.h
//  Test1
//
//  Created by Temp Admin on 05/09/15.
//  Copyright (c) 2015 Temp Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "DetailPostView.h"

@interface DetailViewController : UIViewController
{
    Post* post;
    DetailPostView *postView;
    
}

@property (nonatomic,retain) Post* post;
@property (nonatomic, retain) DetailPostView *postView;

-(id) initWithPost:(Post*) aPost;
-(void) setDelegateForPostView:(id<PostLikeDelegate>)delegate;

@end
