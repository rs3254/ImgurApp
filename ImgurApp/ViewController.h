//
//  ViewController.h
//  ImgurApp
//
//  Created by Ray Sabbineni on 5/28/16.
//  Copyright © 2016 Ray Sabbineni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReloadViewController.h"
#import "ImgurServiceLayer.h"
#import "ListViewCell.h"
#import "ImgurAppModel.h"
#import "DetailViewController.h"


@interface ViewController : ReloadViewController <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,strong) ImgurServiceLayer * serviceObject;

@property(nonatomic, strong) NSString * title;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


-(void)reloadInterface;

@end

