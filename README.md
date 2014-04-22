![Alt text](/READMESCR/not.png?raw=true)

[Notiphi](http://www.notiphi.com) iPhone SDK
==================

[Notiphi iPhone SDK (www.notiphi.com)](http://www.notiphi.com) allows you to better engage your iOS apps by sending contextual notifications. This guide will help you integrate it in a few minutes. Following steps outline the integration process.

### Steps to integrate the sdk to your Xcode - iOS project.

####Setup

Clone this repository

```
git clone https://github.com/alokmishra/notiphi-iphone-sdk.git
```

or download the zipped package.

```
wget https://github.com/alokmishra/notiphi-iphone-sdk/archive/master.zip
```

###Attaching the Notiphi Library

####1. Add static library

Unzip the files (if downloaded as a zip) and then add the files from **All Targets** in Builds directory to your project. If you are unfamiliar with the process of adding external libraries to your project.

a. Right click anywhere on the project navigator pane and select **Add Files to "Your project"** menu

![Alt text](/READMESCR/1a.png?raw=true)

b. Choose the Builds and then the **All Targets** folder. Select the file **"libNotifyManager.a"** and Folder **"include"** and click on "Add"

![Alt text](/READMESCR/1b.png?raw=true)

####2. Link Core Location Framework

a. Click on your project folder on the project navigator pane and go to **"Build Phases"** Tab

b. Expand the **"Link Binary With Library"** pane.

![Alt text](/READMESCR/2b.png?raw=true)

c. Click on the **'+'** button and select **"CoreLocation.framework"** and click "Add"

![Alt text](/READMESCR/2c.png?raw=true)

###Adding permissions

Notiphi needs some background capabilities. You need to specify that you’ll use these feature in the **UIBackgroundModes** key in your info plist.
We need the following list of permissions

a. location
b. fetch
c. remote-notification

The easiest way to do this is to use the new Capabilities tab in Xcode 5’s project editor, which includes a Background Modes section for easy configuration of multitasking options as shown below.

![Alt text](/READMESCR/xcode_background.png?raw=true)

Alternatively, you can edit the key manually:

<key>UIBackgroundModes</key>
  <array>
    <string>fetch</string>
    <string>location</string>
    <string>remote-notification</string>
  </array>

You would also need to add the following device capability in the info plist file.

<key>UIRequiredDeviceCapabilities</key>
  <array>
    <string>location-services</string>
  </array>

Once the permissions are set, we can change the code as shown below.
###Using Notiphi Library

####1. Import
**"NotifyManager.h"** to your app delegate

####2. Add
```
  [[NotifyManager sharedManager] processLaunchOptions:launchOptions];
```

To the method

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:
(NSDictionary *)launchOptions
```

In your app delegate

####3. Add
```
  [[NotifyManager sharedManager] startNotifyServicesWithAppID:@"#yourAppID"
key:@"#yourSecretKey"];
```

To the method

```
  - (void)applicationDidEnterBackground:(UIApplication *)application
 ```

In your app delegate (yourAppID and yourSecretKey will be provided by us on registration with us.)

####4. Add
```
  [[NotifyManager sharedManager] stopNotifyServices];
 ```

To the method

```
  - (void)applicationWillEnterForeground:(UIApplication *)application
```

In your app delegate

####5. Add
```
  [[NotifyManager sharedManager] processLocalNotification:notification];
```

To the method

```
  - (void)application:(UIApplication *)application
didReceiveLocalNotification:
(UILocalNotification *)notification
```

In your app delegate

####6. Add
```
    [[NotifyManager sharedManager] processRemoteNotification:userInfo];

```
to the method
```
-(void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
```

####7. Add
```
    [[NotifyManager sharedManager] registerForPushNotificationUsingDeviceToken:deviceToken];
```
to the method
```
-(void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
```

####8. [Optional] Add
```
    NSLog(@"Failed to register for push Error %@",[error description]);
```
to the method
```
-(void) application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
```

### Support or Contact

Having trouble with integration? Please contact us at **[dev-support@notiphi.com] [1]** and we’ll help you sort it out in a jiffy.

[1]: mailto:dev-support@notiphi.com        "dev-support@notiphi.com"
