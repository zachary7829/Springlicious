#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Cephei/HBPreferences.h>

HBPreferences *preferences;

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
    if ([[preferences objectForKey:@"color_pref"]isEqual:@"Red"]) {
            view.backgroundColor = [UIColor redColor];    
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
    if ([[preferences objectForKey:@"color_pref"]isEqual:@"Red"]) {
            view.backgroundColor = [UIColor redColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Yellow"]) {
            view.backgroundColor = [UIColor yellowColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Brown"]) {
            view.backgroundColor = [UIColor brownColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Clear"]) {
            view.backgroundColor = [UIColor clearColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Gray"]) {
            view.backgroundColor = [UIColor grayColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Green"]) {
            view.backgroundColor = [UIColor greenColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Dark Gray"]) {
            view.backgroundColor = [UIColor darkGrayColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Light Gray"]) {
            view.backgroundColor = [UIColor lightGrayColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"White"]) {
            view.backgroundColor = [UIColor whiteColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Blue"]) {
            view.backgroundColor = [UIColor blueColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Magenta"]) {
            view.backgroundColor = [UIColor magentaColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Orange"]) {
            view.backgroundColor = [UIColor orangeColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Cyan"]) {
            view.backgroundColor = [UIColor cyanColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Purple"]) {
            view.backgroundColor = [UIColor purpleColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Light Text Color"]) {
            view.backgroundColor = [UIColor lightTextColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Black"]) {
            view.backgroundColor = [UIColor blackColor];
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
    if ([[preferences objectForKey:@"color_pref"]isEqual:@"Red"]) {
            view.backgroundColor = [UIColor redColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Yellow"]) {
            view.backgroundColor = [UIColor yellowColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Brown"]) {
            view.backgroundColor = [UIColor brownColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Clear"]) {
            view.backgroundColor = [UIColor clearColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Gray"]) {
            view.backgroundColor = [UIColor grayColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Green"]) {
            view.backgroundColor = [UIColor greenColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Dark Gray"]) {
            view.backgroundColor = [UIColor darkGrayColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Light Gray"]) {
            view.backgroundColor = [UIColor lightGrayColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"White"]) {
            view.backgroundColor = [UIColor whiteColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Blue"]) {
            view.backgroundColor = [UIColor blueColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Magenta"]) {
            view.backgroundColor = [UIColor magentaColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Orange"]) {
            view.backgroundColor = [UIColor orangeColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Cyan"]) {
            view.backgroundColor = [UIColor cyanColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Purple"]) {
            view.backgroundColor = [UIColor purpleColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Light Text Color"]) {
            view.backgroundColor = [UIColor lightTextColor];
    } else if ([[preferences objectForKey:@"color_pref"]isEqual:@"Black"]) {
            view.backgroundColor = [UIColor blackColor];
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
    if ([preferences boolForKey:@"isEnableHideBatteryCharge"]) {
        %orig(0);
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

%hook SBFolderIconImageView
-(void)setBackgroundView:(UIView *)arg1 {
    if ([preferences boolForKey:@"isEnableHideFolderIconBackground"]) {
        %orig(nil); //this seems to work also but seems to fuck up the animation lol, will fix latr
    } else {
        %orig;
    }
}
%end

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
- (void)setLabelHidden:(BOOL)arg1 {
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
        return %orig;
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

%ctor {
  preferences = [[HBPreferences alloc] initWithIdentifier:@"com.zachary7829.springliciousprefs"];
}