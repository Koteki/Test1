//
//  Post.h
//  Test1
//
//  Created by Temp Admin on 05/09/15.
//  Copyright (c) 2015 Temp Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Post : NSObject
{
    NSString* text;
    UIImage* img;
    BOOL liked;
    UIImage* likeImg;
    
}

@property (nonatomic, retain) NSString* text;
@property (nonatomic, retain) UIImage* img;
@property (nonatomic, retain) UIImage* likeImg;
@property (nonatomic, assign) BOOL liked;

//-(id) initWithDictionary:(NSDictionary*) data;//may be need if we would lke to read ready data from some source
-(id) initPostNumber:(NSInteger) number;
-(void) likeAction;
@end
