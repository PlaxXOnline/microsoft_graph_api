## 0.0.14

* mail functions can now take an optional username or user id to perform the action on behalf of.
* fixed bug in create request model which inadvertently included an invalid value to the JSON data.

## 0.0.13

* decoupled library from Flutter allowing its use in pure Dart applications
* `fetchUserProfileImage` method now returns a `Uint8List` rather than an `ImageProvider`

## 0.0.12

* added Microsoft To Do API functionality for task management
* implemented TodoAPI class with comprehensive task list and task operations
* added Todo model classes with proper JSON serialization
* implemented linked resources functionality for tasks
* improved error handling with consistent exception patterns

## 0.0.11

* added Microsoft Planner API functionality for task management
* implemented PlannerAPI class with comprehensive plan, task, and bucket operations
* added Planner model classes with proper JSON serialization
* updated README with Planner API documentation

## 0.0.10

* added OneDrive/Files API functionality for file management in Microsoft Graph
* implemented DriveAPI class with comprehensive file and folder operations
* added Drive model classes with proper JSON serialization
* updated README with OneDrive/Files API documentation

## 0.0.9

* added Group API functionality for Microsoft 365 Groups
* refactored Mail models from a single file into separate files with proper JSON serialization
* improved code organization and maintainability
* updated README with comprehensive Group API documentation

## 0.0.8

* added Mail API functionality (messages, mail folders, attachments)
* implemented complete Mail functionality as per Microsoft Graph API documentation
* fixed EmailAddress model to reuse existing model from calendar module
* updated Readme and example with Mail functionality

## 0.0.7

* added Permissions Table in Method Dart Doc
* updated Readme
* added Contacts and ContactFolders Endpoints and Models

## 0.0.6

* added Endpoints to Create Notebooks
* updated Readme

## 0.0.5

* added Notes Endpoints and Models

## 0.0.4

* changed DartDocs for particular Methods

## 0.0.3

* added getFreeBusySchedule Method for own Schedules and also for other users Schedules
* added fetchTimeZones Method for own supported Timezones
* added DartDoc Comments for all Models

## 0.0.2

* added example file
* added toJson Methods to Calendar Models
* changed createCalendarEvent Method
* added fetchCalendar Method for own calendar and also for other users calendars
* added more Calendar related Models
* added findMeetingTime Method for own Times and also for other users Times

## 0.0.1

* Initial Open Source release.
