//
//  qishuTableViewCell.h
//  tubiao
//
//  Created by Fan on 2018/7/6.
//  Copyright © 2018年 Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface qishuTableViewCell : UITableViewCell
@property (nonatomic ,strong)UILabel *qishu;
-(void)cellWithModel:(NSString*)str;
@end
