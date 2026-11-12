#import <UIKit/UIKit.h>
#import <CarPlay/CarPlay.h>
#import <CoreLocation/CoreLocation.h>

@interface CRSIconLayoutController : NSObject
- (BOOL)isApplicationVisible:(id)appIdentifier;
@end

static BOOL isVehicleStationary(void) {
    // Placeholder for stationary/parked check; returns YES while parked
    return YES;
}

%hook CRSIconLayoutController
- (BOOL)isApplicationVisible:(id)appIdentifier {
    if (isVehicleStationary()) {
        return YES;
    }
    return %orig;
}
%end

%hook FBSApplicationDataStore
- (id)objectForKey:(NSString *)key {
    if ([key isEqualToString:@"SBCarPlaySupported"] && isVehicleStationary()) {
        return @YES;
    }
    return %orig;
}
%end
