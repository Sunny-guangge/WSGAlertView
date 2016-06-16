//
//  WSGAlertView.m
//  BHAlertView
//
//  Created by 王帅广 on 16/6/15.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "WSGAlertView.h"
#import "UIView+BH.h"

@interface WSGAlertView ()

@property (nonatomic,strong)  UIView *backView;

@property (nonatomic,strong) UIView *contentView;

@property (nonatomic,strong) UIView *titleView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *titleImageView;
@property (nonatomic,strong) UIButton *closeButton;

@property (nonatomic,strong) UILabel *messageLabel;

@end

static NSInteger const closeButtonHW = 16;

static NSInteger const titleFont = 15;
static NSString *const titleColor = @"#333333";

static NSInteger const titleToTop = 30;
static NSInteger const titleLabelH = 20;

static NSInteger const titleToMessage = 15;

static NSInteger const buttonFont = 14;
static NSString *const buttonColor = @"#4286f5";
static NSString *const buttonBackColor = @"#ffffff";

CGFloat contentViewWidth;

CGFloat contentViewHeight;

@implementation WSGAlertView

- (instancetype)init
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        _backView.backgroundColor = [UIColor blackColor];
        [self addSubview:_backView];
        
    }
    return self;
}


- (id)initWithTitle:(NSString *)title titleImageURL:(NSString *)titleImageURL closeButtonHidden:(BOOL)closeButtonHidden message:(NSString *)message containView:(UIView *)containView buttonArray:(NSMutableArray *)buttonArray
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        
        _title = title;
        _titleImageURL = titleImageURL;
        _closeButtonHidden = closeButtonHidden;
        _message = message;
        _containView = containView;
        _buttonArray = buttonArray;
        
        self.backgroundColor = [UIColor clearColor];
        _backView = [[UIView alloc] initWithFrame:self.frame];
        _backView.backgroundColor = [UIColor blackColor];
        [self addSubview:_backView];
        
        [self initcontentView];
    }
    return self;
}

- (void)initcontentView
{
    contentViewWidth = 280 * self.frame.size.width / 320;
    contentViewHeight = titleToTop;
    
    _contentView = [[UIView alloc] init];
    _contentView.layer.masksToBounds = YES;
    _contentView.layer.cornerRadius = 5;
    _contentView.backgroundColor = [UIColor whiteColor];
    
    self.closeButton.hidden = _closeButtonHidden;
    self.closeButton.frame = CGRectMake(contentViewWidth - 32, closeButtonHW, closeButtonHW, closeButtonHW);
    [_contentView addSubview:self.closeButton];
    
    
    if (_title) {
        
        self.titleLabel.text = _title;
        
        CGSize titleSize = [_titleLabel sizeThatFits:CGSizeMake(contentViewWidth - 20, titleLabelH)];
        self.titleLabel.frame = CGRectMake(contentViewWidth/ 2 - titleSize.width / 2, contentViewHeight, titleSize.width, titleLabelH);
        [_contentView addSubview:self.titleLabel];
        
        if (_titleImageURL) {
            
            self.titleImageView.image = [UIImage imageNamed:_titleImageURL];
            self.titleImageView.frame = CGRectMake(contentViewWidth/ 2 - titleSize.width / 2 - 18 , contentViewHeight + 2, 16, 16);
            
            [_contentView addSubview:self.titleImageView];
        }else
        {
            
        }
        contentViewHeight += (titleLabelH + titleToMessage);
        
    }else
    {
        
    }
    
    if (_message) {
        
        self.messageLabel.text = _message;
        
        CGSize messageSize = [self.messageLabel sizeThatFits:CGSizeMake(contentViewWidth - 20, MAXFLOAT)];
        self.messageLabel.frame = CGRectMake(contentViewWidth / 2 - messageSize.width / 2, contentViewHeight, messageSize.width, messageSize.height);
        
        [_contentView addSubview:self.messageLabel];
        
        contentViewHeight += (messageSize.height + titleToMessage);
        
    }else
    {
        
    }
    
    if (_containView) {

        if (_containView.size.width > contentViewWidth) {
            
            CGSize contsize = _containView.size;
            
            _containView.size = CGSizeMake(contentViewWidth, contentViewWidth * contsize.height / contsize.width);
            _containView.frame = CGRectMake(0, contentViewHeight, contentViewWidth, contentViewWidth * contsize.height / contsize.width);
            
            
            contentViewHeight = _containView.size.height + titleToMessage;
            
        }else
        {
            CGSize contsize = _containView.size;
            _containView.frame = CGRectMake(contentViewWidth / 2 - contsize.width / 2, contentViewHeight, contsize.width, contsize.height);
            contentViewHeight += _containView.size.height + titleToMessage;
        }
        [_contentView addSubview:_containView];
    }else
    {
        
    }
    
    if (_buttonArray) {
        
        if (_buttonArray.count == 1) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:[_buttonArray objectAtIndex:0] forState:UIControlStateNormal];
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = 16;
            button.backgroundColor = [UIColor blueColor];
            button.tag = 0;
            button.titleLabel.font = [UIFont systemFontOfSize:buttonFont];
            button.frame = CGRectMake(contentViewWidth / 2 - 40, contentViewHeight, 80, 32);
            [button addTarget:self action:@selector(clickButtonWithSender:) forControlEvents:UIControlEventTouchUpInside];
            [_contentView addSubview:button];
        }
        if (_buttonArray.count == 2) {
            
            UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
            button1.backgroundColor = [UIColor whiteColor];
            [button1 setTitle:@"哈哈" forState:UIControlStateNormal];
            button1.layer.masksToBounds = YES;
            button1.layer.cornerRadius = 16;
            button1.layer.borderWidth = 1;
            button1.layer.borderColor = [UIColor blueColor].CGColor;
            button1.tag = 0;
            button1.titleLabel.font = [UIFont systemFontOfSize:buttonFont];
            [button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            button1.frame = CGRectMake(contentViewWidth / 2 - 20 - 80, contentViewHeight, 80, 32);
            [button1 addTarget:self action:@selector(clickButtonWithSender:) forControlEvents:UIControlEventTouchUpInside];
            [_contentView addSubview:button1];
            
            UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button2 setTitle:[_buttonArray objectAtIndex:1] forState:UIControlStateNormal];
            button2.layer.masksToBounds = YES;
            button2.layer.cornerRadius = 16;
            button2.backgroundColor = [UIColor blueColor];
            button2.tag = 1;
            button2.titleLabel.font = [UIFont systemFontOfSize:buttonFont];
            button2.frame = CGRectMake(contentViewWidth / 2 + 20, contentViewHeight, 80, 32);
            [button2 addTarget:self action:@selector(clickButtonWithSender:) forControlEvents:UIControlEventTouchUpInside];
            [_contentView addSubview:button2];
        }
        
        contentViewHeight += (32 + titleToMessage);
        
    }else
    {
        
    }
    
    _contentView.frame = CGRectMake(0, 0, contentViewWidth, contentViewHeight);
    _contentView.center = self.center;
    [self addSubview:_contentView];
}

- (void)clickButtonWithSender:(UIButton *)sender
{
    [self hide];
}

#pragma mark - Methord
- (void)hide
{
    [self hideAlertAnimation];
}

- (void)hideAlertAnimation {
    
    [UIView animateWithDuration:0.35 animations:^{
        _contentView.transform = CGAffineTransformMakeScale(0.1, 1.1);
        _contentView.alpha = 0.0;
        _backView.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [_contentView removeFromSuperview];
            [self removeFromSuperview];
        }
    }];
    
    [UIView animateWithDuration:1.5 animations:^{
        _contentView.transform = CGAffineTransformMakeScale(1.1, 1.1);
        _contentView.alpha = 0.0;
        _backView.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [_contentView removeFromSuperview];
            [self removeFromSuperview];
        }
    }];

}

- (void)alertViewIsRemoved
{
    [self.backView removeFromSuperview];
}

- (void)show
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    NSArray *windowViews = [window subviews];
    if(windowViews && [windowViews count] > 0){
        UIView *subView = [windowViews objectAtIndex:[windowViews count]-1];
        for(UIView *aSubView in subView.subviews)
        {
            [aSubView.layer removeAllAnimations];
        }
        [subView addSubview:self];
        [self showBackground];
        [self showAlertAnimation];
    }
}

- (void)showBackground
{
    _backView.alpha = 0;
    [UIView beginAnimations:@"fadeIn" context:nil];
    [UIView setAnimationDuration:0.35];
    _backView.alpha = 0.3;
    [UIView commitAnimations];
}

-(void)showAlertAnimation
{
//    CAKeyframeAnimation * animation;
//    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
//    animation.duration = 0.30;
//    animation.removedOnCompletion = YES;
//    animation.fillMode = kCAFillModeForwards;
//    NSMutableArray *values = [NSMutableArray array];
//    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
//    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.0)]];
//    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
//    animation.values = values;
//    [self.contentView.layer addAnimation:animation forKey:nil];
    
    
    _contentView.transform = CGAffineTransformMakeScale(1.3, 1.3);
    _contentView.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        _contentView.alpha = 1;
        _contentView.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

#pragma mark - Getter
- (UIButton *)closeButton
{
    if (_closeButton == nil) {
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = _title;
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:titleFont];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIImageView *)titleImageView
{
    if (_titleImageView == nil) {
        _titleImageView = [[UIImageView alloc] init];
        _titleImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _titleImageView;
}

- (UILabel *)messageLabel
{
    if (_messageLabel == nil) {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.font = [UIFont systemFontOfSize:12];
        _messageLabel.textColor = [UIColor redColor];
        _messageLabel.numberOfLines = 0;
    }
    return _messageLabel;
}

@end
