//
//  GridViewController.h
//  ImgurApp
//
//  Created by Ray Sabbineni on 5/28/16.
//  Copyright © 2016 Ray Sabbineni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReloadViewController.h"
#import "ImgurServiceLayer.h"
#import "CollectionViewCell.h"
#import "ImgurAppModel.h"
#import "DetailViewController.h"

@interface GridViewController : ReloadViewController <UICollectionViewDelegate, UICollectionViewDataSource>


@property(nonatomic,strong) ImgurServiceLayer * serviceObject;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

-(void)reloadInterface;

@end
