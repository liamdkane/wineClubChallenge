# wineClubChallenge
"Wine Club App for hypothetic startup"

Liam Kane

## Tools used
- XCode 8.3.2
- PostMan

## Frameworks used
- [Masonry](https://github.com/SnapKit/Masonry) 
- [AFNetworking](https://github.com/AFNetworking/AFNetworking)

##### Notes

One of the biggest things I would note is that the sorting is done locally. After speaking to Mike about paginating, I decided since I wasn't going to be doing that, sorting locally would keep the app running fast. The alternative being making an API call each time to get sorted data. Since I wasn't paginating, I felt this gave a more complete experience.

Along the side there are categories, when those categories get clicked, it will trigger an apiCall for the first 50 of that category.

A blight that I see in my code is how the sorting is done and managed. In swift, the use of higher order functions coupled with extensions on protocols would've cleaned up the sorting a lot.

Another thing that stood out to me is the amount of code shared between the ShoppingCartTVC and the WineListTVC, something I would've cleaned up by implementing a protocol. 

One of my biggest decision trees involed using protocols or using NSNotificationCenter with regards to downloading the images. In a Swift environment I feel a lot more comfortable registering/unregistering Notifications/Observers, this lead me to me passing along the object information through delegates until I got back to the WineListTVC where I filtered through the visible cells and updated the image in the cell. My thinking behind this was that since I am adding in the image directly to the model, the only cells that wouldn't get the image are currently visible ones. 

In swift I would've really liked to make the ApiCaller a struct as opposed to a class, that would've freed up some memory.. (direct memory management isn't something I have a ton of experience).

Ultimately I hope this meets your standards, please excuse my syntax and time as this was the first project I ahve built from the ground up in ObjectiveC. 

Further notes regarding decisions are documented in the project.

Thank you for your time and consideration. I am really looking forward to speaking with you about this project.



