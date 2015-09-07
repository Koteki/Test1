//
//  FeedTableCOntroller.m
//  Test
//
//  Created by Temp Admin on 04/09/15.
//  Copyright (c) 2015 Temp Admin. All rights reserved.
//
#define NUMBEROFPOSTS 10

#import "FeedTableController.h"
#import "DetailViewController.h"

@implementation FeedTableController

@synthesize posts, detailViewController, choosedPost;

-(id) initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    //generate array of posts
    NSMutableArray* array = [[NSMutableArray alloc] init];
    NSInteger i;
    for (i=0; i<NUMBEROFPOSTS; i++) {
        
        Post *post= [[Post alloc] initPostNumber:i];
        [array addObject:post];
        
    }
    
    self.posts = array;
    
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HEIGHTOFPOST;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return posts.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSInteger n = indexPath.row;

       cell =[[PostTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"Cell"
                                                 post:[self.posts objectAtIndex:indexPath.row]
                                               height:HEIGHTOFPOST];
 
  
    cell.likePressDelegate = self;
    return cell;
}

-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    choosedPost = indexPath.row;
    DetailViewController *detailController = [[DetailViewController alloc] initWithPost:[self.posts objectAtIndex:indexPath.row]];
    [detailController setDelegateForPostView:self];
    self.detailViewController = detailController;
   
    [self.navigationController pushViewController:self.detailViewController animated:YES];

    
}

#pragma likePressDelegate

-(void) buttonLikePressed:(PostTableViewCell *)cell
{
    //was pressed like button on cell with post
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    Post* post = [posts objectAtIndex:indexPath.row];
    [post likeAction];
    [posts replaceObjectAtIndex:indexPath.row withObject:post]; //replace by item with new setting
    [cell setLikeButtonImageForPost:post];
}

-(void) buttonLikePressed
{
  //was pressed like button in detail view of post
    Post* post = [posts objectAtIndex:choosedPost];
    [post likeAction];
    [posts replaceObjectAtIndex:choosedPost withObject:post];
    [self.detailViewController setPost:post];
}
@end
