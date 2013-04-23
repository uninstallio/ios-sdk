![Alt text](/READMESCR/not.png?raw=true)

notiphi-iphone-sdk
==================

Notiphi iPhone SDK allows you to monetise your iOS apps by receiving contextual notifications. This guide will help you integrate it in a few minutes. Following steps outline the integration process.

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

Unzip the files (if downloaded as a zip) and then add the files from appropriate targets in Builds directory to your project. If you are unfamiliar with the process of adding external libraries to your project.

a. Right click anywhere on the project navigator pane and select **Add Files to "Your project"** menu

![Alt text](/READMESCR/1a.png?raw=true)

b. Choose the Builds and then the relevant armv6 or armv7 folder. Select the file **"libNotifyManager.a"** and Folder **"include"** and click on "Add"

![Alt text](/READMESCR/1b.png?raw=true)

####2. Link Core Location Framework

a. Click on your project folder on the project navigator pane and go to **"Build Phases"** Tab

b. Expand the **"Link Binary With Library"** pane.

![Alt text](/READMESCR/2b.png?raw=true)

c. Click on the **'+'** button and select **"CoreLocation.framework"** and click "Add"

![Alt text](/READMESCR/2c.png?raw=true)


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


### Authors and Contributors

This library owes its existence to the hard work of **Alok** and **Shahzin**.

### Support or Contact

Having trouble with integration? Please contact us at **[dev-support@notiphi.com] [1]** and we’ll help you sort it out in a jiffy.

[1]: mailto:dev-support@notiphi.com        "dev-support@notiphi.com"
