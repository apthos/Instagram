# Project 4 - *Instagram*

**Instagram** is a photo sharing app using Parse as its backend.

Time spent: **11** hours spent on required features, **14** hours spent in total


## User Stories

The following **required** functionality is completed:

- [X] User can sign up to create a new account using Parse authentication
- [X] User can log in and log out of his or her account
- [X] The current signed in user is persisted across app restarts
- [X] User can take a photo, add a caption, and post it to "Instagram"
- [X] User can view the last 20 posts submitted to "Instagram"
- [X] User can pull to refresh the last 20 posts submitted to "Instagram"
- [X] User can tap a post to view post details, including timestamp and caption.

The following **optional** features are implemented:

- [ ] Run your app on your phone and use the camera to take the photo
- [ ] Style the login page to look like the real Instagram login page.
- [ ] Style the feed to look like the real Instagram feed.
- [ ] User can use a tab bar to switch between all "Instagram" posts and posts published only by the user. AKA, tabs for Home Feed and Profile
- [X] User can load more posts once he or she reaches the bottom of the feed using infinite scrolling.
- [ ] Show the username and creation time for each post
- [X] After the user submits a new post, show a progress HUD while the post is being uploaded to Parse
- User Profiles:
  - [ ] Allow the logged in user to add a profile photo
  - [ ] Display the profile photo with each post
  - [ ] Tapping on a post's username or profile photo goes to that user's profile page
- [ ] User can comment on a post and see all comments for each post in the post details screen.
- [X] User can like a post and see number of likes for each post in the post details screen.
- [ ] Implement a custom camera view.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Different ways to implement gesture recognizers such as programmatically or through the storyboard and which is preferred.
2. Resizing the image by making sure it is smaller than 10 MB rather than reducing the size of the image in pixels.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

1. Sign Up
<img src='https://i.imgur.com/uXgR5As.gif' title='Sign Up' width='' alt='Sign Up' />

2. Log in / Log out
<img src='https://i.imgur.com/PVQYDle.gif' title='Log' width='' alt='Log' />

3. User Persistence
<img src='https://i.imgur.com/aZ8hisW.gif' title='User' width='' alt='User' />

4. Compose, Post and Refresh
<img src='https://i.imgur.com/IwqAeoE.gif' title='Post' width='' alt='Post' />

5. View Feed
<img src='https://i.imgur.com/Zn6WkZS.gif' title='Feed' width='' alt='Feed' />

6. Details
<img src='https://i.imgur.com/18jjxkS.gif' title='Details' width='' alt='Details' />

7. Infinite Scrolling (5 new posts per fetch for demonstration purposes)
<img src='https://i.imgur.com/qhONzSl.gif' title='Infinite Scrolling' width='' alt='Infinite' />

8. Progress HUD
<img src='https://i.imgur.com/InKyV4D.gif' title='Progress' width='' alt='Progress' />

9. Like/Dislike a post (implemented with a relation in the Posts table with Parse)
<img src='https://i.imgur.com/6urSkbH.gif' title='Like' width='' alt='Like' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [Parse](https://parseplatform.org/) - mobile backend platform
- [DateTools](https://github.com/MatthewYork/DateTools) - dates and time library

## Notes

- Due to a change in iOS 13, logging out did not take you back to the initial screen with the given snippet of code. The snippet of code needed to be updated so it is placed in the scene delegate rather than the app delegate in order to function properly.
- Displaying the imager picker was a bit confusing as I did not realize I had to present it as if I was presenting an alert. A quick search guided me toward the solution. 
- Images posted from different devices were not appearing on other devices. For example, a post that came from an iPhone 8 would not appear on an iPhone SE. Enabling an exception for the database url fixed the issue.

## License

    Copyright 2020 David Lara

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
