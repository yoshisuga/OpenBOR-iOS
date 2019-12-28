//
//  DPadView.m
//  OpenBOR
//
//  Created by Yoshi Sugawara on 12/7/19.
//

#import "DPadView.h"

@interface DPadView()
@property(nonatomic) DPadDirection currentDirection;
@end

@implementation DPadView

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
    self.layer.borderColor = UIColor.redColor.CGColor;
    self.layer.borderWidth = 2.0;
    self.clipsToBounds = NO;
    [self setUserInteractionEnabled:YES];
}

-(DPadDirection)directionForPoint:(CGPoint)point {
    CGFloat x = point.x;
    CGFloat y = point.y;
    if ( x <= 0 || x >= self.bounds.size.width || y <= 0 || y >= self.bounds.size.height) {
        return kNone;
    }
    NSInteger column = (NSInteger) x / (self.bounds.size.width / 3);
    NSInteger row = (NSInteger) y / (self.bounds.size.height / 3);
    DPadDirection direction = (row * 3) + column;
//    NSLog(@"dpaddirection = %lu",(unsigned long)direction);
    return direction;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[touches allObjects] firstObject];
    CGPoint point = [touch locationInView:self];
    DPadDirection direction = [self directionForPoint:point];
    if ( direction != self.currentDirection ) {
        self.currentDirection = direction;
        [self.delegate dPad:self didPress:self.currentDirection];
    }
}

-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[touches allObjects] firstObject];
    CGPoint point = [touch locationInView:self];
    DPadDirection direction = [self directionForPoint:point];
    if ( direction != self.currentDirection ) {
        self.currentDirection = direction;
        [self.delegate dPad:self didPress:self.currentDirection];
    }
}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.currentDirection = kNone;
    [self.delegate dPadDidRelease:self];
}

@end
