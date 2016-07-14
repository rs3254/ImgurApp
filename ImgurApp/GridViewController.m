//
//  GridViewController.m
//  ImgurApp
//
//  Created by Ray Sabbineni on 5/28/16.
//  Copyright © 2016 Ray Sabbineni. All rights reserved.
//

#import "GridViewController.h"

@interface GridViewController ()

@end

@implementation GridViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.serviceObject = [[ImgurServiceLayer alloc]init];
    [self.serviceObject doApiRequest:self];
    
}



-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated: animated];
    [super viewWillAppear:animated];
}



-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    NSLog(@"%li", self.serviceObject.arrayWithImgurAppModelObjects.count);
    return self.serviceObject.arrayWithImgurAppModelObjects.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"collectionCell";
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    ImgurAppModel * model = [self.serviceObject.arrayWithImgurAppModelObjects objectAtIndex:indexPath.row];

    
    NSURL * url = [NSURL URLWithString:model.image];
    NSData * data = [NSData dataWithContentsOfURL:url];
    cell.imageView.image = [UIImage imageWithData:data];
    
    return cell;
}




-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([[segue identifier] isEqualToString:@"GridViewControllerSegue"])
        
    {
        
        DetailViewController * vc = [ segue destinationViewController];
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems]objectAtIndex:0];
        vc.model = self.serviceObject.arrayWithImgurAppModelObjects[indexPath.row];
        
    }
    
}




-(void)reloadInterface {
    
    dispatch_async(dispatch_get_main_queue(), ^ {
        [self.collectionView reloadData];
    });
    NSLog(@"something");
}


@end
