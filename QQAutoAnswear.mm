#line 1 "/Users/dingjianxun/Desktop/QQ_autoAnswearTweak/monkeyAuto/QQAutoAnswear/QQAutoAnswear/QQAutoAnswear.xm"



#import <UIKit/UIKit.h>




#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class UIButtonForAVControlBar; @class QQAddressBookAppDelegate; @class QQAVChatControlBar; @class QQAVShowPanelRestruct; 
static BOOL (*_logos_orig$_ungrouped$QQAddressBookAppDelegate$application$didFinishLaunchingWithOptions$)(_LOGOS_SELF_TYPE_NORMAL QQAddressBookAppDelegate* _LOGOS_SELF_CONST, SEL, UIApplication *, NSDictionary *); static BOOL _logos_method$_ungrouped$QQAddressBookAppDelegate$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL QQAddressBookAppDelegate* _LOGOS_SELF_CONST, SEL, UIApplication *, NSDictionary *); static UIButtonForAVControlBar* (*_logos_orig$_ungrouped$UIButtonForAVControlBar$initWithButtonInfo$)(_LOGOS_SELF_TYPE_INIT UIButtonForAVControlBar*, SEL, NSDictionary*) _LOGOS_RETURN_RETAINED; static UIButtonForAVControlBar* _logos_method$_ungrouped$UIButtonForAVControlBar$initWithButtonInfo$(_LOGOS_SELF_TYPE_INIT UIButtonForAVControlBar*, SEL, NSDictionary*) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$UIButtonForAVControlBar$setAccessibilityLabel$)(_LOGOS_SELF_TYPE_NORMAL UIButtonForAVControlBar* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$UIButtonForAVControlBar$setAccessibilityLabel$(_LOGOS_SELF_TYPE_NORMAL UIButtonForAVControlBar* _LOGOS_SELF_CONST, SEL, id); static QQAVChatControlBar* (*_logos_orig$_ungrouped$QQAVChatControlBar$initWithFrame$isNeedTofit4s$)(_LOGOS_SELF_TYPE_INIT QQAVChatControlBar*, SEL, struct CGRect, _Bool) _LOGOS_RETURN_RETAINED; static QQAVChatControlBar* _logos_method$_ungrouped$QQAVChatControlBar$initWithFrame$isNeedTofit4s$(_LOGOS_SELF_TYPE_INIT QQAVChatControlBar*, SEL, struct CGRect, _Bool) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$QQAVShowPanelRestruct$dealloc)(_LOGOS_SELF_TYPE_NORMAL QQAVShowPanelRestruct* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$QQAVShowPanelRestruct$dealloc(_LOGOS_SELF_TYPE_NORMAL QQAVShowPanelRestruct* _LOGOS_SELF_CONST, SEL); 

#line 8 "/Users/dingjianxun/Desktop/QQ_autoAnswearTweak/monkeyAuto/QQAutoAnswear/QQAutoAnswear/QQAutoAnswear.xm"

static BOOL _logos_method$_ungrouped$QQAddressBookAppDelegate$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL QQAddressBookAppDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIApplication * application, NSDictionary * launchOptions) {
    
    
    _logos_orig$_ungrouped$QQAddressBookAppDelegate$application$didFinishLaunchingWithOptions$(self, _cmd, application, launchOptions);
    NSDictionary *dic = [[NSBundle mainBundle]infoDictionary];
    [dic setValue:@"com.tencent.mqq" forKey:@"CFBundleIdentifier"];
    
    return YES;
}

@interface QQAVChatControlBar
- (void)AVControlbuttonPressed:(id)arg1;
@end
QQAVChatControlBar* controlBar;
UIButtonForAVControlBar* buttonBar;
int answear_flag = 0;
int camera_flag = 0;
int exit_flag = 0;
@interface UIButtonForAVControlBar
- (id)initWithButtonInfo:(id)arg1;
- (int)getState;
- (void)setState:(int)arg1;
@property NSInteger tag;
@end

static UIButtonForAVControlBar* _logos_method$_ungrouped$UIButtonForAVControlBar$initWithButtonInfo$(_LOGOS_SELF_TYPE_INIT UIButtonForAVControlBar* __unused self, SEL __unused _cmd, NSDictionary* dict) _LOGOS_RETURN_RETAINED{
    NSLog(@"初始化Button..");
    if([[dict valueForKey:@"id"] isEqual:@(106)]){
        NSMutableDictionary *mutableItem = [NSMutableDictionary dictionaryWithDictionary:dict];
        NSLog(@"就不接听QQ电话...............");
        answear_flag = 1;
        dict = mutableItem;
    }
    NSLog(@"tag:%d....id:%@", [buttonBar tag], [dict valueForKey:@"id"]);
    if([[dict valueForKey:@"id"] isEqual:@(102)]){
        camera_flag = 1;
    }
    buttonBar = self;
    return _logos_orig$_ungrouped$UIButtonForAVControlBar$initWithButtonInfo$(self, _cmd, dict);
}

static void _logos_method$_ungrouped$UIButtonForAVControlBar$setAccessibilityLabel$(_LOGOS_SELF_TYPE_NORMAL UIButtonForAVControlBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
    
    if(camera_flag == 1 && answear_flag == 1){
        if(arg1 == @"打开摄像头"){
            [controlBar AVControlbuttonPressed:self];
            camera_flag = 2;
            exit_flag = 0;
            _logos_orig$_ungrouped$UIButtonForAVControlBar$setAccessibilityLabel$(self, _cmd, arg1);
            return;
        }else{
            _logos_orig$_ungrouped$UIButtonForAVControlBar$setAccessibilityLabel$(self, _cmd, arg1);
            return;
        }
    }else if(answear_flag == 1 && camera_flag == 0){
        [controlBar AVControlbuttonPressed:self];
        answear_flag = 0;
        camera_flag = 0;
    }
    _logos_orig$_ungrouped$UIButtonForAVControlBar$setAccessibilityLabel$(self, _cmd, arg1);
}


static QQAVChatControlBar* _logos_method$_ungrouped$QQAVChatControlBar$initWithFrame$isNeedTofit4s$(_LOGOS_SELF_TYPE_INIT QQAVChatControlBar* __unused self, SEL __unused _cmd, struct CGRect arg1, _Bool arg2) _LOGOS_RETURN_RETAINED{
    controlBar = self;
    return _logos_orig$_ungrouped$QQAVChatControlBar$initWithFrame$isNeedTofit4s$(self, _cmd, arg1, arg2);
}


static void _logos_method$_ungrouped$QQAVShowPanelRestruct$dealloc(_LOGOS_SELF_TYPE_NORMAL QQAVShowPanelRestruct* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    NSLog(@"delloc............≥≥≥≥..........≥≥≥≥≥≥≥≥≥≥........≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥");
    answear_flag = 0;
    camera_flag = 0;
    _logos_orig$_ungrouped$QQAVShowPanelRestruct$dealloc(self, _cmd);
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$QQAddressBookAppDelegate = objc_getClass("QQAddressBookAppDelegate"); MSHookMessageEx(_logos_class$_ungrouped$QQAddressBookAppDelegate, @selector(application:didFinishLaunchingWithOptions:), (IMP)&_logos_method$_ungrouped$QQAddressBookAppDelegate$application$didFinishLaunchingWithOptions$, (IMP*)&_logos_orig$_ungrouped$QQAddressBookAppDelegate$application$didFinishLaunchingWithOptions$);Class _logos_class$_ungrouped$UIButtonForAVControlBar = objc_getClass("UIButtonForAVControlBar"); MSHookMessageEx(_logos_class$_ungrouped$UIButtonForAVControlBar, @selector(initWithButtonInfo:), (IMP)&_logos_method$_ungrouped$UIButtonForAVControlBar$initWithButtonInfo$, (IMP*)&_logos_orig$_ungrouped$UIButtonForAVControlBar$initWithButtonInfo$);MSHookMessageEx(_logos_class$_ungrouped$UIButtonForAVControlBar, @selector(setAccessibilityLabel:), (IMP)&_logos_method$_ungrouped$UIButtonForAVControlBar$setAccessibilityLabel$, (IMP*)&_logos_orig$_ungrouped$UIButtonForAVControlBar$setAccessibilityLabel$);Class _logos_class$_ungrouped$QQAVChatControlBar = objc_getClass("QQAVChatControlBar"); MSHookMessageEx(_logos_class$_ungrouped$QQAVChatControlBar, @selector(initWithFrame:isNeedTofit4s:), (IMP)&_logos_method$_ungrouped$QQAVChatControlBar$initWithFrame$isNeedTofit4s$, (IMP*)&_logos_orig$_ungrouped$QQAVChatControlBar$initWithFrame$isNeedTofit4s$);Class _logos_class$_ungrouped$QQAVShowPanelRestruct = objc_getClass("QQAVShowPanelRestruct"); MSHookMessageEx(_logos_class$_ungrouped$QQAVShowPanelRestruct, sel_registerName("dealloc"), (IMP)&_logos_method$_ungrouped$QQAVShowPanelRestruct$dealloc, (IMP*)&_logos_orig$_ungrouped$QQAVShowPanelRestruct$dealloc);} }
#line 85 "/Users/dingjianxun/Desktop/QQ_autoAnswearTweak/monkeyAuto/QQAutoAnswear/QQAutoAnswear/QQAutoAnswear.xm"
