//
//  NZAnimationCollectionVC.m
//  NZAnimationProj
//
//  Created by 聂政 on 2019/6/20.
//  Copyright © 2019 聂政. All rights reserved.
//

#import "NZAnimationCollectionVC.h"
#import "NZAnimationCollectionCell.h"

#define  ScreenHeight [UIScreen mainScreen].bounds.size.height
#define  ScreenWidth  [UIScreen mainScreen].bounds.size.width

@interface NZAnimationCollectionVC ()<
UICollectionViewDelegate,
UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UICollectionViewFlowLayout *styleList;
@property (nonatomic, strong) UICollectionViewFlowLayout *styleBlock;
///0列表 1方块
@property (nonatomic, assign) NSInteger collectionStyle;

@end

@implementation NZAnimationCollectionVC

-(UICollectionViewFlowLayout *)styleList{
    if (_styleList == nil) {
        _styleList = [[UICollectionViewFlowLayout alloc] init];
        
        _styleList.itemSize = CGSizeMake(ScreenWidth-24.0, 100);
        _styleList.minimumLineSpacing = 5.0;
    }
    return _styleList;
}

-(UICollectionViewFlowLayout *)styleBlock{
    if (_styleBlock == nil) {
        _styleBlock = [[UICollectionViewFlowLayout alloc] init];
        _styleBlock.itemSize = CGSizeMake((ScreenWidth-36.0)/2.0, (ScreenWidth-36.0)/2.0+50);
        _styleBlock.minimumInteritemSpacing = 12.0;
    }
    return _styleBlock;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionStyle = 1;
    [self createUI];
}


- (void)createUI{
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 44+[UIApplication sharedApplication].statusBarFrame.size.height, ScreenWidth, ScreenHeight) collectionViewLayout:self.styleBlock];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[NZAnimationCollectionCell class] forCellWithReuseIdentifier:@"NZAnimationCollectionCell"];
    
    UIButton *changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    changeBtn.frame = CGRectMake(0, 44+[UIApplication sharedApplication].statusBarFrame.size.height, ScreenWidth, 30);
    [self.view addSubview:changeBtn];
    changeBtn.backgroundColor = [UIColor redColor];
    [changeBtn setTitle:@"切换显示模式" forState:UIControlStateNormal];
    [changeBtn addTarget:self action:@selector(changeStyleAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)changeStyleAction:(UIButton *)btn{
    if (self.collectionStyle == 1) {
        self.collectionStyle = 0;
        
    }else{
        self.collectionStyle = 1;
    }
    
    ///修改显示中的cell
    NSArray *cellArray = [self.collectionView visibleCells];
    for (NZAnimationCollectionCell *cell in cellArray) {
        cell.cellType = self.collectionStyle;
    }
    ///切换collectionview的layout
    if (self.collectionStyle == 0) {
        [self.collectionView setCollectionViewLayout:self.styleList animated:YES];
    }else{
        [self.collectionView setCollectionViewLayout:self.styleBlock animated:YES];
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NZAnimationCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NZAnimationCollectionCell" forIndexPath:indexPath];
    
    cell.cellType = self.collectionStyle;
    
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}



@end
