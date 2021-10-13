# THEORY
## 1. Why did you choose the framework you used?

The reason I chose the XCUITEST framework is because my goal is to test the iOS application at a UI level and this framework was specially designed to create well-performed, fast, highly reliable and maintainable UI tests for iOS apps.  Also, it was mentioned that the team uses XCUITEST to test the app so I wanted my solution to be as if it were to be implemented in the real app. 


## 2. What were the advantages and disadvantages of your choice?

### 2.1 Advantages

* Thanks to the framework architecture the test execution against iOS devices is faster than any other framework for UI test automation. 
* It’s easy to maintain since the app source code and the test code are in one place.
* Using the same programming language for the app source code and test code facilitates the communication between qa engineers and developers. Also, it allows developers to test more frequently while developing. 
* It’s level of flakiness tests is really low. 
* It’s a very intuitive framework to work with, the writing of the tests feels very natural and allows me to recreate the interactions of real users.


### 2.2 Disadvantages

* Since the framework doesn’t support cross-platform testing it presents a challenge for the QA team, because to test other platforms such as Android requires using different test automation frameworks and maintaining separate codebases.

## 3. Which good coding practices did you follow when writing your tests?

1. Define a testing strategy with a risk-based approach. (Explanation in the testing strategy section)
2. Implement the POM design pattern.

   By implementeing this pattern we improve the tests maintenance and reduce code duplication. Something that I really had in mind while this is to be careful when abstracting the code of the UI from the code of the test. The code of the test (setup of the specific test, asserts, etc) should be on the test file. 

4. Use of clean code principles

  * __Code grouping + AAA testing pattern:__ whenever it was possible I tried to keep related code in separate blocks to help readability. Also, I tried to structure the tests following the AAA pattern (arrange-act-assert), for example: 

```swift
   func test_selectExercise(){
        let exercise = ExerciseBuilder()
            .with(id: 341)
            .with(name: "Body-Ups")
            .build()
        
        login()
        selectExercise(exercise)
        
        XCTAssertTrue(backButton.waitUntilExists())
        XCTAssertTrue(exerciseImage.waitUntilExists())
        XCTAssertTrue(exerciseName.waitUntilExists())
        XCTAssertEqual(exerciseName.label, exercise.name)
    }
```
The first block of code refers to the __Arrange__ part, which is where the code required to setup that specific test goes. The second block is the __Act__ part, this part contains the actions  to be tested. And the final block is the __Assert__ part, where it checks whether the expectations were met. 

  * __Naming convention for the test methods:__ 

```swift
   func test_selectExercise(){
        …
    }
```

  * __Use meaningful names for functions and variables__ 

4. Use of SOLID principles like single responsibility and open/closed principles. 
5. Use of FIRST  principles of testing  like making the execution of the tests (relatively) fast, independent from other tests which allow us to execute the tests in any order, repeatable on different environments ( different iphones) and self-validating.
6. Use of some of the OOP principles like encapsulation, abstraction and inheritance. 

## 4. How do you make sure your code is maintainable by other team members?

1. Used Trunk-based development as a version control management practice/ branching strategy which helped me achieve CI. (Explanation in the CI section)
2. Used Github Actions to create a pipeline to build and test the application, this also helped me achieve CI. (Explanation in the CI section)
3. Used POM design pattern (as mentioned above)


# TESTING DOCUMENTATION

## 1. Testing Strategy

The first thing I did was design a testing strategy with a risk-based approach. This strategy, presented by Google  in the book “How Google Tests Software” defines an ACC matrix with which it will subsequently determine the risk levels of the app through a heat map.


| Attributes | Components   | Capabilities                                    |
| -----------| -------------| ------------------------------------------------|
| Portability| Login        | Login with valid credentials                    |
| Correctness| Search       | Login with wrong credentials                    |
|            | Exercise     | Login with empty credentials                    |
|            |              | Search existent exercise by name                |
|            |              | Search existent exercise by id                  |
|            |              | Search non existent exercise by name or id      |
|            |              | Clear words from search bar with reset button   |
|            |              | Clear words from search bar with cancel button  |
|            |              | Display existent exercises                      | 
|            |              | Display details of exercise without search      |
|            |              | Display details of searched exercise            |
|            |              | Go back to the search screen                    |

Below is the ACC matrix and its legend: 

![ACC matrix](https://github.com/saradrada/mobile-ios-automation-challenge/blob/docs/docs/images/ACC-matrix.png)
![ACC matrix legend](https://github.com/saradrada/mobile-ios-automation-challenge/blob/docs/docs/images/ACC-matrix-legend.png)

So after creating the ACC matrix, I did a risk analysis using a heat map to represent the level of risk of each component. Below are the results: 


![Risk matrix](https://github.com/saradrada/mobile-ios-automation-challenge/blob/docs/docs/images/risk-matrix.png)
![Risk matrix legend](https://github.com/saradrada/mobile-ios-automation-challenge/blob/docs/docs/images/risk-matrix-legend.png)

As we can see, the components with the highest risk are the Search and Exercise components. These are the ones I'm going to focus on while automating. 

## 2. Test Cases

__Login scenarios__

* Scenario: Login with valid credentials <br/>
  Given the user enters a valid username and password <br/>
  When the user taps on the login button <br/>
  Then the user should see the search bar and list of available exercises <br/>

* Scenario: Login with invalid credentials <br/>
  Given the user enters an invalid username and/or invalid password <br/>
  When the user taps on the login button <br/>
  Then the user should see the ‘Wrong Credentials’ alert <br/>

* Scenario: Login with empty credentials <br/>
  Given the user enters an empty  username and/or empty password <br/>
  When the user taps on the login button <br/>
  Then the user should see the ‘Wrong Credentials’ alert <br/> <br/>


__Search scenarios__

* Scenario: Search an existent exercise by name <br/>
  Given the user logs in the app  <br/>
  When the user starts typing a name in search box <br/>
  Then it should suggest exercises that matches typed name <br/>

* Scenario: Search an existent exercise by id <br/>
  Given the user logs in the app  <br/>
  When the user starts typing an id in search box <br/>
  Then it should suggest exercises that matches typed id <br/>
 
* Scenario: Search a non existent exercise by name or id <br/>
  Given the user logs in the app  <br/>
  When the user starts typing a name or id in search box <br/>
  Then it should show an empty list  <br/>
 
* Scenario: Clear words from search bar with reset button  <br/>
  Given the user logged in the app  <br/>
  And typed a word in the search bar  <br/>
  When the user tap on the reset button  <br/>
  Then it should clear the search bar  <br/>
 
* Scenario: Clear words from search bar with cancel button  <br/>
  Given the user logged in the app  <br/>
  And typed a word in the search bar  <br/>
  When the user tap on the cancel button  <br/>
  Then it should clear the search bar and stop showing the reset button  <br/>
 
* Scenario: Display existent exercises  <br/>
  Given the user logged in the app  <br/>
  When the user is in the search screen  <br/>
  Then it should display the existent exercises  <br/>  <br/>

__Exercise scenarios__

* Scenario: Display details of selected exercise <br/>
  Given the user logs into the app  <br/>
  When the user selects an exercise from the displayed exercises  <br/>
  Then it should display the the details (title and image) of the selected exercise <br/>

* Scenario: Display details of selected exercise <br/>
  Given the user logs into the app <br/>
  And the user searches an existing exercise <br/>
  When the user selects an exercise from the suggested exercises <br/>
  Then it should display the the details (title and image) of the selected exercise <br/>

* Scenario: Go back to the search screen <br/>
  Given the user logs in the app <br/>
  And the user selects an exercise from the displayed exercises <br/>
  When the user taps on the back button <br/>
  Then it should go back to the search screen <br/>


## 3. E2E UI Tests

It’s important to know at what level we are testing the application since certain decisions in the automation strategy depend on this. As a basis I took the testing pyramid proposed by Martin Fowler. In this case we are focusing on E2E UI tests which require more resource use and longer execution time than the other test levels, therefore they should be the ones with the fewest automated test cases. On the other hand, If I were focusing on the unit level, which requires fewer resources and significantly less time I would build a large suite of tests.

![Testing pyramid](https://github.com/saradrada/mobile-ios-automation-challenge/blob/docs/docs/images/testing-pyramid.png)


## 4. Branching Strategy

  * Implementing the trunk-based development I made sure to merge small, frequent updates. 

![Trunk-base development](https://github.com/saradrada/mobile-ios-automation-challenge/blob/docs/docs/images/trunk-based-development.jpg)

  * Also, I tried to push several changes throughout the day while working on the solution and I worked with 5 main branches: 

| Branch         | Description                              |
| ---------------| -----------------------------------------|
| master         | Stable changes, ready to release         |
| feature/ci     | Changes related to CI setup              |
| test/login     | E2E tests for the login component        |
| test/search    | E2E tests for the search component       |
| test/exercise  | E2E tests for the exercise component     |

![Branching strategy](https://github.com/saradrada/mobile-ios-automation-challenge/blob/docs/docs/images/branching-strategy.jpg)

  * I followed a structure for the commit message, so it would easier to understand: 
    ```
    <type>(<scope>): <subject>
    ```
  Type refers to the type of changes that we are committing, for example it could be a feature, test, etc.
  Scope refers to which component is being affected by the changes.
  Subject is a description of what was done. 
  
  For example, this are some of the commits done: 
  
  ![Commit structure](https://github.com/saradrada/mobile-ios-automation-challenge/blob/docs/docs/images/commit-structure.png)
  
  * I used squash merging to condense the git history of commits into one when doint a pull request.


## 5. CI

Another tool I used is Github Actions to create a pipeline to build and test the application. This allowed me to tests on different devices: iPhone and iPad. It also allowed me to configured the pipeline to test on different iPhone models. This strategy helped me ensure that the portability attribute was being tested correctly. 

To select which iPhone models to use in the testing stage of the pipeline, I did some research and found out that the most sold iPhones in 2020 in germany were: iPhone 11, iPhone 12 and iPhone XR. So I chose the first two (iPhone 11 and 12) and to cover other devices I also chose and iPad. 

This is the pipeline that I used: 

![Pipeline](https://github.com/saradrada/mobile-ios-automation-challenge/blob/doc/improvements-readme-theory/docs/images/github-actions.jpg)

## 6. Bug Report

While running the app I found a bug in one of the scenarios for the Exercise component.


| Title           | Search and select exercise                                                                                             |
| ----------------| -----------------------------------------------------------------------------------------------------------------------|
| Environment     | master branch, running on any iPhone model                                                                             |
| Scenario        | Scenario: Display details of searched exercise                                                                         |
|                 | Given the user logs into the app                                                                                       |
|                 | And the user searches an existing exercise.                                                                            |
|                 | When the user selects the exercise from the suggested exercises                                                        |
| Expected resutl | Then it should display the details (title and image) of the selected exercise                                          |
| Actual result   | Then it displays the details (title and image) from the the exercise corresponding to the position of the initial list |
| Visual proof    | ![Alt Text](https://github.com/saradrada/mobile-ios-automation-challenge/blob/docs/docs/videos/search-select-bug.gif)  |





