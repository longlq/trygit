//
//  LQLTableSectionView.m
//  Table
//
//  Created by Le Quang Long on 5/7/14.
//  Copyright (c) 2014 Le Quang Long. All rights reserved.
//

#import "LQLTableSectionView.h"
@interface LQLTableSectionView ()
{
	NSMutableArray *selectedSectionIndexPaths;
	NSInteger currentTappedSection;
	BOOL isSwiping;
	BOOL tapped;
}
@end
@implementation LQLTableSectionView

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		// Initialization code
	}
	return self;
}

/*
   // Only override drawRect: if you perform custom drawing.
   // An empty implementation adversely affects performance during animation.
   - (void)drawRect:(CGRect)rect
   {
    // Drawing code
   }
 */
- (id)initSectionViewWithData:(id)data atSection:(NSInteger)sectionID {
	self = [super initWithFrame:(CGRect) {0, 0, 320, 44 }];
	if (self) {
		// Initialization code
		self.sectionContentView = [[UIScrollView alloc] initWithFrame:self.bounds];
		[self.sectionContentView setBackgroundColor:[UIColor brownColor]];
		currentTappedSection = sectionID;
		UILabel *lblDate = [[UILabel alloc] initWithFrame:(CGRect) {0, 0, 100, 44 }];
		[lblDate setBackgroundColor:[UIColor yellowColor]];
		[lblDate setText:[NSString stringWithFormat:@"Section : %d", sectionID]];
		[self.sectionContentView addSubview:lblDate];

		UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] init];
		[tapGesture addTarget:self action:@selector(tappedOnSection:)];
		[self addGestureRecognizer:tapGesture];

		UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] init];
		swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
		[swipeGesture addTarget:self action:@selector(leftSwipeOnSection:)];
		[self addGestureRecognizer:swipeGesture];

		tapped = NO;
		[self addSubview:self.sectionContentView];
	}
	return self;
}

- (void)tappedOnSection:(UISwipeGestureRecognizer *)tapGesture {
	NSLog(@"Tapped on section:%d", currentTappedSection);
	tapped = !tapped;

	if (self.sectionType == eSECTION_COLLAPSE) {
		if (isSwiping) {
			[self.sectionContentView setFrame:(CGRect) {0, 0, 320, self.bounds.size.height }];
			isSwiping = NO;
			NSLog(@"Tap on cell in swiping mode");
		}
		else {
			if (tapped) {
				NSLog(@"Expand mode");
				self.sectionType = eSECTION_EXPAND;
				CGFloat heightInExpandMode = [self.sectionDelegate heightSectionInExpandMode:self inSection:currentTappedSection];
				[self.sectionContentView setFrame:(CGRect) {0, 0, 320, heightInExpandMode }];
				[self.sectionContentView setBackgroundColor:[UIColor whiteColor]];
                
                if (self.sectionDelegate && [self.sectionDelegate respondsToSelector:@selector(willExpandCell:inSection:)]) {
                    [self.sectionDelegate willExpandCell:self inSection:currentTappedSection];
                }
			}
			else {
				NSLog(@"colapse mode");
				[self.sectionContentView setFrame:(CGRect) {0, 0, 320, 44 }];
				[self.sectionContentView setBackgroundColor:[UIColor yellowColor]];
			}
		}
	}
}

- (void)leftSwipeOnSection:(UITapGestureRecognizer *)tapGesture {
	NSLog(@"Tapped on section:%d", currentTappedSection);
	if (self.sectionType == eSECTION_COLLAPSE) {
		NSLog(@"swipe on cell");
		isSwiping = YES;
		[self.sectionContentView setFrame:(CGRect) {-100, 0, 320, self.bounds.size.height }];
	}
}

@end
