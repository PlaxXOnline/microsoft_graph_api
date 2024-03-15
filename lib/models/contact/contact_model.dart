import 'package:microsoft_graph_api/models/models.dart';

/// Represents a contact in the Microsoft Graph API.
class Contact {
  /// The name of the contact's assistant.
  final String? assistantName;

  /// The contact's birthday. The Timestamp type represents date and time information using
  /// ISO 8601 format and is always in UTC time. For example, midnight UTC on Jan 1, 2014 is
  /// 2014-01-01T00:00:00Z
  final DateTime? birthday;

  /// The contact's business address.
  final Address? businessAddress;

  /// The business home page of the contact.
  final String? businessHomePage;

  /// collection: The contact's business phone numbers.
  final List<String>? businessPhones;

  /// collection: The categories associated with the contact.
  final List<String>? categories;

  /// Identifies the version of the contact. Every time the contact is changed, ChangeKey changes
  /// as well. This allows Exchange to apply changes to the correct version of the object.
  final String? changeKey;

  /// collection: The names of the contact's children.
  final List<String>? children;

  /// The name of the contact's company.
  final String? companyName;

  /// The time the contact was created. The Timestamp type represents date and time information
  /// using ISO 8601 format and is always in UTC time. For example, midnight UTC on Jan 1, 2014
  /// is 2014-01-01T00:00:00Z
  final DateTime? createdDateTime;

  /// The contact's department.
  final String? department;

  /// The contact's display name. You can specify the display name in a create or update operation.
  /// Note that later updates to other properties may cause an automatically generated value to
  /// overwrite the displayName value you have specified. To preserve a pre-existing value, always
  /// include it as displayName in an update operation.
  final String? displayName;

  /// collection: The contact's email addresses.
  final List<EmailAddress>? emailAddresses;

  /// The name the contact is filed under.
  final String? fileAs;

  /// The contact's generation.
  final String? generation;

  /// The contact's given name.
  final String? givenName;

  /// The contact's home address.
  final Address? homeAddress;

  /// collection: The contact's home phone numbers.
  final List<String>? homePhones;

  /// The contact's unique identifier. By default, this value changes when the item is moved from
  /// one container (such as a folder or calendar) to another. To change this behavior, use the
  /// Prefer: IdType="ImmutableId" header. See Get immutable identifiers for Outlook resources for
  /// more information. Read-only.
  final String? id;

  /// collection: The contact's instant messaging (IM) addresses.
  final List<String>? imAddresses;

  /// The contact's initials.
  final String? initials;

  /// The contact’s job title.
  final String? jobTitle;

  /// The time the contact was modified. The Timestamp type represents date and time information
  /// using ISO 8601 format and is always in UTC time. For example, midnight UTC on Jan 1, 2014 is
  /// 2014-01-01T00:00:00Z
  final DateTime? lastModifiedDateTime;

  /// The name of the contact's manager.
  final String? manager;

  /// The contact's middle name.
  final String? middleName;

  /// The contact's mobile phone number.
  final String? mobilePhone;

  /// The contact's nickname.
  final String? nickName;

  /// The location of the contact's office.
  final String? officeLocation;

  /// Other addresses for the contact.
  final Address? otherAddress;

  /// The ID of the contact's parent folder.
  final String? parentFolderId;

  /// The user's notes about the contact.
  final String? personalNotes;

  /// The contact's profession.
  final String? profession;

  /// The name of the contact's spouse/partner.
  final String? spouseName;

  /// The contact's surname.
  final String? surname;

  /// The contact's title.
  final String? title;

  /// The phonetic Japanese company name of the contact.
  final String? yomiCompanyName;

  /// The phonetic Japanese given name (first name) of the contact.
  final String? yomiGivenName;

  /// The phonetic Japanese surname (last name) of the contact.
  final String? yomiSurname;

  Contact({
    this.assistantName,
    this.birthday,
    this.businessAddress,
    this.businessHomePage,
    this.businessPhones,
    this.categories,
    this.changeKey,
    this.children,
    this.companyName,
    this.createdDateTime,
    this.department,
    this.displayName,
    this.emailAddresses,
    this.fileAs,
    this.generation,
    this.givenName,
    this.homeAddress,
    this.homePhones,
    this.id,
    this.imAddresses,
    this.initials,
    this.jobTitle,
    this.lastModifiedDateTime,
    this.manager,
    this.middleName,
    this.mobilePhone,
    this.nickName,
    this.officeLocation,
    this.otherAddress,
    this.parentFolderId,
    this.personalNotes,
    this.profession,
    this.spouseName,
    this.surname,
    this.title,
    this.yomiCompanyName,
    this.yomiGivenName,
    this.yomiSurname,
  });

  /// Creates a new instance of [Contact] from a JSON object.
  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      assistantName: json['assistantName'],
      birthday: DateTime.tryParse(json['birthday'] ?? ''),
      businessAddress: json['businessAddress'] != null
          ? Address.fromJson(json['businessAddress'])
          : null,
      businessHomePage: json['businessHomePage'],
      businessPhones: toListStr(json['businessPhones']),
      categories: toListStr(json['categories']),
      changeKey: json['changeKey'],
      children: toListStr(json['children']),
      companyName: json['companyName'],
      createdDateTime: DateTime.tryParse(json['createdDateTime']),
      department: json['department'],
      displayName: json['displayName'],
      emailAddresses: json['emailAddresses'] == null
          ? null
          : (json['emailAddresses'] as List<dynamic>)
              .map((e) => EmailAddress.fromJson(e))
              .toList(),
      fileAs: json['fileAs'],
      generation: json['generation'],
      givenName: json['givenName'],
      homeAddress:
          json['homeAddress'] != null ? Address.fromJson(json['homeAddress']) : null,
      homePhones: toListStr(json['homePhones']),
      id: json['id'],
      imAddresses: toListStr(json['imAddresses']),
      initials: json['initials'],
      jobTitle: json['jobTitle'],
      lastModifiedDateTime: DateTime.tryParse(json['lastModifiedDateTime']),
      manager: json['manager'],
      middleName: json['middleName'],
      mobilePhone: json['mobilePhone'],
      nickName: json['nickName'],
      officeLocation: json['officeLocation'],
      otherAddress:
          json['otherAddress'] != null ? Address.fromJson(json['otherAddress']) : null,
      parentFolderId: json['parentFolderId'],
      personalNotes: json['personalNotes'],
      profession: json['profession'],
      spouseName: json['spouseName'],
      surname: json['surname'],
      title: json['title'],
      yomiCompanyName: json['yomiCompanyName'],
      yomiGivenName: json['yomiGivenName'],
      yomiSurname: json['yomiSurname'],
    );
  }

  static List<String> toListStr(final List<dynamic> list) =>
      list.whereType<String>().toList();

  /// Doesn't support setting null values for the properties.
  Contact copyWith({
    String? assistantName,
    DateTime? birthday,
    Address? businessAddress,
    String? businessHomePage,
    List<String>? businessPhones,
    List<String>? categories,
    String? changeKey,
    List<String>? children,
    String? companyName,
    DateTime? createdDateTime,
    String? department,
    String? displayName,
    List<EmailAddress>? emailAddresses,
    String? fileAs,
    String? generation,
    String? givenName,
    Address? homeAddress,
    List<String>? homePhones,
    String? id,
    List<String>? imAddresses,
    String? initials,
    String? jobTitle,
    DateTime? lastModifiedDateTime,
    String? manager,
    String? middleName,
    String? mobilePhone,
    String? nickName,
    String? officeLocation,
    Address? otherAddress,
    String? parentFolderId,
    String? personalNotes,
    String? profession,
    String? spouseName,
    String? surname,
    String? title,
    String? yomiCompanyName,
    String? yomiGivenName,
    String? yomiSurname,
  }) {
    return Contact(
      assistantName: assistantName ?? this.assistantName,
      birthday: birthday ?? this.birthday,
      businessAddress: businessAddress ?? this.businessAddress,
      businessHomePage: businessHomePage ?? this.businessHomePage,
      businessPhones: businessPhones ?? this.businessPhones,
      categories: categories ?? this.categories,
      changeKey: changeKey ?? this.changeKey,
      children: children ?? this.children,
      companyName: companyName ?? this.companyName,
      createdDateTime: createdDateTime ?? this.createdDateTime,
      department: department ?? this.department,
      displayName: displayName ?? this.displayName,
      emailAddresses: emailAddresses ?? this.emailAddresses,
      fileAs: fileAs ?? this.fileAs,
      generation: generation ?? this.generation,
      givenName: givenName ?? this.givenName,
      homeAddress: homeAddress ?? this.homeAddress,
      homePhones: homePhones ?? this.homePhones,
      id: id ?? this.id,
      imAddresses: imAddresses ?? this.imAddresses,
      initials: initials ?? this.initials,
      jobTitle: jobTitle ?? this.jobTitle,
      lastModifiedDateTime: lastModifiedDateTime ?? this.lastModifiedDateTime,
      manager: manager ?? this.manager,
      middleName: middleName ?? this.middleName,
      mobilePhone: mobilePhone ?? this.mobilePhone,
      nickName: nickName ?? this.nickName,
      officeLocation: officeLocation ?? this.officeLocation,
      otherAddress: otherAddress ?? this.otherAddress,
      parentFolderId: parentFolderId ?? this.parentFolderId,
      personalNotes: personalNotes ?? this.personalNotes,
      profession: profession ?? this.profession,
      spouseName: spouseName ?? this.spouseName,
      surname: surname ?? this.surname,
      title: title ?? this.title,
      yomiCompanyName: yomiCompanyName ?? this.yomiCompanyName,
      yomiGivenName: yomiGivenName ?? this.yomiGivenName,
      yomiSurname: yomiSurname ?? this.yomiSurname,
    );
  }

  @override
  String toString() => 'Contact(assistantName: $assistantName, birthday: $birthday, '
      'businessAddress: $businessAddress, businessHomePage: $businessHomePage, '
      'businessPhones: $businessPhones, categories: $categories, changeKey: $changeKey, '
      'children: $children, companyName: $companyName, createdDateTime: $createdDateTime, '
      'department: $department, displayName: $displayName, emailAddresses: $emailAddresses, '
      'fileAs: $fileAs, generation: $generation, givenName: $givenName, homeAddress: $homeAddress, '
      'homePhones: $homePhones, id: $id, imAddresses: $imAddresses, initials: $initials, '
      'jobTitle: $jobTitle, lastModifiedDateTime: $lastModifiedDateTime, manager: $manager, '
      'middleName: $middleName, mobilePhone: $mobilePhone, nickName: $nickName, '
      'officeLocation: $officeLocation, otherAddress: $otherAddress, '
      'parentFolderId: $parentFolderId, personalNotes: $personalNotes, profession: $profession, '
      'spouseName: $spouseName, surname: $surname, title: $title, '
      'yomiCompanyName: $yomiCompanyName, yomiGivenName: $yomiGivenName, yomiSurname: $yomiSurname'
      ')';
}
