#import <UIKit/UIKit.h>

/*
 * 规避QQ签名检测（通用方法）
 */
%hook QQAddressBookAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    %orig;
    NSDictionary *dic = [[NSBundle mainBundle]infoDictionary];
    [dic setValue:@"com.tencent.mqq" forKey:@"CFBundleIdentifier"];
    
    return YES;
}
%end

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

%hook UIButtonForAVControlBar
- (id)initWithButtonInfo:(NSDictionary*)dict{
    NSLog(@"初始化Button..");
    if([[dict valueForKey:@"id"] isEqual:@(106)]){
        NSMutableDictionary *mutableItem = [NSMutableDictionary dictionaryWithDictionary:dict];
        answear_flag = 1;
        dict = mutableItem;
    }
    if([[dict valueForKey:@"id"] isEqual:@(102)]){
        camera_flag = 1;
    }
    buttonBar = self;
    return %orig;
}
- (void)setAccessibilityLabel:(id)arg1{
    //NSLog(@"setAccessibilityLabel------------------------>");
    if(camera_flag == 1 && answear_flag == 1){
        if(arg1 == @"打开摄像头"){
            [controlBar AVControlbuttonPressed:self];
            camera_flag = 2;
            exit_flag = 0;
            %orig;
            return;
        }else{
            %orig;
            return;
        }
    }else if(answear_flag == 1 && camera_flag == 0){
        [controlBar AVControlbuttonPressed:self];
        answear_flag = 0;
        camera_flag = 0;
    }
    %orig;
}
%end

%hook QQAVChatControlBar
- (id)initWithFrame:(struct CGRect)arg1 isNeedTofit4s:(_Bool)arg2{
    controlBar = self;
    return %orig;
}
%end

/*
 * Hook结束通话
 */
%hook QQAVShowPanelRestruct
- (void)dealloc{
    answear_flag = 0;
    camera_flag = 0;
    %orig;
}
%end
