# Quickstart

**How to use example project**
1. Go to project directory and run `pod install`
2. Open project via `iosApp.xcworkspace` 
3. In `Info.plist` file setup `PROJECT_ID` and `PROJECT_SALT`

**Importing libraries via CocoaPods**

The SDK for Android libraries can be imported via MavenCentral. To import the libraries via
MavenCentral, you need to do the following:

1. Open the Podfile file and add the following strings 
    ```
    target 'App' do
        pod 'EcmpMsdkCore'
    end
    ```
2. Sync cocoopods dependencies `pod install`
3. Import the library
    ```
    import EcmpMsdkCore
    ```