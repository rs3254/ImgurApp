//
//  DetailViewController.m
//  ImgurApp
//
//  Created by Ray Sabbineni on 5/29/16.
//  Copyright © 2016 Ray Sabbineni. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSURL * url = [NSURL URLWithString:self.model.image];
    NSData * data = [NSData dataWithContentsOfURL:url];
    self.imageView.image = [UIImage imageWithData:data];
    
    self.titleLabel.text = self.model.title;
    

    
    if(![self.model.imgurDescription isEqual:[NSNull null]])
    {
        self.descriptionTextView.text = self.model.imgurDescription;
    }
    else
    {
        self.scoreLabel.text = @"";
    }
    
    
    self.upvotesLabel.text = [NSString stringWithFormat:@"upvotes: %@", self.model.upvotes];
    self.downvotesLabel.text = [NSString stringWithFormat:@"downvotes: %@", self.model.downvotes];
    self.scoreLabel.text = [NSString stringWithFormat:@"score: %@", self.model.score];
    
    
}


@end
