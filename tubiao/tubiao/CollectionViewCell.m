//
//  CollectionViewCell.m
//  tubiao
//
//  Created by Fan on 2018/7/6.
//  Copyright © 2018年 Fan. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self addview];
    }
    return self;
}

-(void)addview {
    self.label1 = [[UILabel alloc] init];
    self.label1.backgroundColor = [UIColor clearColor];
    self.label1.frame = CGRectMake(0, 0, 30, 60);
    self.label1.font = [UIFont systemFontOfSize:14];
    self.label1.textColor = [UIColor blackColor];
    self.label1.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.label1];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 60)];
    line.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:line];
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 59, 30, 1)];
    line1.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:line1];
    
    self.colorview = [[UIView alloc] initWithFrame:CGRectMake(5, 20, 20, 20)];
    self.colorview.layer.cornerRadius = 10;
    self.colorview.alpha = 0.5;
    self.colorview.layer.masksToBounds = YES;
    [self.contentView insertSubview:self.colorview belowSubview:self.label1];
}

-(void)cellwithArr:(NSMutableArray*)arr withindex:(NSIndexPath*)index dic:(NSDictionary*)dic result:(NSString*)result{
    self.colorview.hidden = YES;
    self.label1.backgroundColor = [UIColor clearColor];
    self.label1.textColor = [UIColor blackColor];
    self.backgroundColor = [UIColor whiteColor];
    if (index.row < 10) {
        self.label1.text = [NSString stringWithFormat:@"%@",arr[index.section][index.row]];
        if (index.row == result.integerValue) {
            self.colorview.hidden = NO;
            self.colorview.backgroundColor = [UIColor blueColor];
            self.label1.text = [NSString stringWithFormat:@"%@",result];
        }
    } else if(index.row <12 && index.row >= 10) {
        self.backgroundColor = [UIColor colorWithRed:254/256.0 green:252/256.0 blue:238/256.0 alpha:1];
        self.label1.text = [NSString stringWithFormat:@"%@",arr[index.section][index.row-10]];
        NSInteger dx = [arr[index.section] indexOfObject:dic[@"dx"]];
        if (index.row - 10 == dx ) {
            self.label1.backgroundColor = [UIColor blueColor];
            self.label1.textColor = [UIColor whiteColor];
        }
    } else if (index.row <14&& index.row >= 12) {
        self.label1.text = [NSString stringWithFormat:@"%@",arr[index.section][index.row-12]];
        NSInteger dx = [arr[index.section] indexOfObject:dic[@"jo"]];
        if (index.row - 12 == dx) {
            self.label1.backgroundColor = [UIColor greenColor];
            self.label1.textColor = [UIColor whiteColor];
        }
    } else if (index.row < 16 && index.row >= 14) {
        self.backgroundColor = [UIColor colorWithRed:254/256.0 green:252/256.0 blue:238/256.0 alpha:1];
        self.label1.text = [NSString stringWithFormat:@"%@",arr[index.section][index.row-14]];
        NSInteger dx = [arr[index.section] indexOfObject:dic[@"zh"]];
        if (index.row - 14 == dx) {
            self.label1.backgroundColor = [UIColor blueColor];
            self.label1.textColor = [UIColor whiteColor];
        }
    }else if (index.row < 19 && index.row >= 16) {
        self.label1.text = [NSString stringWithFormat:@"%@",arr[index.section][index.row-16]];
        NSInteger dx = [arr[index.section] indexOfObject:dic[@"3"]];
        if (index.row - 16 == dx) {
            self.label1.backgroundColor = [UIColor greenColor];
            self.label1.textColor = [UIColor whiteColor];
        }
    }else if (index.row < 23 && index.row >= 19) {
        self.backgroundColor = [UIColor colorWithRed:254/256.0 green:252/256.0 blue:238/256.0 alpha:1];
        self.label1.text = [NSString stringWithFormat:@"%@",arr[index.section][index.row-19]];
        NSInteger dx = [arr[index.section] indexOfObject:dic[@"4"]];
        if (index.row - 19 == dx) {
            self.label1.backgroundColor = [UIColor blueColor];
            self.label1.textColor = [UIColor whiteColor];
        }
    }else if (index.row < 28 && index.row >= 23) {
        self.label1.text = [NSString stringWithFormat:@"%@",arr[index.section][index.row-23]];
        NSInteger dx = [arr[index.section] indexOfObject:dic[@"5"]];
        if (index.row - 23 == dx) {
            self.label1.backgroundColor = [UIColor greenColor];
            self.label1.textColor = [UIColor whiteColor];
        }
    }else if (index.row < 38 && index.row >= 28) {
        self.backgroundColor = [UIColor colorWithRed:254/256.0 green:252/256.0 blue:238/256.0 alpha:1];
        self.label1.text = [NSString stringWithFormat:@"%@",arr[index.section][index.row-28]];
        NSInteger dx = [arr[index.section] indexOfObject:dic[@"zf"]];
        if (index.row - 28 == dx) {
            self.colorview.hidden = NO;
            self.colorview.backgroundColor = [UIColor redColor];
            self.label1.text = [NSString stringWithFormat:@"%@",result];
        }
    }
}

@end
