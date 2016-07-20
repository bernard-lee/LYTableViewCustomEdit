//
//  LYCustomTableViewCell.h
//  LYTableViewCustomEdit
//
//  Created by Bernard Lee on 7/18/16.
//  Copyright © 2016 Bernard Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LYCustomTableViewCellDelegate <NSObject>

@optional

@property(nonatomic, assign, readonly, getter=isPseudoEditing) BOOL pseudoEdit;

@end

@interface LYCustomTableViewCell : UITableViewCell

@property(nonatomic, assign) id<LYCustomTableViewCellDelegate> delegate;

@property(nonatomic, strong) UILabel *titleLabel;

@end
