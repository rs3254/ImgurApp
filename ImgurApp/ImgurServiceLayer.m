//
//  ImgurServiceLayer.m
//  ImgurApp
//
//  Created by Ray Sabbineni on 5/28/16.
//  Copyright © 2016 Ray Sabbineni. All rights reserved.
//

#import "ImgurServiceLayer.h"

@implementation ImgurServiceLayer

-(void) doApiRequest:(ReloadViewController*)vc {
    
    
    self.arrayWithImgurAppModelObjects = [[NSMutableArray alloc]init];

    NSString *tokenString = @"Client-ID 7768db320d431c9";
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    [sessionConfiguration setHTTPAdditionalHeaders:@{ @"Authorization" : tokenString }];
                                                      self.session = [NSURLSession sessionWithConfiguration:sessionConfiguration];

    

    NSURLSessionTask * dataTask = [self.session dataTaskWithURL:[NSURL URLWithString:@"https://api.imgur.com/3/gallery/hot/viral/0.json"]completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        
        NSError * error2 = NULL;
        self.jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error: &error2];
        self.jsonArray = [self.jsonDictionary valueForKey:@"data"];
        for( NSInteger x = 0; x < self.jsonArray.count; x++ )
        {
            ImgurAppModel * model = [[ImgurAppModel alloc]init];
            model.image = [self.jsonArray[x] valueForKey:@"link"];
            model.title = [self.jsonArray[x] valueForKey:@"title"];
            model.imgurDescription = [self.jsonArray[x] valueForKey:@"description"];
            model.upvotes = [self.jsonArray[x] valueForKey:@"ups"];
            model.downvotes = [self.jsonArray[x] valueForKey:@"downs"];
            model.score = [self.jsonArray[x] valueForKey:@"score"];
            
            // some of the images are very large and take a long time to load.
            // To improve user experience we customize the content we display, by not displaying very large images
            
            if((int)[self.jsonArray[x] valueForKey:@"cover_width"] < 300 && (int)[self.jsonArray[x] valueForKey:@"cover_width"] < 300)
            {
            [self.arrayWithImgurAppModelObjects addObject:model];
            }

        }
//        NSLog(@" arrayWithImgurAppModelObjects -> %@", self.arrayWithImgurAppModelObjects);
//     NSLog(@"%@", self.jsonArray);

        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"dispatch");
            [vc reloadInterface];
        });

    }];
    
    
    [dataTask resume];
    

}





@end
