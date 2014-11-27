// Copyright (c) 2014, Mirego
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

#import "MCUIViewGroupedLayoutPosition.h"

@implementation MCUIViewGroupedLayoutPosition

+ (NSArray *)mc_positionRects:(NSArray *)rects inRect:(CGRect)containingRect direction:(MCViewLayoutOrientation)direction position:(MCViewPosition)groupPosition spacing:(CGFloat)space {

    NSMutableArray *positionedRects = [rects mutableCopy];
    NSUInteger size = [rects count];
    CGRect previousRect = CGRectInfinite;

    // align amongst them selves
    CGRect unionRect = CGRectZero;
    for (NSUInteger i = 0; i < size; i++){
        NSValue *rectValue = rects[i];
        CGRect rect = [rectValue CGRectValue];
        CGRect repositionedRect;

        if (CGRectIsInfinite(previousRect)) {
            if (direction == MCViewLayoutOrientationHorizontal) {
                repositionedRect = [MCUIViewLayoutPosition positionRect:rect atPosition:MCViewPositionLeft | MCViewPositionVerticalCenter inRect:containingRect withMargins:UIEdgeInsetsZero];
            }
            else {
                repositionedRect = [MCUIViewLayoutPosition positionRect:rect atPosition:MCViewPositionTop | MCViewPositionHorizontalCenter inRect:containingRect withMargins:UIEdgeInsetsZero];
            }
            unionRect = repositionedRect;
        } else {
            if (direction == MCViewLayoutOrientationHorizontal) {
                repositionedRect = [MCUIViewLayoutPosition positionRect:rect atPosition:MCViewPositionToTheRight | MCViewPositionVerticalCenter inRect:previousRect withMargins:UIEdgeInsetsMake(0, space, 0, 0)];
            }
            else {
                repositionedRect = [MCUIViewLayoutPosition positionRect:rect atPosition:MCViewPositionUnder | MCViewPositionHorizontalCenter inRect:previousRect withMargins:UIEdgeInsetsMake(space, 0, 0, 0)];
            }
            unionRect = CGRectUnion(unionRect, repositionedRect);
        }

        positionedRects[i] = [NSValue valueWithCGRect:repositionedRect];
        previousRect = repositionedRect;
    }

    // position containing rect
    CGRect repositionedUnion = [MCUIViewLayoutPosition positionRect:unionRect atPosition:groupPosition inRect:containingRect withMargins:UIEdgeInsetsZero];
    // Calculate movement
    CGFloat xMovement = repositionedUnion.origin.x - unionRect.origin.x;
    CGFloat yMovement = repositionedUnion.origin.y - unionRect.origin.y;

    // adjust each rect position
    for (NSUInteger i = 0; i < size; i++) {
        NSValue *rectValue = positionedRects[i];
        CGRect rectToAdjust = [rectValue CGRectValue];
        positionedRects[i] = [NSValue valueWithCGRect:CGRectOffset(rectToAdjust, xMovement, yMovement)];
    }

    return positionedRects;
}

@end