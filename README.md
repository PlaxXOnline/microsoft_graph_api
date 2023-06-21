# MSGraphAPI Class

[![pub package](https://img.shields.io/pub/v/microsoft_graph_api.svg)](https://pub.dev/packages/microsoft_graph_api) [![GitHub stars](https://img.shields.io/github/stars/PlaxXOnline/microsoft_graph_api.svg?style=social&label=Star)](https://github.com/PlaxXOnline/microsoft_graph_api)

The `MSGraphAPI` class serves as a primary point of interaction for working with Microsoft Graph API, providing easy access to various services like users, calendar, meeting rooms, and places.

## Properties
- `me`: An instance of the `Me` class for user-specific operations.
- `users`: An instance of the `Users` class for operations related to all users.
- `calendar`: An instance of the `Calendar` class for calendar-related operations.
- `meetingRooms`: An instance of the `MeetingRooms` class for operations related to meeting rooms.
- `place`: An instance of the `Place` class for place-related operations.

## Constructor
The constructor takes a string parameter, `_token`, which represents the authentication token for accessing Microsoft Graph API. It initializes instances of `Me`, `Users`, `Calendar`, `MeetingRooms`, and `Place` classes.

## Usage

### Example

```dart
String token = 'Your Microsoft Graph API token here';
MSGraphAPI graphAPI = MSGraphAPI(token);

// Use the instances
User userInfo = graphAPI.me.fetchUserInfo();
List<Room> allPlaceRooms = graphAPI.place.fetchAllRooms();
```



## Features

<details>
  <summary>Me</summary>

#### Fetch User Information

The `fetchUserInfo` method is used to fetch the user's information from the Microsoft Graph API. The method sends a GET request and does not require any parameters. It returns a `Future<User>` object that represents the user's information.

```dart
User user = await graphAPI.me.fetchUserInfo();
```

#### Change Password

The `changePassword` method is used to change the user's password. It requires two parameters: `currentPassword` and `newPassword`, which represent the current and new passwords, respectively. The method sends a PATCH request to the Microsoft Graph API and returns a `Future<bool>` indicating the success of the operation.

```dart
bool isChanged = await graphAPI.me.changePassword(currentPassword, newPassword);
```

#### Fetch User Profile Image

The `fetchUserProfileImage` method is used to fetch the user's profile image from the Microsoft Graph API. The method sends a GET request and requires a `size` parameter, which specifies the desired size of the image. It returns a `Future<ImageProvider> object representing the user's profile image.

```dart
ImageProvider image = await graphAPI.me.fetchUserProfileImage(size);
```
</details>

<details>
  <summary>Users</summary>

#### Fetch Specific User Information

The `fetchSpecificUserInfo` method is used to fetch the user's information for a specific user from the Microsoft Graph API. The method sends a GET request and requires the `userId` parameter. It returns a `Future<User>` object that represents the user's information.

```dart
User user = await graphAPI.users.fetchSpecificUserInfo(userId);
```

#### Create User

The `createUser` method is used to create a new user. It requires four parameters: `displayName`, `mailNickname`, `userPrincipalName`, and `password`. The method sends a POST request to the Microsoft Graph API and returns a `Future<User>` object representing the newly created user.

```dart
User newUser = await Users.createUser(displayName, mailNickname, userPrincipalName, password);
```

#### Delete User

The `deleteUser` method is used to delete a user. It requires the `userId` parameter and sends a DELETE request to the Microsoft Graph API. It returns a Future<bool>` indicating the success of the deletion operation.

```dart
bool success = await Users.deleteUser(userId);
```

#### Fetch All User Rooms (Beta)

The `fetchAllUserRooms` method is used to fetch all user rooms. This method sends a GET request to the 'findRooms' endpoint of the Microsoft Graph API and converts the response data into a list of 'Room' objects. It returns a Future<List<Room>>` representing all the rooms fetched by the user.


```dart
List<Room> rooms = await Users.fetchAllUserRooms();
```
</details>

<details>
  <summary>Calendar</summary>

#### Fetch Calendar Events for Range

The `fetchCalendarEventsForRange` method is used to fetch calendar events within a specific date range. The method sends a GET request and requires the `startDateTime` and `endDateTime` parameters. It returns a `Future<List<CalendarEvent>>` object that represents the calendar events within the given date range.

```dart
List<CalendarEvent> events = await Calendar.fetchCalendarEventsForRange(startDateTime, endDateTime);
```

#### Create Calendar Event

The `createCalendarEvent` method is used to create a new calendar event. It requires a Map<String, dynamic>` parameter representing the event to be created. The method sends a POST request to the Microsoft Graph API. If the request is successful, it logs a success message. If the request fails, it logs the error message.

```dart
await Calendar.createCalendarEvent(event);
```
</details>

<details>
  <summary>MeetingRooms</summary>

#### Book Meeting Room

The `bookMeetingRoom` method is used to book a meeting room by creating a new event. It requires a `Map<String, dynamic>` parameter representing the event to be created. This event should represent the booking of the meeting room. The method sends a POST request to the Microsoft Graph API. If the request is successful, it logs a success message. If the request fails, it logs the error message.

```dart
await MeetingRooms.bookMeetingRoom(event);
```
</details>

<details>
  <summary>Place</summary>

#### Fetch All Rooms

The `fetchAllRooms` method is used to fetch all the rooms from the Microsoft Graph API. It performs a GET request for the rooms. The request requires an authorization header with the bearer token. If the request is successful, it logs the rooms. If there's an error during the request, it logs an error message.

```dart
Future<List<Room>> rooms = Place.fetchAllRooms();
```

#### Fetch All Room Lists

The `fetchAllRoomLists` method is used to fetch all the room lists from the Microsoft Graph API. It performs a GET request for the room lists. The request requires an authorization header with the bearer token. If the request is successful, it logs the room lists. If there's an error during the request, it logs an error message.

```dart
Future<List<Room>> rooms = Place.fetchAllRooms();
```
</details>

