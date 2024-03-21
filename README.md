# HackerNews App

Has built this sample app in SwiftUI following the MVVM design pattern.

The app calls a github api [`https://github.com/HackerNews/API`]

- Has ensured that Separation of Concerns has been taken care by allowing view, model and viewModel having single responsibility.  
- Has ensured that the model type takes care of the data transformation by conforming to the Decodable protocol and providing CodingKeys
to map the json fields from api to our model properties
- Has ensured the view remains independent of Model and employs types like Int, String. Also the News view just displays a footnote text instead
  of encompassing info such as domain name of website, author,etc. This approach helps in maintaining types as loosely coupled as possible and
  minimises the impact of chanfges on existing code 
- Placed the state and networking code in viewModel. 
- The viewModel class is @Observable, any update to its stories property will trigger an update in Views
- Has employed the Swift's async await and URLSession to download data from the external api, and further the fetchTopStories() method utises
  a task group to parallely retrieve the data for each store, creating disting subtasks for each fetchStory(withID id:) call.
- The ContentView type initialises the viewModel instance within a @State property and initiates network requests by invoking the
fetchTopStories() method within its .task modifier and exhibits the contents of the stories property of the viewModel using a List.

Note: The networking code placed in the viewModel could have been made reusable by having a separate networking infrastructure for the api calls by abstracting the api resources with protocols, generics and extensions. But as this is a simple app, I ignored it. 



