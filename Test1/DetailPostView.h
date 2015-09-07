//
//  DetailPostView.h
//  Test1
//
//  Created by Temp Admin on 05/09/15.
//  Copyright (c) 2015 Temp Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@protocol PostLikeDelegate <NSObject> //delegate for like button

-(void) buttonLikePressed;

@end;

@interface DetailPostView : UIView
{
    UIImageView* postImg;
    UITextView* postText;
    UIButton* likeButton;
    UIImage* likeImg;
    BOOL like;
    id<PostLikeDelegate> likePostDelegate;
}

@property (nonatomic, retain) UIImageView* postImg;
@property (nonatomic, retain) UITextView* postText;
@property (nonatomic, retain) UIButton* likeButton;
@property (nonatomic, retain) UIImage* likeImg;
@property (nonatomic, assign) BOOL like;
@property (nonatomic, assign) id<PostLikeDelegate> likePostDelegate;
-(id) initWithPost:(Post*) post;
-(void)buttonLikePressed;
-(void) setLikeButtonImageForPost:(Post*) post;

@end

