//
//  testBaseView.m
//  testTabbbar
//
//  Created by 陈列 on 2019/5/31.
//  Copyright © 2019年 陈列. All rights reserved.
//

#import "testBaseView.h"

@implementation testBaseView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) style:UITableViewStylePlain];
        [self.tableView setBackgroundColor:[UIColor redColor]];
        [self addSubview:self.tableView];
    }
    return self;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
