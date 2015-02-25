[Uninstall Insights](http://uninstall.io) iPhone SDK
===================

[Uninstall SDK (http://uninstall.io)](http://uninstall.io) helps you to understand the reasons for your app uninstalls, reduce the uninstall rate using a powerful predictive engine and also get app Re-installs through a unique actionable channel. 

This guide will provide you step by step details on how to integrate the SDK in just a few minutes. Following steps outline the integration process in details.

### Steps to integrate the sdk to your Xcode - iOS project.

* Download the zipped package and Unzip the file.
* Attach the Uninstall Library to your project.
* Configure libraries and permissions in the project.
* Add Uninstall methods from library in the project.
* Sending Events Using Uninstall Library.
  * Unique System User ID and Email ID.
  * Install Source.
  * App Events.
  * Crash Events
* Send us your Push certificate for testing



####Download the zipped package and Unzip the file.

Clone this repository

```
git clone https://github.com/alokmishra/notiphi-iphone-sdk.git
```

or download the zipped package.

```
wget https://github.com/alokmishra/notiphi-iphone-sdk/archive/master.zip
```
Unzip the files (if downloaded as a zip).

###Attach the Uninstall Library to your project

####1. Add static library

Add the files from **All Targets** in Builds directory to your project. If you are unfamiliar with the process of adding external libraries to your project.

a. Right click anywhere on the project navigator pane and select **Add Files to "Your project"** menu

![Alt text](/READMESCR/1a.png?raw=true)

b. Choose the Builds and then the **All Targets** folder. Select the file **"libNotifyManager_combined.a"** and Folder **"include"** and click on "Add"

![Alt text](/READMESCR/1b.png?raw=true)

####2. Link Core Location Framework

a. Click on your project folder on the project navigator pane and go to **"Build Phases"** Tab

b. Expand the **"Link Binary With Library"** pane.

![Alt text](/READMESCR/2b.png?raw=true)

c. Click on the **'+'** button and select
  * **CoreLocation.framework**
  * **CoreBluetooth.framework**
  * **CoreTelephony.framework**
  * **QuartzCore.framework**
  * **Security.framework**
  * **SystemConfiguration.framework**
  * **Ad.Support.framework**
   
and click "Add"

![Alt text](/READMESCR/2c.png?raw=true)

###Configure libraries and permissions in the project

Uninstall needs some background capabilities. You need to specify that you’ll use these feature in the **UIBackgroundModes** key in your info plist.
We need the following list of permissions

1. fetch
2. remote-notification

The easiest way to do this is to use the new Capabilities tab in Xcode 5’s project editor, which includes a Background Modes section for easy configuration of multitasking options as shown below.

![Alt text](/READMESCR/xcode_background.png?raw=true)

Alternatively, you can edit the key manually:

```
<key>UIBackgroundModes</key>
  <array>
    <string>fetch</string>
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
###Add Uninstall methods from library in the project

####1. Import
**"NotifyManager.h"** to your app delegate

####2. Add
```
  [[NotifyManager sharedManager] processLaunchOptions:launchOptions];
  [[NotifyManager sharedManager] startNotifyServicesWithAppID:@"yourAppID" key:@"yourSecretKey"];
  
  if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)])
    {
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert) categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        
    } else
    {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes: (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    }

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

####5. Add
```
    [[NotifyManager sharedManager] processRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);

```
to the method
```
- (void)  application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler

```
####6. Add
```
    [[NotifyManager sharedManager] startNotifyServicesWithAppID:@"yourAppID" key:@"yourSecretKey"];
    completionHandler(UIBackgroundFetchResultNoData);

```
to the method
```
- (void) application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
```

####7. Add
```
    [[NotifyManager sharedManager] didLoseFocus];

```
to the method
```
- (void)applicationDidEnterBackground:(UIApplication *)application
```



###Sending Events Using Uninstall Library
If you need to send us some events then you would need to do the additional steps as shown below.

#####1) Unique System User ID and Email ID
Pass the Unique System User ID and Email Id to our SDK. This data will be used to synchronize the ID’s between our systems and also to take certain actions. This information has to be passed only once in the lifetime of the app. Help code snippet below.

```
 NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
 NSString* isFirstTimeInstall = @"isFirstTimeInstall";
 if([preferences objectForKey: isFirstTimeInstall] == nil)
    {
        [[NotifyManager sharedManager] identify:@"userId" traits:@{ @"name": @"User_Name",@"email": @"user@xyz.com" }];
    }
    else
    {
        const BOOL presentLevel = [preferences boolForKey: isFirstTimeInstall];
    }
    
NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
NSString* isFirstTimeInstall = @"isFirstTimeInstall";
const NSInteger presentLevel = ...;
[preferences setBool:presentLevel forKey:isFirstTimeInstall];
const BOOL didSave = [preferences synchronize];

```

#####2) Install Source
The Install source needs to be passed to our SDK. This is used to measure the Ad channels (especially Inorganic sources) performance. Information can be passed in two ways:

#####a. Via 3rd party platform
If you use any third party attribution platform and supports data extraction via API, then send us the API keys and we will directly extract the information from there. Please check with your product/marketing manager for details on 3rd party platform.

#####b. Via the App
In case you do not use any 3rd party platform or the platform doesn’t support any API then pass the data to our SDK via our event capturing feature This information has to be passed only once in the lifetime of the app during installation. Help code snippet below.

```
NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
NSString* isFirstSourceData = @"isFirstSourceData";
if([preferences objectForKey: isFirstSourceData] == nil)
    {
        [[NotifyManager sharedManager] track:@"eventName" properties:@{ @"SOURCEDATA": @"ad_channel_API_KEY" }];
    }
    else
    {
        const BOOL presentLevel = [preferences boolForKey: isFirstSourceData];
    }
    
NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
NSString* isFirstSourceData = @"isFirstSourceData";
const NSInteger presentLevel = ...;
[preferences setBool:presentLevel forKey: isFirstSourceData];
const BOOL didSave = [preferences synchronize];

```

#####3) App Events
All app events have to be passed to our SDK. Information can be passed in two ways:

#####a. Via 3rd party platform
If you use any third party analytics platform and supports data extraction via API, then send us the API keys and we will directly extract the information from there. Please check with your product/marketing manager for details on 3rd party platform.

#####b. Via the App
In case you do not use any 3rd party platform or the platform doesn’t support any API then pass the data to our SDK via our event-capturing feature. Help code snippet below.


```
 [[NotifyManager sharedManager] track:@"eventName"  properties:@{ @"eventValue": @"Event-Value",@"IDSync": @"ABC1234"}];

```

#####4) Crash Events
Send the API keys of the crash-reporting platform to us. We will extract the information using their API. In case you are reporting the crash manually, then pass the information to our SDK as well. Help code snippet below.

```
NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
NSString* isFirstReportData = @"isFirstReportData";
if([preferences objectForKey: isFirstReportData] == nil)
    {
        [[NotifyManager sharedManager] track:@"crashReport" properties:@{ @"CRASH_REPORT_ID": @"crash_report_id" }];
    }
    else
    {
        const BOOL presentLevel = [preferences boolForKey: isFirstReportData];
    }
    
NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
NSString* isFirstReportData = @"isFirstReportData";
const NSInteger presentLevel = ...;
[preferences setBool:presentLevel forKey: isFirstReportData];
const BOOL didSave = [preferences synchronize];

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

Having trouble with integration? Please contact us at **[ios-dev-support@uninstall.io] [1]** and we’ll help you sort it out in a jiffy.

[1]: mailto:dev-support@notiphi.com        "ios-dev-support@uninstall.io"
