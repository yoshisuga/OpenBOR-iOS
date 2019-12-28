//
//  GamepadButtonView.m
//  OpenBOR
//
//  Created by Yoshi Sugawara on 12/27/19.
//

#import "GamepadButtonView.h"

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
    self.backgroundColor = UIColor.blackColor;
    self.alpha = 0.5f;
    self.layer.borderColor = UIColor.blueColor.CGColor;
    self.layer.borderWidth = 2.0;
    self.clipsToBounds = NO;
    [self setUserInteractionEnabled:YES];
    [[self.widthAnchor constraintEqualToConstant:40.0] setActive:YES];
    [[self.widthAnchor constraintEqualToAnchor:self.heightAnchor] setActive:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.delegate gamepadButtonPressed:self];
}

-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.delegate gamepadButtonPressed:self];
}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.delegate gamepadButtonReleased:self];
}


@end
