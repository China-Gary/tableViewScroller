//
//  CollectionViewCell.h
//  tubiao
//
//  Created by Fan on 2018/7/6.
//  Copyright © 2018年 Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (nonatomic ,strong)UILabel *label1;
@property(nonatomic ,strong)UIView *colorview;
-(void)addview;
-(void)cellwithArr:(NSMutableArray*)arr withindex:(NSIndexPath*)index dic:(NSDictionary*)dic result:(NSString*)result;
@end
