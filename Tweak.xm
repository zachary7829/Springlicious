#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Cephei/HBPreferences.h>

HBPreferences *preferences;

%hook SBIconListModel
%property (nonatomic, strong) NSString *_springliciousLocation;

typedef struct SBIconCoordinate {
    NSInteger row;
    NSInteger col;
} SBIconCoordinate

@interface SBIconListView : UIView
- (SBIcon *)iconAtCoordinate:(SBIconCoordinate)co metrics:(id)metrics;
- (SBIconCoordinate)coordinateForIcon:(id)icon;
- (CGPoint)originForIconAtCoordinate:(SBIconCoordinate)co metrics:(id)metrics;
@end

%hook SBDockView
-(void)setBackgroundAlpha:(double)arg1{
    if ([preferences boolForKey:@"isEnableHideDock"]) {
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
%end

%hook SBFloatingDockView
-(void)setBackgroundAlpha:(double)arg1{
    if ([preferences boolForKey:@"isEnableHideDock"]) {
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
%end

%hook SBFloatingDockPlatterView
-(void)setBackgroundAlpha:(double)arg1{
    if ([preferences boolForKey:@"isEnableHideDock"]) {
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

%hook BCBatteryDevice
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
    if ([preferences boolForKey:@"isEnableHideFolderBackground"]) {
        %orig(0.0);
    } else {
        %orig;
    }
}
%end

%hook SBFolderIconImageView
-(void)setBackgroundView:(UIView *)arg1 {
    if ([preferences boolForKey:@"isEnableHideFolderIconBackground"]) {
        %orig(nil);
    } else {
        %orig;
    }
}
%end

%hook SBIconListGridLayoutConfiguration //iOS13&14, custom folder rows/columns
-(NSUInteger)numberOfPortraitColumns{
    return @5;
}
-(NSUInteger)numberOfPortraitColumns{
    return @5;
}
%end

%hook SBFDeviceBlockTimer
- (NSString *)subtitleText {
    return @"suck my cock"; //change iPhone disable text on lockscreen
}
%end

%ctor {
  preferences = [[HBPreferences alloc] initWithIdentifier:@"com.zachary7829.springliciousprefs"];
}