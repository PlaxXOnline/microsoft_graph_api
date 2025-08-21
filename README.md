# MSGraphAPI Class

[![pub package](https://img.shields.io/pub/v/microsoft_graph_api.svg)](https://pub.dev/packages/microsoft_graph_api) [![GitHub stars](https://img.shields.io/github/stars/PlaxXOnline/microsoft_graph_api.svg?style=social&label=Star)](https://github.com/PlaxXOnline/microsoft_graph_api)

The `MSGraphAPI` class serves as a primary point of interaction for working with Microsoft Graph API, providing easy access to various services like users, calendar, meeting rooms, and places.

## Properties
- `me`: An instance of the `Me` class for user-specific operations.
- `users`: An instance of the `Users` class for operations related to all users.
- `calendar`: An instance of the `Calendar` class for calendar-related operations.
- `meetingRooms`: An instance of the `MeetingRooms` class for operations related to meeting rooms.
- `place`: An instance of the `Place` class for place-related operations.
- `notes`: An instance of the `Notes` class for notes-related operations.
- `contacts`: An instance of the `Contacts` class for contacts-related operations.
- `mail`: An instance of the `Mail` class for email-related operations.
- `group`: An instance of the `GroupAPI` class for Microsoft 365 Groups operations.
- `drive`: An instance of the `DriveAPI` class for OneDrive files and folders operations.
- `planner`: An instance of the `PlannerAPI` class for Microsoft Planner operations.
- `todo`: An instance of the `TodoAPI` class for Microsoft To Do operations.

## Constructor
The constructor takes a string parameter, `_token`, which represents the authentication token for accessing Microsoft Graph API. It initializes instances of `Me`, `Users`, `Calendar`, `MeetingRooms`, `Place`, `Notes`, `Contacts`, `Mail`, `Group`, `Drive`, `Planner`, and `Todo` classes.

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
  <summary>Todo</summary>

### Task Lists

#### Get All Task Lists

The `getTaskLists` method retrieves all To Do task lists for the current user.

```dart
List<TodoTaskList> taskLists = await graphAPI.todo.getTaskLists();
```

#### Get Task List

The `getTaskList` method retrieves a specific task list by its ID.

```dart
TodoTaskList taskList = await graphAPI.todo.getTaskList(taskListId);
```

#### Create Task List

The `createTaskList` method creates a new task list.

```dart
TodoTaskListCreateRequest request = TodoTaskListCreateRequest(
  displayName: 'My New Tasks',
);
TodoTaskList newTaskList = await graphAPI.todo.createTaskList(request);
```

#### Update Task List

The `updateTaskList` method updates an existing task list.

```dart
TodoTaskListUpdateRequest request = TodoTaskListUpdateRequest(
  displayName: 'Updated Task List Name',
);
TodoTaskList updatedTaskList = await graphAPI.todo.updateTaskList(taskListId, request);
```

#### Delete Task List

The `deleteTaskList` method deletes a task list.

```dart
bool success = await graphAPI.todo.deleteTaskList(taskListId);
```

### Tasks

#### Get All Tasks

The `getTasks` method retrieves all tasks in a specific task list.

```dart
List<TodoTask> tasks = await graphAPI.todo.getTasks(taskListId);
```

#### Get Task

The `getTask` method retrieves a specific task by its ID.

```dart
TodoTask task = await graphAPI.todo.getTask(taskListId, taskId);
```

#### Create Task

The `createTask` method creates a new task in a task list.

```dart
TodoTaskCreateRequest request = TodoTaskCreateRequest(
  title: 'Complete documentation',
  dueDateTime: DateTime.now().add(Duration(days: 1)),
);
TodoTask newTask = await graphAPI.todo.createTask(taskListId, request);
```

#### Update Task

The `updateTask` method updates an existing task.

```dart
TodoTaskUpdateRequest request = TodoTaskUpdateRequest(
  title: 'Updated task title',
  importance: 'high',
);
TodoTask updatedTask = await graphAPI.todo.updateTask(taskListId, taskId, request);
```

#### Delete Task

The `deleteTask` method deletes a task.

```dart
bool success = await graphAPI.todo.deleteTask(taskListId, taskId);
```

#### Complete Task

The `completeTask` method marks a task as completed.

```dart
TodoTask completedTask = await graphAPI.todo.completeTask(taskListId, taskId);
```

### Linked Resources

#### Get Linked Resources

The `getLinkedResources` method retrieves all linked resources for a task.

```dart
List<LinkedResource> resources = await graphAPI.todo.getLinkedResources(taskListId, taskId);
```

#### Create Linked Resource

The `createLinkedResource` method creates a new linked resource for a task.

```dart
LinkedResourceCreateRequest request = LinkedResourceCreateRequest(
  webUrl: 'https://example.com/resource',
  applicationName: 'Browser',
  displayName: 'Example Resource',
);
LinkedResource newResource = await graphAPI.todo.createLinkedResource(taskListId, taskId, request);
```

#### Delete Linked Resource

The `deleteLinkedResource` method deletes a linked resource from a task.

```dart
bool success = await graphAPI.todo.deleteLinkedResource(taskListId, taskId, linkedResourceId);
```
</details>

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

The `fetchUserProfileImage` method is used to fetch the user's profile image from the Microsoft Graph API. The method sends a GET request and requires a `size` parameter, which specifies the desired size of the image. It returns a `Future<Uint8List>` object representing the user's profile image as bytes. If calling from Flutter, you can wrap the image in an `ImageProvider` such as `MemoryImage`.

```dart
Uint8List image = await graphAPI.me.fetchUserProfileImage(size);
```


#### Fetch Time Zones

The `fetchTimeZones` method fetches a list of time zones supported by the Microsoft Graph API. This function is asynchronous and returns a list of `TimeZone` objects.

The function sends a GET request to the Microsoft Graph API.

If the request is successful (HTTP status code 200), the function transforms the 'value' field from the response data into a list of `TimeZone` objects, which contains the time zones, and returns this list.

In case of an error (e.g., network error, invalid response data, etc.), the function throws an exception with an appropriate error message.


```dart
List<TimeZone> timeZones = await graphAPI.me.fetchTimeZones();
```


#### Fetch OneNote Notebooks

The fetchOneNoteNotebooks` method is designed to retrieve all OneNote notebooks associated with the authenticated user from the Microsoft Graph API. It carries out a GET request for these notebooks. An authorization header with the bearer token is essential for this request. If the request concludes successfully, it returns a list of notebooks. In the event of an error during the request, an error message is logged.

```dart
List<Map<String, dynamic>> notebooks = await fetchOneNoteNotebooks();
```


#### Create OneNote Notebook

The `createOneNoteNotebook` method is tailored to establish a new OneNote notebook for the authenticated user via the Microsoft Graph API. It conducts a POST request to generate the notebook, specifying its name. An authorization header, accompanied by the bearer token, is pivotal for this request. If the request culminates successfully, the method yields the created notebook, encapsulating its attributes in a map. Conversely, if any complications arise during the request, an error message is duly logged.

```dart
Map<String, dynamic> newNotebook = await createOneNoteNotebook("My New Notebook");
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

#### Fetch OneNote Notebooks for a Specific User

The `fetchOneNoteNotebooksForUser` method aims to obtain OneNote notebooks associated with a specific user, identified by their ID or userPrincipalName, from the Microsoft Graph API. This method executes a GET request for the notebooks of the specified user. The request mandates an authorization header with the bearer token. When the request is successful, it yields a list of notebooks for that user. If any error arises during the request, an error message is logged.

```dart
List<Map<String, dynamic>> userNotebooks = await fetchOneNoteNotebooksForUser(userIdOrPrincipal);
```

#### Create OneNote Notebook for a Specific User

The `createOneNoteNotebookForUser` method is devised to fabricate a new OneNote notebook for a distinct user, discerned by their ID or userPrincipalName, through the Microsoft Graph API. This method initiates a POST request to engender the notebook for the designated user, denoting its name. The request is contingent on an authorization header with the bearer token. Upon a successful request, the method proffers the freshly created notebook, representing its properties in a map. Should there be any disruptions during the request, an error message is chronicled.

```dart
Map<String, dynamic> userSpecificNotebook = await createOneNoteNotebookForUser(userIdOrPrincipal, "User's Private Notebook");
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

The `bookMeetingRoom` method is used to book a meeting room by creating a new event. It requires a `CalendarEvent` parameter representing the event to be created. This event should represent the booking of the meeting room. The method sends a POST request to the Microsoft Graph API. If the request is successful, it logs a success message. If the request fails, it logs the error message.

```dart
await MeetingRooms.bookMeetingRoom(CalendarEvent event);
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
  <summary>Notes</summary>

#### You can find this Information split in Me and Users.

#### Fetch OneNote Notebooks

The fetchOneNoteNotebooks` method is designed to retrieve all OneNote notebooks associated with the authenticated user from the Microsoft Graph API. It carries out a GET request for these notebooks. An authorization header with the bearer token is essential for this request. If the request concludes successfully, it returns a list of notebooks. In the event of an error during the request, an error message is logged.

```dart
List<Map<String, dynamic>> notebooks = await fetchOneNoteNotebooks();
```


#### Create OneNote Notebook

The `createOneNoteNotebook` method is tailored to establish a new OneNote notebook for the authenticated user via the Microsoft Graph API. It conducts a POST request to generate the notebook, specifying its name. An authorization header, accompanied by the bearer token, is pivotal for this request. If the request culminates successfully, the method yields the created notebook, encapsulating its attributes in a map. Conversely, if any complications arise during the request, an error message is duly logged.

```dart
Map<String, dynamic> newNotebook = await createOneNoteNotebook("My New Notebook");
```

#### Fetch OneNote Notebooks for a Specific User

The `fetchOneNoteNotebooksForUser` method aims to obtain OneNote notebooks associated with a specific user, identified by their ID or userPrincipalName, from the Microsoft Graph API. This method executes a GET request for the notebooks of the specified user. The request mandates an authorization header with the bearer token. When the request is successful, it yields a list of notebooks for that user. If any error arises during the request, an error message is logged.

```dart
List<Map<String, dynamic>> userNotebooks = await fetchOneNoteNotebooksForUser(userIdOrPrincipal);
```

#### Create OneNote Notebook for a Specific User

The `createOneNoteNotebookForUser` method is devised to fabricate a new OneNote notebook for a distinct user, discerned by their ID or userPrincipalName, through the Microsoft Graph API. This method initiates a POST request to engender the notebook for the designated user, denoting its name. The request is contingent on an authorization header with the bearer token. Upon a successful request, the method proffers the freshly created notebook, representing its properties in a map. Should there be any disruptions during the request, an error message is chronicled.

```dart
Map<String, dynamic> userSpecificNotebook = await createOneNoteNotebookForUser(userIdOrPrincipal, "User's Private Notebook");
```

</details>
<details>
  <summary>Contacts</summary>

#### List Contacts

The `listContacts` method is used to fetch contacts from the Microsoft Graph API. It performs a GET request for the contacts. The request requires an authorization header with the bearer token. If the request is successful, it logs the contacts. If there's an error during the request, it logs an error message.

It takes an optional folderId parameter, which specifies the ID of the folder from which to fetch the contacts. If not provided, the contacts are fetched from the default contacts folder.

Paging is internally handled by the method.

It also takes an optional query parameter, which specifies the query string to filter the contacts. If not provided, all contacts are fetched.

```dart
List<Contact> contacts = await Contacts.listContacts();
```

#### List Contact Folders

The `listContactFolders` method is used to fetch contact folders from the Microsoft Graph API. It performs a GET request for the contact folders. The request requires an authorization header with the bearer token. If the request is successful, it logs the contact folders. If there's an error during the request, it logs an error message.

```dart
List<ContactFolder> contactFolders = await Contacts.listContactFolders();
```
</details>

<details>
  <summary>Mail</summary>

#### Get Mail Folders

The `getMailFolders` method fetches all mail folders from the Microsoft Graph API. It returns a list of `MailFolder` objects.

```dart
List<MailFolder> folders = await graphAPI.mail.getMailFolders();
```

#### Get Messages

The `getMessages` method retrieves emails from a specified folder or from the inbox if no folder is specified. This method supports filtering and pagination.

```dart
// Get messages from inbox
List<Message> messages = await graphAPI.mail.getMessages();

// Get messages from a specific folder
List<Message> messages = await graphAPI.mail.getMessages(folderId: 'folderIdHere');

// Get filtered messages
List<Message> messages = await graphAPI.mail.getMessages(filter: 'isRead eq false');
```

#### Send Email

The `sendMail` method sends a new email message.

```dart
MessageCreateRequest newMessage = MessageCreateRequest(
  subject: 'Test Subject',
  body: ItemBody(
    contentType: 'HTML',
    content: '<p>This is a test email body.</p>',
  ),
  toRecipients: [
    Recipient(
      emailAddress: EmailAddress(
        name: 'John Doe',
        address: 'johndoe@example.com',
      ),
    ),
  ],
);

bool success = await graphAPI.mail.sendMail(newMessage);
```

#### Create Draft

The `createDraft` method creates a draft message that can be edited or sent later.

```dart
Message draft = await graphAPI.mail.createDraft(messageRequest);
```

#### Search Messages

The `searchMessages` method allows searching for messages that match a query string.

```dart
List<Message> results = await graphAPI.mail.searchMessages('important meeting');
```

#### Working with Attachments

Get attachments for a message:

```dart
List<Attachment> attachments = await graphAPI.mail.getAttachments(messageId);
```

Add an attachment to a message:

```dart
Attachment attachment = await graphAPI.mail.addAttachment(
  messageId,
  'file.txt',
  base64Content,
  'text/plain'
);
```

#### Additional Operations

The Mail API also provides methods for moving messages, setting flags, updating message properties, and more. Some examples:

```dart
// Mark a message as read/unread
await graphAPI.mail.markAsRead(messageId, true);

// Move a message to a different folder
Message movedMessage = await graphAPI.mail.moveMessage(messageId, targetFolderId);

// Set a flag on a message
await graphAPI.mail.setFlag(messageId, 'flagged');

// Delete a message
bool deleted = await graphAPI.mail.deleteMessage(messageId);
```

</details>

<details>
  <summary>Groups</summary>

#### Get All Groups

The `getGroups` method fetches all Microsoft 365 groups the authenticated user is a member of.

```dart
List<Group> groups = await graphAPI.group.getGroups();
```

#### Get Specific Group

The `getGroup` method retrieves a specific group by its ID.

```dart
Group group = await graphAPI.group.getGroup(groupId);
```

#### Create Group

The `createGroup` method creates a new Microsoft 365 group.

```dart
GroupCreateRequest request = GroupCreateRequest(
  displayName: 'Marketing Team',
  mailNickname: 'marketing',
  description: 'Group for marketing team collaboration',
  mailEnabled: true,
  securityEnabled: false,
  groupTypes: ['Unified']
);

Group newGroup = await graphAPI.group.createGroup(request);
```

#### Update and Delete Groups

The Group API provides methods for updating and deleting groups:

```dart
// Update a group's properties
bool updated = await graphAPI.group.updateGroup(groupId, {
  'description': 'Updated description for the marketing team'
});

// Delete a group
bool deleted = await graphAPI.group.deleteGroup(groupId);
```

#### Group Members Management

Manage members of a group with these methods:

```dart
// Get all members of a group
List<GroupMember> members = await graphAPI.group.getGroupMembers(groupId);

// Add a member to a group
bool added = await graphAPI.group.addGroupMember(groupId, userId);

// Remove a member from a group
bool removed = await graphAPI.group.removeGroupMember(groupId, userId);
```

#### Group Conversations and Posts

Work with group conversations, threads, and posts:

```dart
// Get conversations in a group
List<GroupConversation> conversations = await graphAPI.group.getGroupConversations(groupId);

// Create a new conversation
ConversationCreateRequest convRequest = ConversationCreateRequest(
  topic: 'Project Discussion',
  message: '<p>Let\'s discuss the new project timeline.</p>'
);

GroupConversation newConversation = await graphAPI.group.createGroupConversation(
  groupId, 
  convRequest
);

// Get threads in a conversation
List<ConversationThread> threads = await graphAPI.group.getConversationThreads(
  groupId, 
  conversationId
);

// Get posts in a thread
List<Post> posts = await graphAPI.group.getThreadPosts(
  groupId, 
  conversationId, 
  threadId
);

// Create a post in a thread
PostCreateRequest postRequest = PostCreateRequest(
  body: ItemBody(
    contentType: 'HTML',
    content: '<p>I agree with the proposed timeline.</p>'
  )
);

Post newPost = await graphAPI.group.createPost(
  groupId, 
  conversationId, 
  threadId, 
  postRequest
);
```

#### Group Lifecycle Policies

Manage group lifecycle policies with these methods:

```dart
// Get all lifecycle policies
List<GroupLifecyclePolicy> policies = await graphAPI.group.getGroupLifecyclePolicies();

// Add a policy to a group
bool added = await graphAPI.group.addLifecyclePolicyToGroup(groupId, policyId);

// Remove a policy from a group
bool removed = await graphAPI.group.removeLifecyclePolicyFromGroup(groupId, policyId);
```

</details>

<details>
  <summary>OneDrive/Files</summary>

#### Get Drives

The `getDrives` method fetches all available drives for the authenticated user.

```dart
List<Drive> drives = await graphAPI.drive.getDrives();
```

#### Get Default Drive

The `getDefaultDrive` method retrieves information about the authenticated user's default drive.

```dart
Drive drive = await graphAPI.drive.getDefaultDrive();
```

#### List Items in a Folder

The `listItems` method retrieves files and folders within a specified folder.

```dart
// List items in the root folder of default drive
List<DriveItem> items = await graphAPI.drive.listItems();

// List items in a specific folder
List<DriveItem> folderItems = await graphAPI.drive.listItems(folderId: 'folderId');

// List items in a specific drive
List<DriveItem> driveItems = await graphAPI.drive.listItems(driveId: 'driveId');
```

#### Get Item by ID or Path

Retrieve a specific file or folder by its ID or path:

```dart
// Get by ID
DriveItem item = await graphAPI.drive.getItem('itemId');

// Get by path
DriveItem documentItem = await graphAPI.drive.getItemByPath('/Documents/Report.docx');
```

#### Create a Folder

The `createFolder` method creates a new folder in the specified location:

```dart
DriveItem newFolder = await graphAPI.drive.createFolder(
  'Projects',
  parentFolderId: 'folderId', // 'root' is default
);
```

#### Upload Files

Upload small files (less than 4MB):

```dart
DriveItem uploadedFile = await graphAPI.drive.uploadSmallFile(
  'document.txt',
  fileContent, // Uint8List of file content
  contentType: 'text/plain'
);
```

For larger files, create an upload session:

```dart
UploadSession session = await graphAPI.drive.createUploadSession(
  'large-video.mp4',
  parentFolderId: 'folderId'
);

// Use the uploadUrl property from the session to upload the file in chunks
```

#### Download Files

The `downloadFile` method downloads a file's content:

```dart
Uint8List fileContent = await graphAPI.drive.downloadFile('fileId');
```

#### Move and Copy Items

Move files and folders:

```dart
DriveItem movedItem = await graphAPI.drive.moveItem(
  'itemId',
  'newParentFolderId',
  newName: 'newFileName.txt' // Optional rename during move
);
```

Copy files and folders:

```dart
bool copyStarted = await graphAPI.drive.copyItem(
  'itemId',
  'destinationFolderId'
);
```

#### Delete Items

Delete files or folders:

```dart
bool deleted = await graphAPI.drive.deleteItem('itemId');
```

#### Search for Items

Search for files and folders across a drive:

```dart
List<DriveItem> searchResults = await graphAPI.drive.searchItems('project proposal');
```

#### Get Thumbnails

Retrieve thumbnails for image files:

```dart
ThumbnailSet thumbnails = await graphAPI.drive.getThumbnails('imageFileId');

// Access specific sizes
String smallThumbnailUrl = thumbnails.small.url;
String mediumThumbnailUrl = thumbnails.medium.url;
String largeThumbnailUrl = thumbnails.large.url;
```

</details>

<details>
  <summary>Planner</summary>

#### Get Plans

The `getPlans` method fetches all plans the authenticated user has access to.

```dart
List<Plan> plans = await graphAPI.planner.getPlans();
```

#### Get Group Plans

The `getGroupPlans` method fetches all plans for a specific Microsoft 365 Group.

```dart
List<Plan> groupPlans = await graphAPI.planner.getGroupPlans('groupId');
```

#### Get Plan Details

Retrieve details about a specific plan:

```dart
Plan plan = await graphAPI.planner.getPlan('planId');
PlanDetails details = await graphAPI.planner.getPlanDetails('planId');
```

#### Create a Plan

Create a new plan in a Microsoft 365 Group:

```dart
PlanCreateRequest request = PlanCreateRequest(
  title: 'Q4 Project Plan',
  owner: 'groupId' // ID of the Microsoft 365 Group
);

Plan newPlan = await graphAPI.planner.createPlan(request);
```

#### Update a Plan

Update an existing plan (requires ETag for concurrency control):

```dart
PlanUpdateRequest updateRequest = PlanUpdateRequest(
  title: 'Updated Plan Title'
);

Plan updatedPlan = await graphAPI.planner.updatePlan(
  'planId',
  updateRequest,
  'plan-etag-value'
);
```

#### Tasks in a Plan

Get all tasks in a plan:

```dart
List<PlannerTask> tasks = await graphAPI.planner.getPlanTasks('planId');
```

Get a specific task and its details:

```dart
PlannerTask task = await graphAPI.planner.getTask('taskId');
PlannerTaskDetails taskDetails = await graphAPI.planner.getTaskDetails('taskId');
```

#### Create a Task

Create a new task in a plan:

```dart
TaskCreateRequest taskRequest = TaskCreateRequest(
  title: 'Complete API integration',
  planId: 'planId',
  bucketId: 'bucketId', // The bucket/column the task belongs to
  dueDateTime: '2023-12-15T17:00:00Z',
  priority: 5 // 0-10, higher means higher priority
);

PlannerTask newTask = await graphAPI.planner.createTask(taskRequest);
```

#### Update a Task

Update a task (requires ETag for concurrency control):

```dart
TaskUpdateRequest updateRequest = TaskUpdateRequest(
  title: 'Updated task title',
  percentComplete: 50,
  priority: 8
);

PlannerTask updatedTask = await graphAPI.planner.updateTask(
  'taskId',
  updateRequest,
  'task-etag-value'
);
```

#### Assign a Task

Assign a task to a user:

```dart
bool assigned = await graphAPI.planner.assignTask(
  'taskId',
  'userId',
  'task-etag-value'
);
```

#### Delete a Task

Delete a task:

```dart
bool deleted = await graphAPI.planner.deleteTask('taskId', 'task-etag-value');
```

#### Buckets (Columns)

Get all buckets in a plan:

```dart
List<PlannerBucket> buckets = await graphAPI.planner.getPlanBuckets('planId');
```

Create a new bucket:

```dart
BucketCreateRequest bucketRequest = BucketCreateRequest(
  name: 'In Progress',
  planId: 'planId'
);

PlannerBucket newBucket = await graphAPI.planner.createBucket(bucketRequest);
```

Update a bucket:

```dart
BucketUpdateRequest updateRequest = BucketUpdateRequest(
  name: 'Updated Bucket Name'
);

PlannerBucket updatedBucket = await graphAPI.planner.updateBucket(
  'bucketId',
  updateRequest,
  'bucket-etag-value'
);
```

Delete a bucket:

```dart
bool deleted = await graphAPI.planner.deleteBucket('bucketId', 'bucket-etag-value');
```

</details>


## Contributors

<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://www.github.com/PlaxXOnline"><img src="https://avatars.githubusercontent.com/u/62539586?v=4?s=100" width="100px;" alt="Janik Kahle"/><br /><sub><b>Janik Kahle</b></sub></a><br /><a href="https://github.com/PlaxXOnline/microsoft_graph_api/commits?author=PlaxXOnline" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Noahbanderson"><img src="https://avatars.githubusercontent.com/u/52230969?v=4?s=100" width="100px;" alt="Noah Anderson"/><br /><sub><b>Noah Anderson</b></sub></a><br /><a href="https://github.com/PlaxXOnline/microsoft_graph_api/commits?author=Noahbanderson" title="Code">💻</a></td>
    </tr>
  </tbody>
</table>


