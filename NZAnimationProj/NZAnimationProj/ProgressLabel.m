//
//  ProgressLabel.m
//  NZAnimationProj
//
//  Created by 聂政 on 2019/6/20.
//  Copyright © 2019 聂政. All rights reserved.
//

#import "ProgressLabel.h"

@interface ProgressLabel()

///两个label显示一样的文字 底部字色红色或其他页面， 顶部是一个覆盖层 添加字色白色的label，改变覆盖层的frame达到进度效果
@property (nonatomic, strong)UILabel *bottomLabel;
@property (nonatomic, strong)UIView *coverView;
@property (nonatomic, strong)UILabel *coverLabel;
//0~100;
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, strong) NSTimer *countTimer;
@end

@implementation ProgressLabel


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.progress = 10.0;
        [self createUI];
    }
    return self;
}


-(void)createUI{
    
    self.bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    [self addSubview:self.bottomLabel];
    self.bottomLabel.text = @"加载中...";
    self.bottomLabel.font = [UIFont systemFontOfSize:14.0];
    self.bottomLabel.textAlignment = NSTextAlignmentCenter;
    self.bottomLabel.textColor = [UIColor redColor];
    self.bottomLabel.layer.borderWidth = 0.5;
    self.bottomLabel.layer.borderColor = [UIColor redColor].CGColor;
    
    self.coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 30)];
    self.coverView.backgroundColor = [UIColor redColor];
    self.coverView.layer.masksToBounds = YES;
    [self addSubview:self.coverView];
    
    self.coverLabel = [[UILabel alloc] initWithFrame:self.bottomLabel.bounds];
    [self.coverView addSubview:self.coverLabel];
    self.coverLabel.text = @"加载中...";
    self.coverLabel.textColor = [UIColor whiteColor];
    self.coverLabel.font = [UIFont systemFontOfSize:14.0];
    self.coverLabel.textAlignment = NSTextAlignmentCenter;
    
    
    self.countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
}

-(void)timerAction:(NSTimer *)timer{
    __weak __typeof(self) weakSelf = self;
    self.progress += 10.0;
    if (self.progress > 100.0) {
        self.progress = 10.0;
    }
    [UIView animateWithDuration:0.2 animations:^{
        CGRect coverFrame = weakSelf.coverView.frame;
        coverFrame.size.width = weakSelf.progress/100.0 * 200;
        weakSelf.coverView.frame = coverFrame;
    }];
}


-(void)dealloc{
    if (self.countTimer) {
        [self.countTimer invalidate];
        self.countTimer = nil;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
