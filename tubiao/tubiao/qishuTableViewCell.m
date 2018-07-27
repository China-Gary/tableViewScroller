//
//  qishuTableViewCell.m
//  tubiao
//
//  Created by Fan on 2018/7/6.
//  Copyright © 2018年 Fan. All rights reserved.
//

#import "qishuTableViewCell.h"

@implementation qishuTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addView];
    }
    return self;
}

-(void)addView {
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 59, 100, 1)];
    line.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:line];
    self.backgroundColor = [UIColor colorWithRed:221/256.0 green:221/256.0 blue:227/256.0 alpha:1];
    self.qishu = [[UILabel alloc] init];
    self.qishu.frame = CGRectMake(0, 0, 100, 60);
    self.qishu.textColor = [UIColor blackColor];
    self.qishu.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.qishu];
    
}

- (void)cellWithModel:(NSString *)str {
    self.qishu.text = [NSString stringWithFormat:@"第%@期",str];
}

@end
