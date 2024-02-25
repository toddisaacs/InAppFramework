//
//  InAppFrameworkConstants.h
//  InAppMessageFramework
//
//  Created by Todd Isaacs on 2/25/24.
//

#ifndef InAppFrameworkConstants_h
#define InAppFrameworkConstants_h

//Supported presntation Style used by custom message to setup view container
typedef NS_ENUM(NSUInteger, InAppPresentationStyle) {
    InAppPresentationStyleFullScreen,
    InAppPresentationStyleModal,
    InAppPresentationStyleBanner
};

//All delivered types of messages
typedef NS_ENUM(NSUInteger, InAppMessageType) {
    InAppMessageTypeFullscreen,
    InAppMessageTypeModal,
    InAppMessageTypeBanner,
    InAppMessageTypeCustom
};


typedef NS_ENUM(NSInteger, InAppMessageEvent) {
    InAppMessageEventAppLoad,
    InAppMessageEventCustom
};


#endif /* InAppFrameworkConstants_h */
