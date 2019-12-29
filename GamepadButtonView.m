//
//  GamepadButtonView.m
//  OpenBOR
//
//  Created by Yoshi Sugawara on 12/27/19.
//

#import "GamepadButtonView.h"

@interface GamepadButtonView()
@property(strong,nonatomic) UIImageView *imageView;
@property(strong,nonatomic) UILabel *buttonName;
@end

@implementation GamepadButtonView

-(instancetype)initWithIdentifier:(e_key_id)identifier {
    self = [self initWithFrame:CGRectZero];
    self.identifier = identifier;
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self commonInit];
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    [self commonInit];
    return self;
}

-(void)commonInit {
    self.translatesAutoresizingMaskIntoConstraints = NO;
//    self.backgroundColor = UIColor.blackColor;
    self.alpha = 0.5f;
//    self.layer.borderColor = UIColor.blueColor.CGColor;
//    self.layer.borderWidth = 2.0;
    self.clipsToBounds = NO;
    [self setUserInteractionEnabled:YES];
    [[self.widthAnchor constraintEqualToConstant:50.0] setActive:YES];
    [[self.widthAnchor constraintEqualToAnchor:self.heightAnchor] setActive:YES];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.imageView];
    [self.imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [self.imageView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
    [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [self.imageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    self.imageView.image = [UIImage imageNamed:@"button"];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.delegate gamepadButtonPressed:self];
    self.imageView.image = [UIImage imageNamed:@"button-pressed"];
}

-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.delegate gamepadButtonPressed:self];
    self.imageView.image = [UIImage imageNamed:@"button-pressed"];
}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.delegate gamepadButtonReleased:self];
    self.imageView.image = [UIImage imageNamed:@"button"];
}


@end
