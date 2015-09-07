//
//  PostTableViewCell.h
//  Test1
//
//  Created by Temp Admin on 05/09/15.
//  Copyright (c) 2015 Temp Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

#define HEIGHTOFPOST 100

@class PostTableViewCell;

@protocol PostLikePressDelegate <NSObject> //delegate for like button action

-(void) buttonLikePressed:(PostTableViewCell*) cell;

@end;

@interface PostTableViewCell : UITableViewCell
{
    UIImageView *postPicture;
    UIButton* likeButton;
    UIImage *likePic;
    id<PostLikePressDelegate> likePressDelegate;
    
    
}
@property (nonatomic, retain) UIImageView *postPicture;
@property (nonatomic, retain) UIButton *likeButton;
@property (nonatomic, assign) id<PostLikePressDelegate> likePressDelegate;
@property (nonatomic, retain) UIImage *likePic;

-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier post:(Post *) post height:(CGFloat) cellHeight;
- (void) buttonLikePressed;
-(UIImage*)scaleImage:(UIImage*)img toSize:(CGSize) sizeWeNeed;
-(void) setLikeButtonImageForPost:(Post*) post;
-(void) setPicturesForPost:(Post*)post;
@end
