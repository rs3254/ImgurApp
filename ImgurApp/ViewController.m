//
//  ViewController.m
//  ImgurApp
//
//  Created by Ray Sabbineni on 5/28/16.
//  Copyright © 2016 Ray Sabbineni. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"%li", self.serviceObject.arrayWithImgurAppModelObjects.count);
    return self.serviceObject.arrayWithImgurAppModelObjects.count;
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NSString * identifier = @"tableCell";
    ListViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    ImgurAppModel * model = [self.serviceObject.arrayWithImgurAppModelObjects objectAtIndex:indexPath.row];
    
    NSLog(@"%@", model.image); 
    NSURL * url = [NSURL URLWithString:model.image];
    NSData * data = [NSData dataWithContentsOfURL:url];
    cell.imageViewInCell.image = [UIImage imageWithData:data];
    return cell;
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([[segue identifier] isEqualToString:@"ViewControllerSegue"])
        
    {
    
        DetailViewController * vc = [ segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        vc.model = self.serviceObject.arrayWithImgurAppModelObjects[indexPath.row];
        
    }
    
}




-(void)reloadInterface {
    
    [self.tableView reloadData];
}

@end
