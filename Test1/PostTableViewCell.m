//
//  PostTableViewCell.m
//  Test1
//
//  Created by Temp Admin on 05/09/15.
//  Copyright (c) 2015 Temp Admin. All rights reserved.
//

#import "PostTableViewCell.h"

@implementation PostTableViewCell
@synthesize  postPicture, likeButton, likePic;

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier post:(Post *)post height:(CGFloat)cellHeight
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    //set main image
    self.postPicture = [[UIImageView alloc] initWithImage:post.img];
    
    //generate like button
    CGRect rect = CGRectMake(5, cellHeight-20, 20, 20);
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
    
    [button setBackgroundColor:[UIColor clearColor]];
    [button addTarget:self
               action:@selector(buttonLikePressed)
     forControlEvents:UIControlEventTouchUpInside];
   
    
    self.likeButton = button;
    [self setLikeButtonImageForPost:post];
    
    
    CGFloat koeff;
    if (HEIGHTOFPOST/postPicture.frame.size.height <= self.contentView.bounds.size.width/postPicture.frame.size.width)
    {
        koeff = HEIGHTOFPOST/postPicture.frame.size.height;
    
    }
    else koeff = self.contentView.bounds.size.width/postPicture.frame.size.width;
    
    [postPicture setFrame:CGRectMake(postPicture.frame.origin.x, postPicture.frame.origin.y, postPicture.frame.size.width*koeff, postPicture.frame.size.height*koeff)];
    [postPicture setCenter:CGPointMake(self.contentView.bounds.size.width/2, self.contentView.bounds.size.height/2+28)];
    
    
    [self addSubview:postPicture];
    [self addSubview:likeButton];
 
    return self;
    
}


-(void) buttonLikePressed
{
    [_likePressDelegate buttonLikePressed:self];
    
}

-(void) setLikeButtonImageForPost:(Post*) post
{
    //path to like pic
    NSString *path =[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"like%i", (int)post.liked] ofType:@".png"];
    UIImage *img = [UIImage imageWithContentsOfFile:path];
    self.likePic = img;
    [likeButton setImage:[self scaleImage:self.likePic toSize:likeButton.frame.size]
            forState:UIControlStateNormal];
}

-(UIImage*)scaleImage:(UIImage*)img toSize:(CGSize)sizeWeNeed
{
    //using for like image
    CGRect screenRect = CGRectMake(0, 0, sizeWeNeed.width, sizeWeNeed.height);
    UIImage *tmpImg;
    UIGraphicsBeginImageContext(screenRect.size);
    [img drawInRect:screenRect];
    tmpImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tmpImg;
    
}
@end
