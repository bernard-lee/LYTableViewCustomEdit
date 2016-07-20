//
//  LYCustomTableViewCell.m
//  LYTableViewCustomEdit
//
//  Created by Bernard Lee on 7/18/16.
//  Copyright © 2016 Bernard Lee. All rights reserved.
//

#import "LYCustomTableViewCell.h"
#import "Masonry.h"

static NSInteger const kCustomEditControlWidth=30;

@interface LYCustomTableViewCell ()

@property (nonatomic, getter=isPseudoEditing) BOOL pseudoEdit;

@property(nonatomic, strong) UIView *mainView;
@property(nonatomic, strong) UIButton *customEditControl;


@end

@implementation LYCustomTableViewCell

#pragma mark - Life cycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.customEditControl];
        [self addSubview:self.mainView];
        [self.mainView addSubview:self.titleLabel];

//        self.mainView.backgroundColor = [UIColor blueColor];
        [self makeConstraintsForSubviews];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    self.customEditControl.selected = selected;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    if ([self.delegate isPseudoEditing]) {
        self.pseudoEdit = editing;
        [self beginEditMode];
    } else {
        [super setEditing:editing animated:animated];
    }
}

#pragma mark - Private methods

- (void)makeConstraintsForSubviews
{
    [self.customEditControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(@(-kCustomEditControlWidth));
        make.height.equalTo(@20);
        make.width.equalTo(@20);
    }];
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self);
        make.left.equalTo(self.customEditControl.mas_right).offset(10);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.mainView);
        make.left.equalTo(self.mainView).offset(20);
    }];
}

- (void)beginEditMode
{
    [self.customEditControl mas_updateConstraints:^(MASConstraintMaker *make) {
        if (self.isPseudoEditing) {
            make.left.equalTo(@10);
        } else {
            make.left.equalTo(@(-kCustomEditControlWidth));
        }
    }];

    
    [UIView animateWithDuration:0.3 animations:^{
        [self.mainView.superview layoutIfNeeded];
    }];
    
}

#pragma mark - Getters and Setters

- (UIView *)mainView
{
    if (nil != _mainView) {
        return _mainView;
    }
    
    _mainView = [[UIView alloc] init];
    
    return _mainView;
}

- (UIButton *)customEditControl
{
    if (nil != _customEditControl) {
        return _customEditControl;
    }
    
    _customEditControl = [UIButton buttonWithType:UIButtonTypeCustom];
    [_customEditControl setBackgroundImage:[UIImage imageNamed:@"1a_select_plan_icon"] forState:UIControlStateNormal];
    [_customEditControl setBackgroundImage:[UIImage imageNamed:@"1_select_plan_icon"] forState:UIControlStateSelected];
    _customEditControl.userInteractionEnabled = NO;
    
    return _customEditControl;
}

- (UILabel *)titleLabel
{
    if (nil != _titleLabel) {
        return _titleLabel;
    }
    
    _titleLabel = [[UILabel alloc] init];
    [_titleLabel setTextColor:[UIColor blackColor]];
    _titleLabel.font = [UIFont systemFontOfSize:18.0];
    
    return _titleLabel;
}

@end
