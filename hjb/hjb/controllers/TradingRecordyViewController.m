//
//  TradingRecordyViewController.m
//  hjb
//
//  Created by zeno on 16/3/15.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "TradingRecordyViewController.h"
#import <Masonry/Masonry.h>

@interface TradingRecordyViewController ()
@property(nonatomic,strong) NSMutableDictionary *  m_allrecorddic;
@property(nonatomic,strong) NSMutableDictionary *  m_allchargedic;
@property(nonatomic,strong) UISegmentedControl * segmentControl;
@end

@implementation TradingRecordyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"交易记录";
    [self segmentControl];
    self.tableView.frame = CGRectMake(0, self.segmentControl.bottom + 5, self.view.width, self.view.height - self.segmentControl.bottom - 5);
    self.tableView.contentInset = UIEdgeInsetsZero;
    [self.dataDictionary addEntriesFromDictionary:self.m_allrecorddic];
    
    __block int currsegmentIndex = 0;
    @weakify(self)
    [[self.segmentControl rac_newSelectedSegmentIndexChannelWithNilValue:@0] subscribeNext:^(id x) { @strongify(self)
        
        NSNumber * sectinIndex = x;
        if (currsegmentIndex!= sectinIndex.integerValue ) {
            currsegmentIndex = sectinIndex.integerValue ;
            if (sectinIndex.integerValue == 0) {
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    [self.dataDictionary removeAllObjects];
                    [self.dataDictionary addEntriesFromDictionary:self.m_allrecorddic];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.tableView reloadData];
                    });
                });
            }
            else
            {
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    [self.dataDictionary removeAllObjects];
                    [self.dataDictionary addEntriesFromDictionary:self.m_allchargedic];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.tableView reloadData];
                    });
                });
            }

        }
    }];
    
    
}

-(NSMutableDictionary *)loadplist:(NSString *)plistname
{
    NSString * filepath = [[NSBundle mainBundle] pathForResource:plistname ofType:@"plist"];
    NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:filepath];
    NSMutableDictionary * cellstructdic = [NSMutableDictionary new];
    for (NSString * key in dic.allKeys) {
        NSDictionary * adic = dic[key];
        CELL_STRUCT * cellstruct = [[CELL_STRUCT alloc] initWithPlistDictionary:adic];
        [cellstructdic setObject:cellstruct forKey:key];
    }
    return cellstructdic;
}

GET_CELL_SELECT_ACTION(cellstruct)
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)segmentControrChange:(id)sender
{
    
}

-(UISegmentedControl *)segmentControl
{
    if (!_segmentControl) {
        UISegmentedControl * segmentContror = [[UISegmentedControl alloc] initWithItems:@[@"全部记录",@"账户充值"]];
        segmentContror.frame = CGRectMake(0, 65, 300, 30);
        segmentContror.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, 65+20);
        segmentContror.selectedSegmentIndex = 0;
        segmentContror.backgroundColor =  [UIColor clearColor];
        segmentContror.tintColor = self.hjb_themecolor;//[UIColor colorWithWhite:1 alpha:0.5];
        [segmentContror setTitleTextAttributes:@{NSForegroundColorAttributeName:self.hjb_themecolor} forState: UIControlStateNormal];
        [segmentContror setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState: UIControlStateSelected];
        [self.view addSubview:segmentContror];
        _segmentControl = segmentContror;
    }
    return _segmentControl;
}


-(NSMutableDictionary *)m_allchargedic
{
    if (!_m_allchargedic) {
        _m_allchargedic = [NSMutableDictionary new];
        _m_allchargedic = [self loadplist:@"trvcharge"];
    }
    return _m_allchargedic;
}


-(NSMutableDictionary *)m_allrecorddic
{
    if (!_m_allrecorddic) {
        _m_allrecorddic = [NSMutableDictionary new];
        _m_allrecorddic = [self loadplist:@"trvrecord"];
    }
    return _m_allrecorddic;
}

@end
