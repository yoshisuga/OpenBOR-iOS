//
//  TouchPadControlsViewController.m
//  OpenBOR
//
//  Created by Yoshi Sugawara on 12/7/19.
//

#import "TouchPadControlsViewController.h"
#import "VirtualControlsView.h"

#include "ios-glue.h"

@interface TouchPadControlsViewController ()<DPadDelegate>
@property(nonatomic,strong) VirtualControlsView *virtualControlsView;
@end

@implementation TouchPadControlsViewController

-(VirtualControlsView*)virtualControlsView {
    if (_virtualControlsView == nil) {
        _virtualControlsView = [[VirtualControlsView alloc] init];
    }
    return _virtualControlsView;
}

-(void)loadView {
    self.view = [self virtualControlsView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self virtualControlsView].dPadView.delegate = self;
}

#pragma mark - DPadDelegate

- (void)dPad:(nonnull DPadView *)dpad didPress:(DPadDirection)direction {
    NSLog(@"did press with direction: %lu",(unsigned long)direction);
    switch (direction) {
        case kUp:
            ios_touchstates[SDID_MOVEUP] = 1;
            break;
        case kUpLeft:
            ios_touchstates[SDID_MOVEUP] = 1;
            ios_touchstates[SDID_MOVELEFT] = 1;
            break;
        case kUpRight:
            ios_touchstates[SDID_MOVEUP] = 1;
            ios_touchstates[SDID_MOVERIGHT] = 1;
            break;
        case kLeft:
            ios_touchstates[SDID_MOVELEFT] = 1;
            break;
        case kNone:
            ios_touchstates[SDID_MOVEUP] = 0;
            ios_touchstates[SDID_MOVELEFT] = 0;
            ios_touchstates[SDID_MOVERIGHT] = 0;
            ios_touchstates[SDID_MOVEDOWN] = 0;
            break;
        case kRight:
            ios_touchstates[SDID_MOVERIGHT] = 1;
            break;
        case kDownLeft:
            ios_touchstates[SDID_MOVELEFT] = 1;
            ios_touchstates[SDID_MOVEDOWN] = 1;
            break;
        case kDown:
            ios_touchstates[SDID_MOVEDOWN] = 1;
            break;
        case kDownRight:
            ios_touchstates[SDID_MOVEDOWN] = 1;
            ios_touchstates[SDID_MOVERIGHT] = 1;
            break;
        default:
            ios_touchstates[SDID_MOVEUP] = 0;
            ios_touchstates[SDID_MOVELEFT] = 0;
            ios_touchstates[SDID_MOVERIGHT] = 0;
            ios_touchstates[SDID_MOVEDOWN] = 0;
            
            break;
    }
}

- (void)dPadDidRelease:(nonnull DPadView *)dpad {
    NSLog(@"did release pad!");
    ios_touchstates[SDID_MOVEUP] = 0;
    ios_touchstates[SDID_MOVELEFT] = 0;
    ios_touchstates[SDID_MOVERIGHT] = 0;
    ios_touchstates[SDID_MOVEDOWN] = 0;
}

@end
