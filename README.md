![Alt text](/READMESCR/not.png?raw=true)

[Notiphi](http://www.notiphi.com) iPhone SDK
==================

[Notiphi iPhone SDK (www.notiphi.com)](http://www.notiphi.com) allows you to better understand your iOS apps by profiling your users. This guide will help you integrate it in a few minutes. Following steps outline the integration process.

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

1. location
2. fetch
3. remote-notification

The easiest way to do this is to use the new Capabilities tab in Xcode 5’s project editor, which includes a Background Modes section for easy configuration of multitasking options as shown below.

![Alt text](/READMESCR/xcode_background.png?raw=true)

Alternatively, you can edit the key manually:

```
<key>UIBackgroundModes</key>
  <array>
    <string>fetch</string>
    <string>location</string>
    <string>remote-notification</string>
  </array>
```

You would also need to add the following device capability in the info plist file.

```
<key>UIRequiredDeviceCapabilities</key>
  <array>
    <string>location-services</string>
  </array>
```

Once the permissions are set, we can change the code as shown below.
###Using Notiphi Library

####1. Import
**"NotifyManager.h"** to your app delegate

####2. Add
```
  [[NotifyManager sharedManager] processLaunchOptions:launchOptions];
  [[NotifyManager sharedManager] startNotifyServicesWithAppID:@"yourAppID"
key:@"yourSecretKey"];
```

To the method

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:
(NSDictionary *)launchOptions
```

In your app delegate. yourAppID and yourSecretKey will be provided by us on registration with us.

####3. Add
```
  [[NotifyManager sharedManager] startNotifyServicesWithAppID:@"yourAppID"
key:@"yourSecretKey"];
```

To the method

```
  - (void)applicationWillEnterForeground:(UIApplication *)application
```

In your app delegate.



####4. Add
```
    [[NotifyManager sharedManager] registerForPushNotificationUsingDeviceToken:deviceToken];
```
to the method
```
-(void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
```

####5. IOS7 and above ONLY: Add
```
    [[NotifyManager sharedManager] processRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);

```
to the method
```
- (void)  application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler

```
####6. IOS7 and above ONLY: Add
```
    [[NotifyManager sharedManager] startNotifyServicesWithAppID:@"yourAppID" key:@"yourSecretKey"];
    completionHandler(UIBackgroundFetchResultNoData);

```
to the method
```
- (void) application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
```


### Send us your Push certificate for testing

In the Apple Developer Members Center, click on Identifiers under iOS Apps and locate your application in the list. Click on that app which you want to configure. If Push Notifications is disabled (as shown below)

![Alt text](/READMESCR/not_disabled.png?raw=true)

then click on Edit which will show you something like this.

![Alt text](/READMESCR/edit_nots.png?raw=true)

Ensure that the checkbox against  **Push Notifications** is checked.

####Generate and Download Your Certificate

If you need to enable the Development or Production Push SSL Certificate, choose which certificate to create:

After clicking Create Certificate, you will see the Add iOS Certificate Assistant. Follow the instructions in the assistant and then click Continue.

Using the Certificate Signing request that was just created generate the APNS Push SSL certificate.

Once the Download button appears, you are ready to download. You may need to reload the page for this to update. Download the created certificate.

![Alt text](/READMESCR/download.png?raw=true)

Open the certificate. Opening the certificate will open Keychain Access.

In Keychain Access your certificate should be shown under “My Certificates”. The name will be like **Apple Development IOS Push Services:*xxxxxxxx**

![Alt text](/READMESCR/certs.png?raw=true)

####Exporting the .p12 file

Select the certificate that was just added to Keychain Access and select File -> Export Items... from the menu. When saving the file, use the Personal Information Exchange (.p12) format.

![Alt text](/READMESCR/export.png?raw=true)

The certificate file is ready. Please email it to us.


### Support or Contact

Having trouble with integration? Please contact us at **[dev-support@notiphi.com] [1]** and we’ll help you sort it out in a jiffy.

[1]: mailto:dev-support@notiphi.com        "dev-support@notiphi.com"
