// Copyright (c) 2013, Mirego
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// - Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
// - Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
// - Neither the name of the Mirego nor the names of its contributors may
//   be used to endorse or promote products derived from this software without
//   specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

#import <UIKit/UIKit.h>
#import "MCUIViewLayoutPosition.h"


@interface UIView (MCLayout)

// View positioning
- (void)mc_setPosition:(MCViewPosition)position;
- (void)mc_setPosition:(MCViewPosition)position withMargins:(UIEdgeInsets)margins;
- (void)mc_setPosition:(MCViewPosition)position withMargins:(UIEdgeInsets)margins size:(CGSize) size;

- (void)mc_setPosition:(MCViewPosition)position inView:(UIView *)view;
- (void)mc_setPosition:(MCViewPosition)position inView:(UIView *)view withMargins:(UIEdgeInsets)margins;
- (void)mc_setPosition:(MCViewPosition)position inView:(UIView *)view withMargins:(UIEdgeInsets)margins size:(CGSize) size;

- (void)mc_setRelativePosition:(MCViewRelativePosition)position toView:(UIView *)view withMargins:(UIEdgeInsets)margins;
- (void)mc_setRelativePosition:(MCViewRelativePosition)position toView:(UIView *)view withMargins:(UIEdgeInsets)margins size:(CGSize) size;

// Shortcuts to get and set frames properties
- (CGFloat)mc_width;
- (void)mc_setWidth:(CGFloat)width;

- (CGFloat)mc_height;
- (void)mc_setHeight:(CGFloat)height;

- (CGFloat)mc_bottomPosition;

- (CGSize)mc_size;
- (void)mc_setSize:(CGSize)size;

- (CGPoint)mc_origin;
- (void)mc_setOrigin:(CGPoint)point;

- (CGFloat)mc_xPosition;
- (CGFloat)mc_yPosition;

- (CGFloat)mc_baselinePosition;
- (CGFloat)mc_rightMostPosition;

// Subview shorcuts
- (void)mc_removeSubviews;
- (void)mc_bringToFront;
- (void)mc_sendToBack;

// Filling space under a sibling
- (void)mc_fillBelowView:(UIView*)view;
- (void)mc_fillBelowView:(UIView *)view withSpacing:(CGFloat)spacing;

// Positioning on one axis at a time.
- (void)mc_centerAtX;
- (void)mc_centerAtXQuarter;
- (void)mc_centerAtX3Quarter;
- (void)mc_centerX:(UIView*)view;
- (void)mc_centerX:(UIView *)view withOffset:(CGFloat)offset;
- (void)mc_centerY:(UIView*)view;
- (void)mc_centerY:(UIView *)view withOffset:(CGFloat)offset;
- (void)mc_centerInView:(UIView*)view;

@end

@interface UIView (MCLayout_deprecated)

- (void)mc_centerInSuperView DEPRECATED_ATTRIBUTE;
- (void)mc_aestheticCenterInSuperView DEPRECATED_ATTRIBUTE;

// These should never be used, absolute positioning does not support multiple screen sizes
- (void)mc_positionAtX:(double)xValue DEPRECATED_ATTRIBUTE;
- (void)mc_positionAtY:(double)yValue DEPRECATED_ATTRIBUTE;
- (void)mc_positionAtX:(double)xValue andY:(double)yValue DEPRECATED_ATTRIBUTE;
- (void)mc_positionAtX:(double)xValue andY:(double)yValue withWidth:(double)width DEPRECATED_ATTRIBUTE;
- (void)mc_positionAtX:(double)xValue andY:(double)yValue withHeight:(double)height DEPRECATED_ATTRIBUTE;
- (void)mc_positionAtX:(double)xValue withHeight:(double)height DEPRECATED_ATTRIBUTE;

- (void)mc_positionRightOfSuperViewWithSpacing:(CGFloat)spacing DEPRECATED_ATTRIBUTE;
- (void)mc_positionLeftOfSuperViewWithSpacing:(CGFloat)spacing DEPRECATED_ATTRIBUTE;
- (void)mc_positionTopOfSuperViewWithSpacing:(CGFloat)spacing DEPRECATED_ATTRIBUTE;
- (void)mc_positionBottomOfSuperViewWithSpacing:(CGFloat)spacing DEPRECATED_ATTRIBUTE;

- (void)mc_alignRightOfSuperView DEPRECATED_ATTRIBUTE;
- (void)mc_alignRightOfSuperViewWithOffset:(CGFloat)offset DEPRECATED_ATTRIBUTE;
- (void)mc_alignLeftOfSuperView DEPRECATED_ATTRIBUTE;
- (void)mc_alignLeftOfSuperViewWithOffset:(CGFloat)offset DEPRECATED_ATTRIBUTE;
- (void)mc_alignTopOfSuperView DEPRECATED_ATTRIBUTE;
- (void)mc_alignTopOfSuperViewWithOffset:(CGFloat)offset DEPRECATED_ATTRIBUTE;
- (void)mc_alignBottomOfSuperView DEPRECATED_ATTRIBUTE;
- (void)mc_alignBottomOfSuperViewWithOffset:(CGFloat)offset DEPRECATED_ATTRIBUTE;

- (void)mc_positionAbove:(UIView*)view DEPRECATED_ATTRIBUTE;
- (void)mc_positionAbove:(UIView *)view withSpacing:(CGFloat)spacing DEPRECATED_ATTRIBUTE;
- (void)mc_positionBelow:(UIView*)view DEPRECATED_ATTRIBUTE;
- (void)mc_positionBelow:(UIView *)view withSpacing:(CGFloat)spacing DEPRECATED_ATTRIBUTE;
- (void)mc_positionLeft:(UIView*)view DEPRECATED_ATTRIBUTE;
- (void)mc_positionLeft:(UIView *)view withSpacing:(CGFloat)spacing DEPRECATED_ATTRIBUTE;
- (void)mc_positionRight:(UIView*)view DEPRECATED_ATTRIBUTE;
- (void)mc_positionRight:(UIView *)view withSpacing:(CGFloat)spacing DEPRECATED_ATTRIBUTE;

- (void)mc_alignTop:(UIView*)view DEPRECATED_ATTRIBUTE;
- (void)mc_alignTop:(UIView *)view withOffset:(CGFloat)offset DEPRECATED_ATTRIBUTE;
- (void)mc_alignBottom:(UIView*)view DEPRECATED_ATTRIBUTE;
- (void)mc_alignBottom:(UIView *)view withOffset:(CGFloat)offset DEPRECATED_ATTRIBUTE;
- (void)mc_alignLeft:(UIView*)view DEPRECATED_ATTRIBUTE;
- (void)mc_alignLeft:(UIView *)view withOffset:(CGFloat)offset DEPRECATED_ATTRIBUTE;
- (void)mc_alignRight:(UIView*)view DEPRECATED_ATTRIBUTE;
- (void)mc_alignRight:(UIView *)view withOffset:(CGFloat)offset DEPRECATED_ATTRIBUTE;

@end