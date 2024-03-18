# MSGraphAPI Class

[![pub package](https://img.shields.io/pub/v/microsoft_graph_api.svg)](https://pub.dev/packages/microsoft_graph_api) [![GitHub stars](https://img.shields.io/github/stars/PlaxXOnline/microsoft_graph_api.svg?style=social&label=Star)](https://github.com/PlaxXOnline/microsoft_graph_api)

The `MSGraphAPI` class serves as a primary point of interaction for working with Microsoft Graph API, providing easy access to various services like users, calendar, meeting rooms, and places.

## Properties
- `me`: An instance of the `Me` class for user-specific operations.
- `users`: An instance of the `Users` class for operations related to all users.
- `calendar`: An instance of the `Calendar` class for calendar-related operations.
- `meetingRooms`: An instance of the `MeetingRooms` class for operations related to meeting rooms.
- `place`: An instance of the `Place` class for place-related operations.
- `contacts`: An instance of the `Contacts` class for contacts-related operations.

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


#### Fetch Time Zones

The `fetchTimeZones` method fetches a list of time zones supported by the Microsoft Graph API. This function is asynchronous and returns a list of `TimeZone` objects.

The function sends a GET request to the Microsoft Graph API.

If the request is successful (HTTP status code 200), the function transforms the 'value' field from the response data into a list of `TimeZone` objects, which contains the time zones, and returns this list.

In case of an error (e.g., network error, invalid response data, etc.), the function throws an exception with an appropriate error message.


```dart
List<TimeZone> timeZones = await graphAPI.me.fetchTimeZones();
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

The `createCalendarEvent` method is used to create a calendar event via the Microsoft Graph API. It performs a POST request to create the calendar event. The request requires an authorization header with the bearer token. This method accepts a range of optional parameters representing various attributes of the event to be created.

The parameters include `id`, `createdDateTime`, `lastModifiedDateTime`, `isReminderOn`, `subject`, `bodyPreview`, `isAllDay`, `isOrganizer`, `startDateTime`, `endDateTime`, a list of `attendees`, and `organizer`.

If a parameter is provided, it's included in the data sent in the request. If `attendees` or `organizer` are provided, they're converted to JSON before being included in the request data.

The function tries to create a calendar event and returns a `Future` that completes with a `CalendarEvent` if the request was successful. If an error occurs during the request, an error message is logged and the error is rethrown.

```dart
await Calendar.createCalendarEvent(
    id: 'event1',
    createdDateTime: '2023-06-21T10:00:00.000Z',
    lastModifiedDateTime: '2023-06-21T10:00:00.000Z',
    isReminderOn: true,
    subject: 'Important Meeting',
    bodyPreview: 'Discussing project status',
    isAllDay: false,
    isOrganizer: true,
    startDateTime: '2023-06-22T10:00:00.000Z',
    endDateTime: '2023-06-22T12:00:00.000Z',
    attendees: [Attendee(name: 'John Doe', email: 'johndoe@example.com')],
    organizer: Organizer(name: 'Jane Doe', email: 'janedoe@example.com')
);
```

#### Fetch Calendars

The `fetchCalendars` method is used to fetch calendar objects from the Microsoft Graph API. It performs a GET request to obtain the calendars. The request requires an authorization header with the bearer token. This method accepts one optional parameter `userId` to specify whose calendars to fetch. If `userId` is not provided, the calendars of the current user will be fetched.

The function attempts to fetch the calendars and returns a `Future` that completes with a list of `Calendar` objects if the request was successful. If an error occurs during the request, it prints an error message and rethrows the error.



```dart
List<Calendar> myCalendars = await Calendar.fetchCalendars();
List<Calendar> usersCalendars = await Calendar.fetchCalendars(userId: 'UserId here');
```

#### Find Meeting Times

The findMeetingTimes method is used to suggest meeting times based on availability data from the Microsoft Graph API. It performs a POST request to fetch the suggested meeting times. The request requires an authorization header with the bearer token. This method accepts optional parameters including `userId`, `attendees`, `timeSlots`, `locationConstraint`, and `meetingDuration`.

The parameters work as follows:

`userId`: The ID of the user for whom to find meeting times. If not provided, the current user is assumed.
`attendees`: A list of attendees for the meeting.
`timeSlots`: A list of available time slots for the meeting.
`locationConstraint`: The constraints on the location of the meeting.
`meetingDuration`: The duration of the meeting.
The function creates a map from the provided parameters, converts it to JSON, and includes it in the body of the POST request. It then attempts to fetch the meeting time suggestions and returns a `Future that completes with a `MeetingTimeSuggestionsResult` object if the request was successful. If an error occurs during the request, it prints an error message and rethrows the error.



```dart
MeetingTimeSuggestionsResult otherUsersMeetingTimes = await Calendar.findMeetingTimes(
    userId: 'user1',
    attendees: [Attendee(name: 'John Doe', email: 'johndoe@example.com')],
    timeSlots: [TimeSlot(start: '2023-06-22T09:00:00.000Z', end: '2023-06-22T18:00:00.000Z')],
    locationConstraint: LocationConstraint(isRequired: false, suggestLocation: false),
    meetingDuration: 'PT1H' //The length of the meeting, denoted in ISO8601 format. For example, 1 hour is denoted as 'PT1H', where 'P' is the duration designator, 'T' is the time designator, and 'H' is the hour designator. Use M to indicate minutes for the duration; for example, 2 hours and 30 minutes would be 'PT2H30M'. If no meeting duration is specified, findMeetingTimes uses the default of 30 minutes.
);

MeetingTimeSuggestionsResult myMeetingTimes = await Calendar.findMeetingTimes(
attendees: [Attendee(name: 'John Doe', email: 'johndoe@example.com')],
timeSlots: [TimeSlot(start: '2023-06-22T09:00:00.000Z', end: '2023-06-22T18:00:00.000Z')],
locationConstraint: LocationConstraint(isRequired: false, suggestLocation: false),
meetingDuration: 'PT1H' //The length of the meeting, denoted in ISO8601 format. For example, 1 hour is denoted as 'PT1H', where 'P' is the duration designator, 'T' is the time designator, and 'H' is the hour designator. Use M to indicate minutes for the duration; for example, 2 hours and 30 minutes would be 'PT2H30M'. If no meeting duration is specified, findMeetingTimes uses the default of 30 minutes.
);
```

#### Get Free/Busy Schedule

The `getFreeBusySchedule method fetches the free/busy schedule of specific users from the Microsoft Graph API within a given date-time range.

This function is asynchronous and returns a `ScheduleResponse` object. It takes in four parameters:

1. `startTime`: The start date-time in ISO format to define the range for which to fetch the schedule.
2. `endTime`: The end date-time in ISO format to define the range for which to fetch the schedule.
3. `userId` (optional): The ID of the user for whom to fetch the schedule. If not provided, the function fetches the schedule for the currently authenticated user.
4. `timeZone` (optional): The time zone in which to return the schedule. If not provided, the function uses 'W. Europe Standard Time' as the default time zone.

5. The function sends a POST request to the Microsoft Graph API. The requested URL includes the user ID (if provided), and the request body includes the start and end times, the time zone, and an availability view interval of 60 minutes.

If the request is successful, the function transforms the response data into a `ScheduleResponse` object and returns this object.

In case of an error (e.g., network error, invalid response data, etc.), the function catches the exception, logs an appropriate error message, and rethrows the exception.


```dart
ScheduleResponse schedule = getFreeBusySchedule(
  '2023-06-21T10:00:00',
  '2023-06-21T16:00:00',
  'userID',
  TimeZone('W. Europe Standard Time'),
);
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
List<Room> rooms = Place.fetchAllRooms();
```

#### Fetch All Room Lists

The `fetchAllRoomLists` method is used to fetch all the room lists from the Microsoft Graph API. It performs a GET request for the room lists. The request requires an authorization header with the bearer token. If the request is successful, it logs the room lists. If there's an error during the request, it logs an error message.

```dart
List<Room> rooms = Place.fetchAllRooms();
```
</details>

<details>
  <summary>Contacts</summary>

#### List Contacts

The `listContacts` method is used to fetch contacts from the Microsoft Graph API. It performs a GET request for the contacts. The request requires an authorization header with the bearer token. If the request is successful, it logs the contacts. If there's an error during the request, it logs an error message.

It takes an optional folderId parameter, which specifies the ID of the folder from which to fetch the contacts. If not provided, the contacts are fetched from the default contacts folder.

It also takes an optional query parameter, which specifies the query string to filter the contacts. If not provided, all contacts are fetched.

```dart
List<Contact> contacts = Contacts.listContacts();
```

#### List Contact Folders

The `listContactFolders` method is used to fetch contact folders from the Microsoft Graph API. It performs a GET request for the contact folders. The request requires an authorization header with the bearer token. If the request is successful, it logs the contact folders. If there's an error during the request, it logs an error message.

```dart
List<ContactFolder> contactFolders = Contacts.listContactFolders();
```
</details>
