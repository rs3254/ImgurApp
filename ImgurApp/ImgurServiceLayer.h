//
//  ImgurServiceLayer.h
//  ImgurApp
//
//  Created by Ray Sabbineni on 5/28/16.
//  Copyright © 2016 Ray Sabbineni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReloadViewController.h"
#import <UIKit/UIKit.h>
#import "ImgurAppModel.h"



@interface ImgurServiceLayer : NSObject


@property(nonatomic, strong)NSURLSession * session;
@property(nonatomic, strong)NSDictionary * jsonDictionary;
@property(nonatomic, strong)NSArray * jsonArray;

@property(nonatomic, strong)NSMutableArray * arrayWithImgurAppModelObjects;



-(void) doApiRequest:(UIViewController*)vc;


@end
