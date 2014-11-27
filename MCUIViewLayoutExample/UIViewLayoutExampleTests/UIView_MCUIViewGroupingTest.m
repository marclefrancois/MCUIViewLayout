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

#import "UIView_MCUIViewGroupingTest.h"
#import "MCUIViewLayoutPosition.h"
#import "MCUIViewGroupedLayoutPosition.h"


@implementation UIView_MCLayoutGroupLayoutPositionTest
- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testPositionTwoRectOneUnderAnotherInContainingRectAlignTopLeft {
    CGRect container = CGRectMake(0, 0, 100, 400);
    CGRect firstRect = CGRectMake(30, 30, 100, 40);
    CGRect secondRect = CGRectMake(40, 40, 100, 40);

    NSArray *alignedRects = [MCUIViewGroupedLayoutPosition mc_positionRects:@[[NSValue valueWithCGRect:firstRect], [NSValue valueWithCGRect:secondRect]] inRect:container direction:MCViewLayoutOrientationVertical position:MCViewPositionTopLeft spacing:0];
    STAssertEquals([alignedRects[0] CGRectValue], CGRectMake(0, 0, 100, 40), @"");
    STAssertEquals([alignedRects[1] CGRectValue], CGRectMake(0, 40, 100, 40), @"");
}

- (void)testPositionTwoRectOneUnderAnotherInContainingRectAlignTopLeftThatIsNotAtOriginZeroZero {
    CGRect container = CGRectMake(25, 25, 100, 400);
    CGRect firstRect = CGRectMake(30, 30, 100, 40);
    CGRect secondRect = CGRectMake(40, 40, 100, 40);

    NSArray *alignedRects = [MCUIViewGroupedLayoutPosition mc_positionRects:@[[NSValue valueWithCGRect:firstRect], [NSValue valueWithCGRect:secondRect]] inRect:container direction:MCViewLayoutOrientationVertical position:MCViewPositionTopLeft spacing:0];
    STAssertEquals([alignedRects[0] CGRectValue], CGRectMake(25, 25, 100, 40), @"");
    STAssertEquals([alignedRects[1] CGRectValue], CGRectMake(25, 65, 100, 40), @"");
}

- (void)testPositionTwoRectOneUnderAnotherInContainingRectAlignCenters {
    CGRect container = CGRectMake(25, 25, 200, 400);
    CGRect firstRect = CGRectMake(30, 30, 100, 50);
    CGRect secondRect = CGRectMake(40, 40, 100, 50);

    NSArray *alignedRects = [MCUIViewGroupedLayoutPosition mc_positionRects:@[[NSValue valueWithCGRect:firstRect], [NSValue valueWithCGRect:secondRect]] inRect:container direction:MCViewLayoutOrientationVertical position:MCViewPositionCenters spacing:0];
    STAssertEquals([alignedRects[0] CGRectValue], CGRectMake(75, 175, 100, 50), @"");
    STAssertEquals([alignedRects[1] CGRectValue], CGRectMake(75, 225, 100, 50), @"");
}

- (void)testPositionTwoRectLeftOtRightInContainingRectAlignCenters {
    CGRect container = CGRectMake(25, 25, 400, 400);
    CGRect firstRect = CGRectMake(30, 30, 100, 50);
    CGRect secondRect = CGRectMake(40, 40, 100, 50);

    NSArray *alignedRects = [MCUIViewGroupedLayoutPosition mc_positionRects:@[[NSValue valueWithCGRect:firstRect], [NSValue valueWithCGRect:secondRect]] inRect:container direction:MCViewLayoutOrientationHorizontal position:MCViewPositionCenters spacing:0];
    STAssertEquals([alignedRects[0] CGRectValue], CGRectMake(125, 200, 100, 50), @"");
    STAssertEquals([alignedRects[1] CGRectValue], CGRectMake(225, 200, 100, 50), @"");
}

- (void)testPositionTwoRectLeftOtRightInContainingRectAlignCentersWithSpacing {
    CGRect container = CGRectMake(0, 0, 400, 400);
    CGRect firstRect = CGRectMake(30, 30, 100, 50);
    CGRect secondRect = CGRectMake(40, 40, 100, 50);

    NSArray *alignedRects = [MCUIViewGroupedLayoutPosition mc_positionRects:@[[NSValue valueWithCGRect:firstRect], [NSValue valueWithCGRect:secondRect]] inRect:container direction:MCViewLayoutOrientationHorizontal position:MCViewPositionCenters spacing:10];
    STAssertEquals([alignedRects[0] CGRectValue], CGRectMake(95, 175, 100, 50), @"");
    STAssertEquals([alignedRects[1] CGRectValue], CGRectMake(205, 175, 100, 50), @"");
}

@end
