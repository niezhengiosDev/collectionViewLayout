//
//  NZAnimationCollectionCell.m
//  NZAnimationProj
//
//  Created by 聂政 on 2019/6/20.
//  Copyright © 2019 聂政. All rights reserved.
//

#import "NZAnimationCollectionCell.h"
#import "SDAutoLayout.h"

@interface NZAnimationCollectionCell()
@property (nonatomic, strong) UIImageView *picImageViewl;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *subLabel;
@end

@implementation NZAnimationCollectionCell


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self createUI];
    }
    return self;
}


-(void)createUI{
    self.picImageViewl = [[UIImageView alloc] init];
    self.picImageViewl.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.picImageViewl];
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.text = @"我是大标题文字";
    self.nameLabel.font = [UIFont systemFontOfSize:16.0];
    [self.contentView addSubview:self.nameLabel];
    
    self.subLabel = [[UILabel alloc] init];
    self.subLabel.text = @"我是副标题文字";
    self.subLabel.font = [UIFont systemFontOfSize:14.0];
    [self.contentView addSubview:self.subLabel];
}


-(void)setCellType:(NSInteger)cellType{
    if (cellType == 1) {
        ///方块
        [self layoutBlockList];
    }else{
        ///列表
        [self layoutStyleList];
    }
}


-(void)layoutStyleList{
    self.picImageViewl.sd_resetLayout
    .leftSpaceToView(self.contentView, 6)
    .topSpaceToView(self.contentView, 6)
    .heightIs(80)
    .widthEqualToHeight();
    
    self.nameLabel.sd_resetLayout
    .leftSpaceToView(self.picImageViewl, 10.0)
    .topSpaceToView(self.contentView, 10.0)
    .rightSpaceToView(self.contentView, 40.0)
    .heightIs(30.0);
    
    self.subLabel.sd_resetLayout
    .leftSpaceToView(self.picImageViewl, 10.0)
    .topSpaceToView(self.nameLabel, 10.0)
    .rightSpaceToView(self.contentView, 40.0)
    .heightIs(20.0);
}

-(void)layoutBlockList{
    
    self.picImageViewl.sd_resetLayout
    .leftSpaceToView(self.contentView, 0.0)
    .topSpaceToView(self.contentView, 0.0)
    .widthIs(([UIScreen mainScreen].bounds.size.width-36.0)/2.0)
    .heightEqualToWidth();
    
    self.nameLabel.sd_resetLayout
    .leftSpaceToView(self.contentView, 6)
    .rightSpaceToView(self.contentView, 6.0)
    .topSpaceToView(self.picImageViewl, 6.0)
    .heightIs(20.0);
    
    self.subLabel.sd_resetLayout
    .leftSpaceToView(self.contentView, 6.0)
    .rightSpaceToView(self.contentView, 6.0)
    .topSpaceToView(self.nameLabel, 8.0)
    .heightIs(20.0);
    
}



@end
