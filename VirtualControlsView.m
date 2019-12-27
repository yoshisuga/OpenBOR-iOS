//
//  VirtualControlsView.m
//  OpenBOR
//
//  Created by Yoshi Sugawara on 12/7/19.
//

#import "VirtualControlsView.h"
#import "DPadView.h"

@interface VirtualControlsView()
@property(nonatomic) NSLayoutConstraint *dPadWidthConstraint;
@property(nonatomic) NSLayoutConstraint *dPadHeightConstraint;
@end

@implementation VirtualControlsView

-(instancetype) init {
    self = [self initWithFrame:CGRectZero];
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self commonInit];
    return self;
}

-(instancetype) initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    [self commonInit];
    return self;
}

-(void)commonInit {
    _dPadView = [[DPadView alloc] initWithFrame:CGRectZero];
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.backgroundColor = UIColor.clearColor;
    [self addSubview:_dPadView];
    [[_dPadView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:20.0f] setActive:YES];
    [[_dPadView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-40.0f] setActive:YES];
    _dPadWidthConstraint = [_dPadView.widthAnchor constraintEqualToConstant:0.0];
    _dPadHeightConstraint = [_dPadView.heightAnchor constraintEqualToConstant:0.0];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    CGFloat size = self.bounds.size.width * 0.2f;
    [_dPadWidthConstraint setActive:NO];
    _dPadWidthConstraint.constant = size;
    [_dPadWidthConstraint setActive:YES];
    [_dPadHeightConstraint setActive:NO];
    _dPadHeightConstraint.constant = size;
    [_dPadHeightConstraint setActive:YES];
}

@end
