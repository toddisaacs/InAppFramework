//
//  InAppFrameworkConstants.h
//  InAppMessageFramework
//
//  Created by Todd Isaacs on 2/25/24.
//

#ifndef InAppFrameworkConstants_h
#define InAppFrameworkConstants_h

//Supported view types used with InApp.
typedef NS_ENUM(NSUInteger, InAppViewDisplayType) {
    FullScreen,
    Modal,
    Banner
};

//All delivered types of messages
typedef NS_ENUM(NSUInteger, InAppMessageType) {
    FullscreenTemplate,
    ModalTemplate,
    BannerTemplate,
    Custom
};


typedef NS_ENUM(NSInteger, InAppMessageEvent) {
    InAppEvent_AppLoad,
    InAppEvent_Custom
};


#endif /* InAppFrameworkConstants_h */
