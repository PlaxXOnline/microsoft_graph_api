import 'package:flutter/material.dart';
import 'package:microsoft_graph_api/microsoft_graph_api.dart';
import 'package:microsoft_graph_api/models/models.dart';

class Example {
  MSGraphAPI graphAPI = MSGraphAPI('Your Microsoft Graph API token here');

  /*-----------------------------Me--------------------------------*/
  _me() async {
    User user = await graphAPI.me.fetchUserInfo();
    bool result =
        await graphAPI.me.changePassword('BadPassword', 'AlsoBadPassword');
    ImageProvider image = await graphAPI.me
        .fetchUserProfileImage(PhotoSize().getPicSize(PhotoSizeEnum.size48x48));

    List<Map<String, dynamic>> meNotebooks =
        await graphAPI.me.fetchOneNoteNotebooks();
  }

  _users() async {
    User user = await graphAPI.users.fetchSpecificUserInfo('UserIDHere');
    User newUser = await graphAPI.users.createUser(
        'displayName', 'mailNickname', 'userPrincipalName', 'password');
    bool isDeleted = await graphAPI.users.deleteUser('UserIDHere');

    List<Map<String, dynamic>> usersNotebooks =
        await graphAPI.users.fetchOneNoteNotebooksForUser('userIdOrPrincipal');

    // BETA
    List<Room> userRooms = await graphAPI.users.fetchAllUserRooms();
  }

  _calendar() async {
    DateTime startDateTime = DateTime.now();
    DateTime endDateTime = DateTime.now().add(const Duration(days: 7));

    List<CalendarEvent> calendarEventsInRange = await graphAPI.calendars
        .fetchCalendarEventsForRange(startDateTime, endDateTime);

    CalendarEvent response = await graphAPI.calendars.createCalendarEvent(
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
      attendees: [
        Attendee(
          type: 'required',
          status: Status(
            response: 'none',
            time: '0001-01-01T00:00:00Z',
          ),
          emailAddress: EmailAddress(
            name: 'John Doe',
            address: 'johndoe@example.com',
          ),
        ),
      ],
      organizer: Organizer(
        emailAddress: EmailAddress(
          name: 'Jane Doe',
          address: 'janedoe@example.com',
        ),
      ),
    );

    List<Calendar> myCalendar = await graphAPI.calendars.fetchCalendars();
    List<Calendar> userCalendars =
        await graphAPI.calendars.fetchCalendars(userId: 'user1');
  }

  _place() async {
    List<Room> rooms = await graphAPI.places.fetchAllRooms();
    List<RoomList> roomLists = await graphAPI.places.fetchAllRoomLists();
  }

  _contact() async {
    List<Contact> contacts = await graphAPI.contacts.fetchContacts();
    List<ContactFolder> contactFolders = await graphAPI.contacts.fetchContactFolders();
  }
  
  /*-----------------------------Mail--------------------------------*/
  _mail() async {
    // Fetch mail folders
    List<MailFolder> folders = await graphAPI.mail.getMailFolders();
    
    // Fetch messages from inbox
    List<Message> messages = await graphAPI.mail.getMessages(top: 10);
    
    // Send a new email
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
      importance: 'normal',
    );
    
    bool sent = await graphAPI.mail.sendMail(newMessage);
    
    // Create a draft message
    Message draft = await graphAPI.mail.createDraft(newMessage);
    
    // Search for emails
    List<Message> searchResults = await graphAPI.mail.searchMessages('important meeting');
    
    // Work with attachments (if we have a message with an ID)
    if (messages.isNotEmpty && messages[0].id != null) {
      String messageId = messages[0].id!;
      
      // Get attachments for a message
      List<Attachment> attachments = await graphAPI.mail.getAttachments(messageId);
      
      // Mark a message as read
      await graphAPI.mail.markAsRead(messageId, true);
    }
  }
}
