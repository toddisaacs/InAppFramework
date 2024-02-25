//
//  InAppMessageFrameworkUITestsLaunchTests.m
//  InAppMessageFrameworkUITests
//
//  Created by Todd Isaacs on 2/25/24.
//

#import <XCTest/XCTest.h>

@interface InAppMessageFrameworkUITestsLaunchTests : XCTestCase

@end

@implementation InAppMessageFrameworkUITestsLaunchTests

+ (BOOL)runsForEachTargetApplicationUIConfiguration {
    return YES;
}

- (void)setUp {
    self.continueAfterFailure = NO;
}

- (void)testLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Insert steps here to perform after app launch but before taking a screenshot,
    // such as logging into a test account or navigating somewhere in the app

    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
    attachment.name = @"Launch Screen";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

@end
