//
//  DetailViewController.h
//  ImgurApp
//
//  Created by Ray Sabbineni on 5/29/16.
//  Copyright © 2016 Ray Sabbineni. All rights reserved.
//

#import "ViewController.h"
#import "ImgurAppModel.h"

@interface DetailViewController : UIViewController



@property(nonatomic, strong) ImgurAppModel * model; 


@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UITextView *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *upvotesLabel;
@property (weak, nonatomic) IBOutlet UILabel *downvotesLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;






@end
