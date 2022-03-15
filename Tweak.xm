#import <UIKit/UIKit.h>

NSUserDefaults *preferences;

@interface SBDockView : UIView
@end

@interface SBFloatingDockView : UIView
@end

@interface SBFloatingDockPlatterView : UIView
@end

@interface _UIStatusBar : UIView
@end

@interface _UIStatusBarWifiSignalView : UIView
@end

@interface _UIStatusBarImageView : UIView
@end

@interface SBFolderTitleTextField : UIView
@end

@interface SBIconCloudLabelAccessoryView : UIView
@end

@interface SBIconBetaLabelAccessoryView : UIView
@end

@interface SBFolderControllerBackgroundView : UIView
@end

@interface SBIconBadgeView : UIView
@end

@interface SBIconListView : UIView
@end

@interface NCNotificationListView : UIView
@end

@interface SBFLockScreenDateView : UIView
@end

@interface SBControlCenterWindow : UIView
@end

@interface _UIBatteryView : UIView
@property (assign,nonatomic) double bodyColorAlpha;
@property (assign,nonatomic) double pinColorAlpha;
@property (nonatomic, copy, readwrite) UIColor *fillColor;
-(void)setBodyColor:(UIColor *)arg1;
-(void)setPinColor:(UIColor *)arg1;
-(void)setFillColor:(UIColor *)arg1;
@end

%hook SBDockView
-(CGRect)frame {
	CGRect ret = %orig;
	CGFloat setDockTransparency = [preferences floatForKey:@"dockTransparency"];
	if (!(setDockTransparency >= 1)){
		setDockTransparency = 100;
	}
	self.alpha = setDockTransparency / 100;
	return ret;
}
-(void)setBackgroundAlpha:(double)arg1{
    if ([preferences boolForKey:@"isEnableHideDockBackground"]) {
        %orig(0.0);
    } else {
        %orig;
    }
}
-(void)setHidden:(BOOL)arg1 {
    if ([preferences boolForKey:@"isEnableHideDock"]) {
        %orig(YES);
    } else {
        %orig;
    }
}
-(BOOL)hidden {
    if ([preferences boolForKey:@"isEnableHideDock"]) {
        return YES;
    } else {
        return %orig;
    }
}
-(void)setBackgroundView:(UIView *)view {
    SEL colorSelector = NSSelectorFromString([preferences stringForKey:@"color_pref"]);
    if (colorSelector && [UIColor respondsToSelector:colorSelector]) {
        view.backgroundColor = ((UIColor*(*)(Class, SEL)) objc_msgSend) (UIColor.class, colorSelector);
    }
    %orig;
}
%end

%hook SBFloatingDockView
-(CGRect)frame {
	CGRect ret = %orig;
	CGFloat setDockTransparency = [preferences floatForKey:@"dockTransparency"];
	if (!(setDockTransparency >= 1)){
		setDockTransparency = 100;
	}
	self.alpha = setDockTransparency / 100;
	return ret;
}
-(void)setHidden:(BOOL)arg1 {
    if ([preferences boolForKey:@"isEnableHideDock"]) {
        %orig(YES);
    } else {
        %orig;
    }
}
-(BOOL)hidden {
    if ([preferences boolForKey:@"isEnableHideDock"]) {
        return YES;
    } else {
        return %orig;
    }
}
-(void)setBackgroundView:(UIView *)view {
    SEL colorSelector = NSSelectorFromString([preferences stringForKey:@"color_pref"]);

    if (colorSelector && [UIColor respondsToSelector:colorSelector]) {
        view.backgroundColor = ((UIColor*(*)(Class, SEL)) objc_msgSend) (UIColor.class, colorSelector);
    }
    %orig;
}
%end

%hook SBFloatingDockPlatterView
-(void)setHidden:(BOOL)arg1 {
    if ([preferences boolForKey:@"isEnableHideDock"]) {
        %orig(YES);
    } else {
        %orig;
    }
}
-(BOOL)hidden {
    if ([preferences boolForKey:@"isEnableHideDock"]) {
        return YES;
    } else {
        return %orig;
    }
}
-(void)setBackgroundView:(UIView *)view {
    //YandereDev code time, what's a switch case anyway?
    SEL colorSelector = NSSelectorFromString([preferences stringForKey:@"color_pref"]);

    if (colorSelector && [UIColor respondsToSelector:colorSelector]) {
        view.backgroundColor = ((UIColor*(*)(Class, SEL)) objc_msgSend) (UIColor.class, colorSelector);
    }
    %orig;
}
%end

%hook SBVolumeHUDViewController
-(void)viewDidLoad {
    if ([preferences boolForKey:@"isEnableHideVolume"]) {

    } else {
        return %orig;
    }
}
%end

%hook SBIconListPageControl
-(void)setHidden:(BOOL)arg1 {
    if ([preferences boolForKey:@"isEnableHidePageDots"]) {
        %orig(YES);
    } else {
        %orig;
    }
}
%end

%hook SBTelephonyManager
-(bool)isUsingVPNConnection {
    if ([preferences boolForKey:@"isEnableHideVPN"]) {
        return 0;
    } else {
        return %orig;
    }
}
%end

%hook _UIBatteryView
-(void)setShowsInlineChargingIndicator:(BOOL)enabled {
    SEL colorBattOutlineSelector = NSSelectorFromString([preferences stringForKey:@"battery_outline_color_pref"]);
    if ([preferences boolForKey:@"isEnableHideBatteryCharge"]) {
        if (colorBattOutlineSelector && [UIColor respondsToSelector:colorBattOutlineSelector]) {
            [self setBodyColor:((UIColor*(*)(Class, SEL)) objc_msgSend) (UIColor.class, colorBattOutlineSelector)];
            [self setPinColor:((UIColor*(*)(Class, SEL)) objc_msgSend) (UIColor.class, colorBattOutlineSelector)];
        }
        %orig(0);
    } else {
        if (colorBattOutlineSelector && [UIColor respondsToSelector:colorBattOutlineSelector]) {
            [self setBodyColor:((UIColor*(*)(Class, SEL)) objc_msgSend) (UIColor.class, colorBattOutlineSelector)];
            [self setPinColor:((UIColor*(*)(Class, SEL)) objc_msgSend) (UIColor.class, colorBattOutlineSelector)];
        }
        %orig;
    }
}
-(void)setFillColor:(UIColor*)arg0 {
    SEL colorBattFillSelector = NSSelectorFromString([preferences stringForKey:@"battery_fill_color_pref"]);

    if (colorBattFillSelector && [UIColor respondsToSelector:colorBattFillSelector]) {
        %orig(((UIColor*(*)(Class, SEL)) objc_msgSend) (UIColor.class, colorBattFillSelector));
    } else {
        %orig;
    }
}
-(void)setShowsPercentage:(bool)arg1 {
    if ([preferences boolForKey:@"isEnableBatteryPercentInBatt"]) {
        %orig(YES);
    } else {
        %orig;
    }
}
%end

%hook BCBatteryDevice //change to hooking the uiview, hooking bcbatterydevice while more affective can potentially fuck up battery stats in settings
-(long long)percentCharge {
    if ([preferences boolForKey:@"isSpoofBatteryPercent"]) {
	CGFloat setSpoofBatteryPercent = [preferences floatForKey:@"spoofBattery"];
	if (!(setSpoofBatteryPercent >= 3)){
		setSpoofBatteryPercent = 100;
	}
        return setSpoofBatteryPercent; //For faking device percentage, finish later
    } else {
        return %orig;
    }
}
%end

%hook _UIStatusBarWifiSignalView
-(CGRect)frame {
    if ([preferences boolForKey:@"isEnableHideWifiConnection"]) {
        CGRect ret = %orig;
        self.hidden = YES;
        return ret;
    } else {
	return %orig;
    }
}
%end

%hook SBFloatyFolderView
-(void)setBackgroundAlpha:(double)arg1{
	CGFloat setFolderBGTransparency = [preferences floatForKey:@"folderBackgroundTransparency"];
	if (!(setFolderBGTransparency >= 1)){
		setFolderBGTransparency = 100;
	}
	%orig(setFolderBGTransparency / 100);
}
%end

// SBWallpaperEffectView  hide folder icon background

%hook DNDNotificationsService
-(void)_queue_postOrRemoveNotificationWithUpdatedBehavior:(BOOL)arg1 significantTimeChange:(BOOL)arg2{
    if ([preferences boolForKey:@"isEnableHideDNDBanner"]) {

    } else {
        %orig;
    }
}
%end

%hook SBIconListGridLayoutConfiguration //iOS13&14, custom folder rows/columns
-(NSUInteger)numberOfPortraitRows{
    if ([[preferences objectForKey:@"folder_row_pref"]isEqual:@"4"]) {
            return 4;
    } else if ([[preferences objectForKey:@"folder_row_pref"]isEqual:@"5"]) {
            return 5;
    } else if ([[preferences objectForKey:@"folder_row_pref"]isEqual:@"6"]) {
            return 6;
    } else {
            return %orig;
    }
}
-(NSUInteger)numberOfPortraitColumns{
    if ([[preferences objectForKey:@"folder_column_pref"]isEqual:@"4"]) {
            return 4;
    } else if ([[preferences objectForKey:@"folder_column_pref"]isEqual:@"5"]) {
            return 5;
    } else if ([[preferences objectForKey:@"folder_column_pref"]isEqual:@"6"]) {
            return 6;
    } else {
            return %orig;
    }
}
%end

%hook SBIconView
-(void)setLabelHidden:(BOOL)arg1 {
    if ([preferences boolForKey:@"isEnableHideAppLabels"]) {
        %orig(YES);
    } else {
        %orig;
    }
}
%end

%hook _UIStatusBar
-(CGRect)frame {
    if ([preferences boolForKey:@"isEnableHideStatusBar"]) {
        CGRect ret = %orig;
        self.hidden = YES;
        return ret;
    } else {
	CGRect ret = %orig;
	CGFloat setStatusBarTransparency = [preferences floatForKey:@"statusBarTransparency"];
	if (!(setStatusBarTransparency >= 1)){
		setStatusBarTransparency = 100;
	}
	self.alpha = setStatusBarTransparency / 100;
	return ret;
    }
}
%end

%hook SBFolderTitleTextField
-(CGRect)frame {
    if ([preferences boolForKey:@"isEnableHideFolderTitle"]) {
        CGRect ret = %orig;
        self.hidden = YES;
        return ret;
    } else {
        return %orig;
    }
}
%end

%hook SBIconCloudLabelAccessoryView
-(CGRect)frame {
    if ([preferences boolForKey:@"isEnableHideOffloadIcon"]) {
        CGRect ret = %orig;
        self.hidden = YES;
        return ret;
    } else {
        return %orig;
    }
}
%end

%hook SBIconBetaLabelAccessoryView
-(CGRect)frame {
    if ([preferences boolForKey:@"isEnableHideTestflightAppDots"]) {
        CGRect ret = %orig;
        self.hidden = YES;
        return ret;
    } else {
        return %orig;
    }
}
%end

%hook SBIconBadgeView
-(CGRect)frame {
	CGRect ret = %orig;
	CGFloat setNotificationBadgeTransparency = [preferences floatForKey:@"notificationBadgeTransparency"];
	if (!(setNotificationBadgeTransparency >= 1)){
		setNotificationBadgeTransparency = 100;
	}
	self.alpha = setNotificationBadgeTransparency / 100;
	return ret;
}
%end

%hook SBIconListView
-(CGRect)frame {
	CGRect ret = %orig;
	CGFloat setIconTransparency = [preferences floatForKey:@"iconTransparency"];
	if (!(setIconTransparency >= 8)){
		setIconTransparency = 100;
	}
	self.alpha = setIconTransparency / 100;
	return ret;
}
%end

%hook NCNotificationListView //slightly buggy/flashy, may be fixed by hooking NCNotificationStructuredListViewController instead
-(CGRect)frame {
	CGRect ret = %orig;
	CGFloat setLockScreenNotificationsTransparency = [preferences floatForKey:@"lockScreenNotificationsTransparency"];
	if (!(setLockScreenNotificationsTransparency >= 1)){
		setLockScreenNotificationsTransparency = 100;
	}
	self.alpha = setLockScreenNotificationsTransparency / 100;
	return ret;
}
%end

%hook SBFLockScreenDateView
-(CGRect)frame {
	CGRect ret = %orig;
	CGFloat setLockScreenDateTransparency = [preferences floatForKey:@"lockScreenDateTransparency"];
	if (!(setLockScreenDateTransparency >= 1)){
		setLockScreenDateTransparency = 100;
	}
	self.alpha = setLockScreenDateTransparency / 100;
	return ret;
}
%end

%hook SBControlCenterWindow
-(CGRect)frame {
	CGRect ret = %orig;
	CGFloat setControlCenterTransparency = [preferences floatForKey:@"controlCenterTransparency"];
	if (!(setControlCenterTransparency >= 1)){
		setControlCenterTransparency = 100;
	}
	self.alpha = setControlCenterTransparency / 100;
	return ret;
}
%end

/*
%hook SBFDeviceBlockTimer //thanks to nyuszika7h for this, may be used latr
-(NSString *)subtitleText {
    return @"suck my cock";
}
%end
*/

%ctor {
  preferences = [[NSUserDefaults alloc] initWithSuiteName:@"com.zachary7829.springliciousprefs"];
}