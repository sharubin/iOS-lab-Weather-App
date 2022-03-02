# Project "Weather" overview

### Description
With this application, you can find out the weather anywhere in the world. For your convenience, cities that you often enter can be added to your favorites list and quickly find out the weather in them. You can also find out the weather not only using the search bar, but also using the map, for this you need to click on the point you are interested in. Selected cities are marked on the map with markers, and your current location is marked with a custom marker.

The application supports two languages - English and Russian.
___
### _Code_

 __MVC__ and __MVP__ architecture patterns were used.
 
 Also I was following the __SOLID__ principles.
 
To get data for hourly and daytime weather used https://openweathermap.org/api and the __URL Session__  to receive data by city name and coordinates.

__Then__ library is used to improve the appearance of the code when creating the UI, 

The __SnapKit__ library I used for making UI

The __Realm__ was used by me for saving favourite places.

The __Kingfisher__ library is used to download and cache images.

__Google Maps__ library also were used.

___
### _Structure of the project_:
* City entry screen
* Screen with detailed weather information, weather by day and hour
* Screen with selected cities
* Map screen
