//
//  Post.m
//  Test1
//
//  Created by Temp Admin on 05/09/15.
//  Copyright (c) 2015 Temp Admin. All rights reserved.
//

#import "Post.h"

@implementation Post
@synthesize img, liked, likeImg, text;
/*
-(id) initWithDictionary:(NSDictionary *)data
{
    //may be need if we would lke to read ready data from some source
    Post* post = [[Post alloc] init];
    post.text = [data objectForKey:@"text"];
    UIImage* tmpIMg = [[UIImage alloc] initWithContentsOfFile:[data objectForKey:@"img"]];
    post.img = tmpIMg;
    post.liked = (bool)[data objectForKey:@"liked"];
    return self;
}
*/
-(id) initPostNumber:(NSInteger)number
{
    //generate post with some short text and picture named %number%.jpg
    self = [[Post alloc] init];
    self.text = [NSString stringWithFormat:@"Very-very interesting post #%i", number];
    UIImage *tmpImg = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%i", number] ofType:@"jpg"]];
    self.img = tmpImg;
    self.liked = 0;
    return self;
}

-(void) setLiked:(BOOL)likedV
{
    //custom setter to chenge like image when changed like property
    liked = likedV;
    UIImage *tmpImg = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"like%i", likedV] ofType:@"png"]];
                       
    self.likeImg = tmpImg;
}

-(void) likeAction
{
    self.liked = !liked;
}

@end
