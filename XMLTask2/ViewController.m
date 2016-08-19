//
//  ViewController.m
//  XMLTask2
//
//  Created by Subhabrata Banerjee on 16/08/16.
//  Copyright © 2016 Subhabrata Banerjee. All rights reserved.
//

#import "ViewController.h"
#import "Details.h"
#import "xmlDataPurser.h"
#import "xmlTableDataSource.h"
#import "webViewContainer.h"

@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>


@property NSMutableArray *dataArray;



@end

@implementation ViewController

xmlTableDataSource *xmlTableDataSourcE;

@synthesize dates;
@synthesize titles;


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.dataArray = [[NSMutableArray alloc]init];
    
    xmlDataPurser *dataPursoR = [[xmlDataPurser alloc]initWithArray : self.dataArray];
    [dataPursoR parseXMLFile];
    [[self xmlData] reloadData];
    
//    titles = [NSArray arrayWithObjects : @"ABC1", @"ABC2", @"ABC3", @"ABC4", @"ABC5", @"ABC6", @"ABC7", @"ABC8", @"ABC9", @"ABC10", @"ABC11", @"ABC12", nil];
//    
//    dates = [NSArray arrayWithObjects : @"Jan-1-2016", @"Feb-2-2016", @"Mar-3-2016", @"Apr-4-2016", @"May-5-2016", @"June-6-2016", @"Jul-7-2016", @"Aug-8-2016", @"Sep-9-2016", @"Oct-10-2016", @"Nov-11-2016", @"Dec-12-2016", nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.dataArray count];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    Details *details = [tableView dequeueReusableCellWithIdentifier : @"cell" forIndexPath : indexPath];
  
    xmlTableDataSourcE = self.dataArray[indexPath.row];
    
    details.title.text = xmlTableDataSourcE.titleString;
    details.date.text = xmlTableDataSourcE.dateString;
    
    details.defaultImage.image = [UIImage imageNamed : @"Mery"];
    
    //imageProperty
    details.defaultImage.layer.borderWidth = 1.0f;
    details.defaultImage.layer.borderColor = [UIColor blackColor].CGColor;
    details.defaultImage.layer.masksToBounds = YES;
    details.defaultImage.clipsToBounds = YES;
    details.defaultImage.layer.cornerRadius =  details.defaultImage.frame.size.width / 2;
    
    return details;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    webViewContainer *webViewContaineR = [self.storyboard instantiateViewControllerWithIdentifier : @"webView"];
    
    UINavigationController *navigationController =
    [[UINavigationController alloc] initWithRootViewController:webViewContaineR];
    
    webViewContaineR.getLinkString = xmlTableDataSourcE.description;
    
    NSLog(@"webViewContaineR.getLinkString----->%@", webViewContaineR.getLinkString);
    NSLog(@"xmlTableDataSourcE.description-----> %@", xmlTableDataSourcE.description);
    
    //now present this navigation controller modally
    [self presentViewController:navigationController animated:YES completion:nil];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
