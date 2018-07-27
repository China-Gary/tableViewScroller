//
//  ViewController.m
//  tubiao
//
//  Created by Fan on 2018/7/6.
//  Copyright © 2018年 Fan. All rights reserved.
//
#define swidth [UIScreen mainScreen].bounds.size.width
#define sheight [UIScreen mainScreen].bounds.size.height
#import "ViewController.h"
#import "AFNetworking.h"
#import "qishuTableViewCell.h"
#import "CollectionViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>{
    UITableView *_leftTable;
    UICollectionView *_infocoll;
    UIScrollView *_titleScroller;
}
@property (nonatomic, strong)NSMutableArray *wanArr;//万位走势
@property (nonatomic, strong)NSMutableArray *wandaxiao;//万位大小
@property (nonatomic, strong)NSMutableArray *wanjiou;//万位奇偶
@property (nonatomic, strong)NSMutableArray *wanzhihe;//万位质合
@property (nonatomic, strong)NSMutableArray *chu3s;//万位012路
@property (nonatomic, strong)NSMutableArray *chu4s;//万位除4
@property (nonatomic, strong)NSMutableArray *chu5s;//万位除5
@property (nonatomic, strong)NSMutableArray *wanzhenfu;//万位振幅
@property (nonatomic ,strong)NSMutableArray *allarr;
@property (nonatomic ,strong)NSMutableArray *qishuArr;
@property (nonatomic ,strong)NSMutableArray *resultAll;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //1.创建网络监测者
    // 创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://120.78.157.33/caipiaotool/tubiaofenxi?index=0&pagesize=30&action=%E4%B8%80%E6%98%9F%E5%88%86%E6%9E%90&category=cqssc" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"-----%@",[responseObject);
        NSMutableArray *temp = [NSMutableArray array];
        [self.qishuArr removeAllObjects];
        NSMutableArray *arr = responseObject[@"data"][0];
        for (NSDictionary *dis in arr) {
            [temp removeAllObjects];
//            NSLog(@"%@",[dis[@"hmfbs"] class]);
            [self.qishuArr addObject:dis[@"issue"]];
            [self.wanArr addObject:dis[@"hmfbs"]];
            [self.wandaxiao addObject:dis[@"dxs"]];
            [self.wanjiou addObject:dis[@"jos"]];
            [self.wanzhihe addObject:dis[@"zhs"]];
            [self.chu3s addObject:dis[@"chu3s"]];
            [self.chu4s addObject:dis[@"chu4s"]];
            [self.chu5s addObject:dis[@"chu5s"]];
            [self.wanzhenfu addObject:dis[@"zfs"]];
            [self.allarr addObject:dis[@"all"]];
            [self.resultAll addObject:dis[@"result"]];
        }
//
        [self addsubView];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}


- (void)addsubView {
  
//    for (NSArray *ar in self.wanArr) {
//        for (id str in ar) {
//            NSLog(@"%@",str);
//        }
//    }
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel= [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(0, 20, 100, 40);
    titleLabel.text = @"期数";
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    UIView *line1= [[UIView alloc] initWithFrame:CGRectMake(0, 20+39, 100, 1)];
    line1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line1];

    _leftTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, 100, sheight-60) style:UITableViewStyleGrouped];
    _leftTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _leftTable.delegate = self;
    _leftTable.showsVerticalScrollIndicator = NO;
    _leftTable.showsHorizontalScrollIndicator = NO;
    _leftTable.dataSource = self;
    [self.view addSubview:_leftTable];
    [_leftTable reloadData];
    
    
    _titleScroller = [[UIScrollView alloc] init];
    _titleScroller.frame = CGRectMake(100, 20, swidth - 100, sheight - 20);
    _titleScroller.showsHorizontalScrollIndicator = NO;
    _titleScroller.showsVerticalScrollIndicator = NO;
    _titleScroller.bounces= NO;
    _titleScroller.delegate = self;
    [self.view addSubview:_titleScroller];
    
    //添加头lable
    
    UIView *line2= [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 40)];
    line2.backgroundColor = [UIColor grayColor];
    [_titleScroller addSubview:line2];
    
    UILabel *wan = [[UILabel alloc] init];
    wan.font = [UIFont systemFontOfSize:14];
    wan= [[UILabel alloc] init];
    wan.frame = CGRectMake(0, 0, 30*10, 40);
    wan.text = @"万位走势";
    wan.textColor = [UIColor blackColor];
    wan.textAlignment = NSTextAlignmentCenter;
    [_titleScroller addSubview:wan];
    
    UIView *line3= [[UIView alloc] initWithFrame:CGRectMake(30*10, 0, 1, 40)];
    line3.backgroundColor = [UIColor grayColor];
    [_titleScroller addSubview:line3];
    
    UILabel *wandaxiao = [[UILabel alloc] init];
    wandaxiao= [[UILabel alloc] init];
    wandaxiao.font = [UIFont systemFontOfSize:14];
    wandaxiao.frame = CGRectMake(CGRectGetMaxX(wan.frame), 0, 30*2, 40);
    wandaxiao.text = @"万位大小";
    wandaxiao.textColor = [UIColor blackColor];
    wandaxiao.textAlignment = NSTextAlignmentCenter;
    [_titleScroller addSubview:wandaxiao];
    
    UIView *line4= [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(wandaxiao.frame), 0, 1, 40)];
    line4.backgroundColor = [UIColor grayColor];
    [_titleScroller addSubview:line4];
    
    UILabel *wanjiou = [[UILabel alloc] init];
    wanjiou= [[UILabel alloc] init];
    wanjiou.font = [UIFont systemFontOfSize:14];
    wanjiou.frame = CGRectMake(CGRectGetMaxX(wandaxiao.frame), 0, 30*2, 40);
    wanjiou.text = @"万位奇偶";
    wanjiou.textColor = [UIColor blackColor];
    wanjiou.textAlignment = NSTextAlignmentCenter;
    [_titleScroller addSubview:wanjiou];
    
    UIView *line5= [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(wanjiou.frame), 0, 1, 40)];
    line5.backgroundColor = [UIColor grayColor];
    [_titleScroller addSubview:line5];
    
    UILabel *wanzhihe = [[UILabel alloc] init];
    wanzhihe= [[UILabel alloc] init];
    wanzhihe.font = [UIFont systemFontOfSize:14];

    wanzhihe.frame = CGRectMake(CGRectGetMaxX(wanjiou.frame), 0, 30*2, 40);
    wanzhihe.text = @"万位质合";
    wanzhihe.textColor = [UIColor blackColor];
    wanzhihe.textAlignment = NSTextAlignmentCenter;
    [_titleScroller addSubview:wanzhihe];
    
    UIView *line6= [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(wanzhihe.frame), 0, 1, 40)];
    line6.backgroundColor = [UIColor grayColor];
    [_titleScroller addSubview:line6];
    
    UILabel *chu3 = [[UILabel alloc] init];
    chu3= [[UILabel alloc] init];
    chu3.font = [UIFont systemFontOfSize:14];
    chu3.frame = CGRectMake(CGRectGetMaxX(wanzhihe.frame), 0, 30*3, 40);
    chu3.text = @"万位012路";
    chu3.textColor = [UIColor blackColor];
    chu3.textAlignment = NSTextAlignmentCenter;
    [_titleScroller addSubview:chu3];
    
    UIView *line7= [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(chu3.frame), 0, 1, 40)];
    line7.backgroundColor = [UIColor grayColor];
    [_titleScroller addSubview:line7];
    
    UILabel *chu4 = [[UILabel alloc] init];
    chu4= [[UILabel alloc] init];
    chu4.font = [UIFont systemFontOfSize:14];
    chu4.frame = CGRectMake(CGRectGetMaxX(chu3.frame), 0, 30*4, 40);
    chu4.text = @"万位除4余数";
    chu4.textColor = [UIColor blackColor];
    chu4.textAlignment = NSTextAlignmentCenter;
    [_titleScroller addSubview:chu4];
    
    UIView *line8= [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(chu4.frame), 0, 1, 40)];
    line8.backgroundColor = [UIColor grayColor];
    [_titleScroller addSubview:line8];
    
    UILabel *chu5 = [[UILabel alloc] init];
    chu5= [[UILabel alloc] init];
    chu5.font = [UIFont systemFontOfSize:14];
    chu5.frame = CGRectMake(CGRectGetMaxX(chu4.frame), 0, 30*5, 40);
    chu5.text = @"万位除5余数";
    chu5.textColor = [UIColor blackColor];
    chu5.textAlignment = NSTextAlignmentCenter;
    [_titleScroller addSubview:chu5];
    
    UIView *line9= [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(chu5.frame), 0, 1, 40)];
    line9.backgroundColor = [UIColor grayColor];
    [_titleScroller addSubview:line9];
    
    UILabel *zhenfu = [[UILabel alloc] init];
    zhenfu= [[UILabel alloc] init];
    zhenfu.font = [UIFont systemFontOfSize:14];
    zhenfu.frame = CGRectMake(CGRectGetMaxX(chu5.frame), 0, 30*10, 40);
    zhenfu.text = @"万位振幅";
    zhenfu.textColor = [UIColor blackColor];
    zhenfu.textAlignment = NSTextAlignmentCenter;
    [_titleScroller addSubview:zhenfu];
    
    UIView *line10= [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(zhenfu.frame), 0, 1, 40)];
    line10.backgroundColor = [UIColor grayColor];
    [_titleScroller addSubview:line10];
    
    UIView *line= [[UIView alloc] initWithFrame:CGRectMake(0, 39, 30*38, 1)];
    line.backgroundColor = [UIColor grayColor];
    [_titleScroller addSubview:line];
    _titleScroller.contentSize = CGSizeMake(30*38, 40);
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 设置collectionView的滚动方向，需要注意的是如果使用了collectionview的headerview或者footerview的话， 如果设置了水平滚动方向的话，那么就只有宽度起作用了了
//    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _infocoll = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 40, 30*38, sheight-60) collectionViewLayout:layout];
    _infocoll.backgroundColor = [UIColor whiteColor];
    _infocoll.dataSource = self;
    _infocoll.delegate = self;
    [_titleScroller addSubview:_infocoll];
//    [_infocoll registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"coll"];
    [_infocoll reloadData];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view=[[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.qishuArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _leftTable) {
        qishuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"qishu"];
        if (!cell) {
            cell = [[qishuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"qishu"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        [cell cellWithModel:self.qishuArr[indexPath.row]];
        return cell;
    }
    return nil;
}


/** 总共多少组*/
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.qishuArr.count;
}

/** 每组中cell的个数*/
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 38;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(30, 60);
}

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    return UIEdgeInsetsMake(5, 5, 5, 5);
//}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier=[NSString stringWithFormat:@"%ld%ld",(long)indexPath.section,(long)indexPath.row];
    [_infocoll registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:identifier];
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];

    if (indexPath.row < 10) {
        [cell cellwithArr:self.wanArr withindex:indexPath dic:self.allarr[indexPath.section] result:self.resultAll[indexPath.section]];
    } else if(indexPath.row <12) {
        [cell cellwithArr:self.wandaxiao withindex:indexPath dic:self.allarr[indexPath.section] result:self.resultAll[indexPath.section]];
    } else if (indexPath.row <14) {
        [cell cellwithArr:self.wanjiou withindex:indexPath dic:self.allarr[indexPath.section] result:self.resultAll[indexPath.section]];
    } else if (indexPath.row < 16) {
        [cell cellwithArr:self.wanzhihe withindex:indexPath dic:self.allarr[indexPath.section] result:self.resultAll[indexPath.section]];
    }else if (indexPath.row < 19) {
        [cell cellwithArr:self.chu3s withindex:indexPath dic:self.allarr[indexPath.section] result:self.resultAll[indexPath.section]];
    }else if (indexPath.row < 23) {
        [cell cellwithArr:self.chu4s withindex:indexPath dic:self.allarr[indexPath.section] result:self.resultAll[indexPath.section]];
    }else if (indexPath.row < 28) {
        [cell cellwithArr:self.chu5s withindex:indexPath dic:self.allarr[indexPath.section] result:self.resultAll[indexPath.section]];
    }else if (indexPath.row < 38) {
        [cell cellwithArr:self.wanzhenfu withindex:indexPath dic:self.allarr[indexPath.section] result:self.resultAll[indexPath.section]];
    }
    
    return cell;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout*)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout*)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

//这个方法就是实现上下滑动时候，左侧和右侧tableview联动的实现方法。
//MARK:- UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView == _leftTable) {
        
        [_infocoll setContentOffset:CGPointMake(_infocoll.contentOffset.x, _infocoll.contentOffset.y)];
        
    }
    
    if (scrollView == _infocoll) {
        
        [_leftTable setContentOffset:CGPointMake(0, _infocoll.contentOffset.y)];
        
    }
    
}

-(NSMutableArray *)qishuArr {
    if (!_qishuArr) {
        _qishuArr = [NSMutableArray array];
    }
    return _qishuArr;
}

-(NSMutableArray *)wanArr {
    if (!_wanArr) {
        _wanArr = [NSMutableArray array];
    }
    return _wanArr;
}

-(NSMutableArray *)wandaxiao {
    if (!_wandaxiao) {
        _wandaxiao = [NSMutableArray array];
    }
    return _wandaxiao;
}

-(NSMutableArray *)wanjiou {
    if (!_wanjiou) {
        _wanjiou = [NSMutableArray array];
    }
    return _wanjiou;
}
-(NSMutableArray *)wanzhihe {
    if (!_wanzhihe) {
        _wanzhihe = [NSMutableArray array];
    }
    return _wanzhihe;
}

-(NSMutableArray *)chu3s {
    if (!_chu3s) {
        _chu3s = [NSMutableArray array];
    }
    return _chu3s;
}

-(NSMutableArray *)chu4s {
    if (!_chu4s) {
        _chu4s = [NSMutableArray array];
    }
    return _chu4s;
}
-(NSMutableArray *)chu5s {
    if (!_chu5s) {
        _chu5s = [NSMutableArray array];
    }
    return _chu5s;
}

-(NSMutableArray *)wanzhenfu {
    if (!_wanzhenfu) {
        _wanzhenfu = [NSMutableArray array];
    }
    return _wanzhenfu;
}

-(NSMutableArray *)allarr {
    if (!_allarr) {
        _allarr = [NSMutableArray array];
    }
    return _allarr;
}
-(NSMutableArray *)resultAll {
    if (!_resultAll) {
        _resultAll = [NSMutableArray array];
    }
    return _resultAll;
}
@end
