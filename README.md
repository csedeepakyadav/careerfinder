# Career-Finder Mobile Applicatiom ( Flutter )
(Documentation)

## How to run ?

### * Windows

#### -> VS Code 
* flutter pub get (in terminal )
* flutter run (in termninal)

#### -> Android Studio
* open project and click on run.

### * Mac

#### -> VS Code 
* pub get (in terminal )
* cd ios ( move to ios directory of project )
* pod install (in terminal)
* cd.. (interminal)
* flutter run (in termninal)

#### -> Xcode
* open ( project->ios->Runner.xcworkspace ) in xcode.
* click on run.

## Technical Details

* BLoC Pattern Architecture used.
* For State management Flutter_bloc and Equatable packages are used.
* For Http request http package is used.


## In-depth Project Flow

* App starts.
* navigates to splash screen, here hold for 2 seconds, Then Navigates to authentication check, then if authenticated then proceeds to home screen else login screen.
* if user has an account then he/she can directly login. After successful login it will navigate to home screen.
* If user is new then he/she can create account with account option of seeker or recruiter after successful signup it will ask for email verification and navigates to login screen once email varified user can login.
* At home screen first it will hit the job API and check if job is available, now if jobs available then it will collect the jobs in a list of job model class and then after shimmer loader it will populate the home screen with job cards where user can see the available jobs and it's details.


## Validations

* Data validation.
* Http response and request validation.
* Form validation.
* Exception handling.

## Others

* Adaptive App Icon for both Android and iOS used.
* Animation used.
* Shimmer loader used.
* Sound Null-Safety.

## Test

* ## Tested with Android.
![careerfinder_app_android_screenshorts](https://user-images.githubusercontent.com/22419021/127860384-1b2f7281-6059-488d-88dc-e7bd9a244588.png)


* ## Tested with iOS.
![careerfinder_app_ios_screenshorts](https://user-images.githubusercontent.com/22419021/127860452-e599b678-c342-41de-9e13-7811103771e8.png)


## Download App ( Android )
https://www.dropbox.com/s/zatvmck8kv8t092/career_finder.apk

## Github Repository ( Source Code )
https://github.com/csedeepakyadav/careerfinder

