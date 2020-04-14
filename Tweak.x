#import <UIKit/UIKit.h>

@interface SpringBoard : UIApplication
- (void)_simulateLockButtonPress;
@end

@interface SBHomeScreenViewController : UIViewController
@end

@interface CSCoverSheetViewController : UIViewController
@end


%hook SBHomeScreenViewController

- (void)viewDidLoad {
  // let the original method run so we don't break anything
  %orig;

   UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lockDevice)];
    gesture.numberOfTapsRequired = 2;
     [self.view addGestureRecognizer:gesture];
}

%new

- (void)lockDevice {
   [(SpringBoard *)[%c(SpringBoard) sharedApplication] _simulateLockButtonPress];
}

%end

%hook CSCoverSheetViewController

- (void)viewDidLoad {
  // let the original method run so we don't break anything
  %orig;

   UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lockDevice)];
    gesture.numberOfTapsRequired = 2;
     [self.view addGestureRecognizer:gesture];
}

%new

- (void)lockDevice {
   [(SpringBoard *)[%c(SpringBoard) sharedApplication] _simulateLockButtonPress];
}

%end
