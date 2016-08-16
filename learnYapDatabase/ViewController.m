//
//  ViewController.m
//  learnYapDatabase
//
//  Created by 谢鹏翔 on 16/8/15.
//  Copyright © 2016年 ime. All rights reserved.
//

#import "ViewController.h"
#import "MXKVStorage.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)save:(id)sender {
    
    [[MXKVStorage sharedStorage] saveItem:@"xie" forKey:@"user" inCollecion:@"login"];
}

- (IBAction)read:(id)sender {
    id item = [[MXKVStorage sharedStorage] itemForKey:@"user" inCollecion:@"login"];
    
    if (item) {
        
        _label.text = item;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
