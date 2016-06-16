//
//  WSGAlertView.h
//  BHAlertView
//
//  Created by sunny on 16/6/15.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSGAlertView : UIView

@property (nonatomic,strong) NSString *titleImageURL;
@property (nonatomic,strong) NSString *title;

@property (nonatomic,assign) BOOL closeButtonHidden;

@property (nonatomic,strong) NSString *message;

@property (nonatomic,strong) UIView *containView;

@property (nonatomic,strong) NSMutableArray *buttonArray;

- (id)initWithTitle:(NSString *)title titleImageURL:(NSString *)titleImageURL closeButtonHidden:(BOOL)closeButtonHidden message:(NSString *)message containView:(UIView *)containView buttonArray:(NSMutableArray *)buttonArray;

- (void)show;


- (void)hide;


@end
