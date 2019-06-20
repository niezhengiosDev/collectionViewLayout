//
//  ViewController.m
//  NZAnimationProj
//
//  Created by 聂政 on 2019/6/20.
//  Copyright © 2019 聂政. All rights reserved.
//

#import "ViewController.h"

#import "ProgressLabel.h"

#import "NZAnimationCollectionVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatrUI];
}

-(void)creatrUI{
    ///进度
    ProgressLabel *progressLabel = [[ProgressLabel alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    [self.view addSubview:progressLabel];
    
    
    UIButton *doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:doneBtn];
    doneBtn.frame = CGRectMake(100, CGRectGetMaxY(progressLabel.frame)+50, 100, 30);
    doneBtn.backgroundColor = [UIColor grayColor];
    [doneBtn setTitle:@"next" forState:UIControlStateNormal];
    [doneBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [doneBtn addTarget:self action:@selector(nextActino:) forControlEvents:UIControlEventTouchUpInside];
}


-(void)nextActino:(UIButton *)btn{
    NZAnimationCollectionVC *vc = [[NZAnimationCollectionVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
