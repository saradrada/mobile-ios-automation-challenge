# qa-automation-ios-test

### Setup:
1) Install Xcode 11.3 or later as described [here](https://developer.apple.com/xcode/resources/)
  
  2) [Fork](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository) the repository to local.
  
  3) Open the repository in Xcode and build the application. It is only possible to build the application on a simulator, not on a physical device.
  
  4) The credentials to log into the app are `automation@gymondo.de`  /  `automation`



### Run locally on Xcode
1) Open Xcode
2) Select Product
3) Select Test
4) Tests should start executing on a simulator!
5) See results in Xcode


### Run locally on a terminal

1) Open the terminal
2) To build the app, copy and paste the command below:

```
xcodebuild build-for-testing -scheme qa-automation-ios-testUITests -destination 'platform=iOS Simulator,name=iPhone 12' #-allowProvisioningUpdates
```

4) To execute the tests, copy and paste the command below:

```
xcodebuild test-without-building -scheme qa-automation-ios-testUITests -destination 'platform=iOS Simulator,name=iPhone 11'
```

6) Test should start executing 
7) You should see the results in the terminal :)  
