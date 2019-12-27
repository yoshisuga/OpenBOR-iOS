//
//  VirtualControlsView.h
//  OpenBOR
//
//  Created by Yoshi Sugawara on 12/7/19.
//

#import <UIKit/UIKit.h>
#import "DPadView.h"

NS_ASSUME_NONNULL_BEGIN

@interface VirtualControlsView : UIView
@property(nonatomic,readonly) DPadView *dPadView;
@end

NS_ASSUME_NONNULL_END
