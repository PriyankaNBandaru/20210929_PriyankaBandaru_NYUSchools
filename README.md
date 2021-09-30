# 20210929_PriyankaBandaru_NYUSchools


20210929_PriyankaBandaru_NYUSchools app the list of schools withing NYC and their required SAT Scores.

The app consists of a screen with a table view displaying the list of schools along with their location fetched from the API.

Schools list and their SAT Scores information from API is fetched on the launch of the application.they are fetched in the beginning and not in regular intervals since the values wont change frequently.

App Architecture Overview:

The app uses MVC architecture.

Models

Both the models Schools and SATScores structs.

View

The view Controller does the data representation.

Controller

The Controller with the help of the methods from APIHelper,JSONHelper receives the data and sends it to the View and explains how to use the data.

Unit Tests:

_0210929_PriyankaBandaru_NYCSchoolsTests target contains unit testcases for JSON to Model conversions,URL generation.

UI Tests:

_0210929_PriyankaBandaru_NYCSchoolsUITests target contains UI test cases to test the existence of labels,tableview.


UI:

The view for the app is contained within storyboard and is handled by [ViewController.swift].The view consists of a table view controller and on selection will display another view controller [PopUpViewController.swift] which contains a custom view [SchoolSATScoreView.swift].

The view is drawn using the auto loayout constraints set in the storyboard.

Limitations:

The background images can be animated with the help of UIAnimation.

The app can be designed programmatically by creating the required attributes and adding them to the view without using storyboard.

Converting the json from API as files and incorporating those files into the app and accessing the data when and where required is also a way to implement since the Schools or their SAT scores won’t change frequently.

Reading the JSON files from API once and loading them into application database and use them when and where required is also possible since the scores/list may not change frequently.

The custom View I used in the application can also be designed programmatically by creating attributes, setting frames for those attributes, defining constraints for each one of them without using auto layout functionality.

Multiple UI Test cases and Functional Test cases can also be written in the application but implemented only a couple of them due to time contraints.

