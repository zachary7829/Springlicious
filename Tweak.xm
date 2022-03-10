#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Cephei/HBPreferences.h>

HBPreferences *preferences;

%hook SBDockView
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

%hook BCBatteryDevice //change to hooking the uiview, hooking bcbatterydevice while more affective can potentially be dangerous
-(bool)isCharging {
    if ([preferences boolForKey:@"isEnableHideBatteryCharge"]) {
        return 0;
    } else {
        return %orig;
    }
}
-(long long)percentCharge {
    if ([preferences boolForKey:@"isSpoofBatteryPercent"]) {
        return 69; //For faking device percentage, finish later
    } else {
        return %orig;
    }
}
%end

%hook SBSystemStatusWifiDataProvider //I should probably hook the view instead
-(bool)isWifiActive {
    if ([preferences boolForKey:@"isEnableHideWifiConnection"]) {
        return 0;
    } else {
        return %orig;
    }
}
%end

%hook SBFloatyFolderView
-(void)setBackgroundAlpha:(double)arg1{
    CGFloat setFolderBGTransparency = [preferences floatForKey:@"folderBackgroundTransparency"];
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

/*
%hook SBIconListGridLayoutConfiguration //iOS13&14, custom folder rows/columns
-(NSUInteger)numberOfPortraitRows{
    if ([preferences boolForKey:@"isEnableFiveIconRow"]) {
        return @5;
    } else {
        return %orig;
    }
}
-(NSUInteger)numberOfPortraitColumns{
    if ([preferences boolForKey:@"isEnableFiveIconColumn"]) {
        return @5;
    } else {
        return %orig;
    }
}
%end
*/

%hook SBFDeviceBlockTimer //thanks to nyuszika7h for this
- (NSString *)subtitleText {
    return @"suck my cock"; //change iPhone disable text on lockscreen
}
%end

%ctor {
  preferences = [[HBPreferences alloc] initWithIdentifier:@"com.zachary7829.springliciousprefs"];
}