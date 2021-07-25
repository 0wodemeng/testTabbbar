//
//  testListTableViewCell.m
//  testTabbbar
//
//  Created by 陈列 on 2018/11/12.
//  Copyright © 2018年 陈列. All rights reserved.
//

#import "testListTableViewCell.h"

@interface testListTableViewCell ()



@end

@implementation testListTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    _titleLabel=[[UILabel alloc] init];
    _titleLabel.textAlignment = 0;
    _titleLabel.numberOfLines = 0;
//    [_titleLabel setBackgroundColor:[UIColor orangeColor]];
    _titleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleLabel];
    
    _contentLabel=[[UILabel alloc] init];
    _contentLabel.textAlignment = 0;
    _contentLabel.numberOfLines = 0;
    _contentLabel.font = [UIFont systemFontOfSize:14];
//    [_contentLabel setBackgroundColor:[UIColor orangeColor]];
    [self.contentView addSubview:_contentLabel];
}

-(void)layoutSubviews{
    [_titleLabel setFrame:CGRectMake(10, 5, 100, CGRectGetHeight(self.contentView.frame)-10)];
    [_contentLabel setFrame:CGRectMake(115, 5, CGRectGetWidth(self.contentView.frame)-120, CGRectGetHeight(self.contentView.frame)-10)];
    
    [super layoutSubviews];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
