//
//  DetailPostView.m
//  Test1
//
//  Created by Temp Admin on 05/09/15.
//  Copyright (c) 2015 Temp Admin. All rights reserved.
//

#import "DetailPostView.h"

@implementation DetailPostView
@synthesize postImg, postText, likeButton, likeImg, like;

-(id) initWithPost:(Post*) post
{
    
    self = [super initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    CGFloat imageHeight = self.frame.size.height;
    imageHeight = imageHeight/3;
    UIColor *backColor = [UIColor colorWithRed:196/255.0 green:206/255.0 blue:262/255.0 alpha:1]; // i just like light blue colors =)
    [self setBackgroundColor:backColor];
    
    
    //set image with scaling to 1/3 of height
     self.postImg = [[UIImageView alloc] initWithImage:post.img];
    CGFloat koeff;
    if (imageHeight/post.img.size.height <= self.frame.size.width/post.img.size.width)
    {
        koeff = imageHeight/post.img.size.height;
        
    }
    else koeff = self.frame.size.width/post.img.size.width;
    
    CGRect screenRect = CGRectMake(0, 42, post.img.size.width*koeff, post.img.size.height*koeff);
    [postImg setFrame:screenRect];
    [postImg setCenter:CGPointMake(self.center.x, postImg.center.y)];
    imageHeight = postImg.frame.origin.y + postImg.frame.size.height;
    
    //set text of post
    self.postText = [[UITextView alloc] initWithFrame:CGRectMake(0, imageHeight, self.frame.size.width, self.frame.size.height-imageHeight)];
    [self.postText setText:post.text];
    [postText setBackgroundColor:backColor];
    [postImg setBackgroundColor:[UIColor blueColor]];
    
    //set likle button
    CGRect rect = CGRectMake(0, 0, 20, 20);
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
    
    [button setBackgroundColor:[UIColor clearColor]];
    [button addTarget:self
               action:@selector(buttonLikePressed)
     forControlEvents:UIControlEventTouchUpInside];
    
    self.likeButton = button;
    [self setLikeButtonImageForPost:post];
    [likeButton setFrame:CGRectMake(0, 0, likeImg.size.width, likeImg.size.height)];    CGPoint buttonCenter = CGPointMake(self.center.x, self.bounds.size.height - likeImg.size.height/2);
    [likeButton setCenter:buttonCenter];
    
    [self addSubview:self.postImg];
    [self addSubview:self.postText];
    [self addSubview:self.likeButton];
    return self;
    
    
    
    
}


-(void) setLikeButtonImageForPost:(Post*) post
{
    
    NSString *path =[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"like%i", (int)post.liked] ofType:@".png"];//path to like pic
    
    UIImage *img = [UIImage imageWithContentsOfFile:path];
    self.likeImg = img;
    [likeButton setImage:self.likeImg forState:UIControlStateNormal];
    
}

-(void) buttonLikePressed
{
    [_likePostDelegate buttonLikePressed];
    
}
-(void) setLikePostDelegate:(id<PostLikeDelegate>)likePostDelegate_
{
    _likePostDelegate = likePostDelegate_;
}
@end
