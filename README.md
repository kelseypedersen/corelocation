# CoreLocation Tutorial - July 2015

#### Add CoreLocation Framework
In Project Navigator, select Build Phases. Click on Link Binary with Libraries. This allows you to add frameworks to your project. Search for CoreLocation.framework and add to project. 

#### Add labels to Storyboard
In the storyboard add 6 labels. The first three are 'latitude', 'longitude', 'address.' Change the address label to be 4 lines in the attribute inspector to account for multi-line addresses. The second three are left as label because they are going to be automatically filled from the location coordinates in our location manager. Also add a button at the bottom of the page, 'Get Location.'

#### Connect labels with View Controller
Drag each label to the viewController.m file. Create 3 properties with the name of the property the same as the text label. Also drag the button, but change it to an action and call it 'buttonPressed.'

#### Add variables in the View Controller
Create instance variables of CLLocationManager, CLGeocoder, CLPlacemark in the inplementation file. We then initialize then in the viewDidLoad method.

#### Create response to buttonPressed in the View Controller
When the button is pressed, we set the view controller as the location manager delegate and start updating the location. 

#### Create the methods to check location in the View Controller
We then check the current location and set our labels in the storyboard equal to these values. For the address, we use reverseGeocodeLocation to turn coordinates into a specific address, and then use stringWithFormat to format it nicely in our label. We also use an if/else statement so if there's an error or no placemarks coordinates, then we log the error. 


### Questions:
Do the order of the frameworks matter? There is an option to reorder frameworks -- is that for organizational purposes with no effect on the code, or does it affect the code and runtime in someway? 
A: Only organizational
