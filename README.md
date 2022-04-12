# IOSUnitTest
The app is configured in 3 flavours, namely: DEV, STAGE, and RELEASE. This is because of the proposed test environment that will be availbale in the future, based on the product documentation. 
The URLs class contains all url and endpoints for the app and has the environment configuration for the url itself.

The assets contains the app icon for the proposed flavors. even though there are no icons there, the assets for each flavours have been created. It also coontains a color folder where all the colors will be stored, for ease in color update in the future.

I added Localized string just in case of string localization in different languages.

Utilities folder contains the Designables, Box class which is a custom observer and Extension class contains extensions created in certain Classes.

Model contains the API response models in codable

Network folder contains, service and protocol which contains network call logic.

Viewmodel contains the viewmodel class for data manipulation

Table call contains all table cell arranged in sub folders of its storyboard name

View Controller contains all view controllers arranged in sub folders of its storyboard name

Storyboard contains all storyboards.
