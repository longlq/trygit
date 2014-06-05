//
//  LQLTableSectionView.h
//  Table
//
//  Created by Le Quang Long on 5/7/14.
//  Copyright (c) 2014 Le Quang Long. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    eSECTION_COLLAPSE,
    eSECTION_EXPAND
}SECTION_IN_PROGRESS;

@class LQLTableSectionView;
@protocol LQLTableSectionViewDelegate <NSObject>

@optional
- (void)didTapOnSection:(LQLTableSectionView *)sectionView atIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)heightSectionInExpandMode:(LQLTableSectionView *)sectionView inSection:(NSInteger)section;
- (void)willExpandCell:(LQLTableSectionView *)sectionView inSection:(NSInteger)section;

@end
@interface LQLTableSectionView : UIView
@property (nonatomic,assign) id<LQLTableSectionViewDelegate> sectionDelegate;
@property (nonatomic,assign) SECTION_IN_PROGRESS sectionType;
@property (nonatomic,strong) UIScrollView *sectionContentView;

- (id)initSectionViewWithData:(id)data atSection:(NSInteger)sectionID;
@end
