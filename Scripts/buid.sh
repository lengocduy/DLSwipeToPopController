# 1. Remove existing xcframework bundle
test -d DLSwipeToPopController.xcframework && rm -rf "$PWD/DLSwipeToPopController.xcframework"

# 2. Build all the supported architectures
## Device slice.
xcodebuild clean archive -scheme DLSwipeToPopController CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -sdk iphoneos  -configuration Release -destination 'generic/platform=iOS' -archivePath "$PWD/archives/DLSwipeToPopController.framework-iphoneos.xcarchive" SKIP_INSTALL=NO

## Simulator slice.
xcodebuild clean archive -scheme DLSwipeToPopController CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -sdk iphonesimulator -configuration Release -destination 'generic/platform=iOS Simulator' -archivePath "$PWD/archives/DLSwipeToPopController.framework-iphonesimulator.xcarchive" SKIP_INSTALL=NO

# 3. Create a XCFramework to combine all the supported architectures in a bundle
xcodebuild -create-xcframework -framework "$PWD/archives/DLSwipeToPopController.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/DLSwipeToPopController.framework" -framework "$PWD/archives/DLSwipeToPopController.framework-iphoneos.xcarchive/Products/Library/Frameworks/DLSwipeToPopController.framework" -output "$PWD/DLSwipeToPopController.xcframework"

# 4. Remove temporay folder to take the space back
rm -rf "$PWD/archives"