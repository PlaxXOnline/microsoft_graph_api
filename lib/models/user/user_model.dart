class User {
  final List<String> businessPhones;
  final String displayName;
  final String givenName;
  final String jobTitle;
  final String mail;
  final String mobilePhone;
  final String officeLocation;
  final String preferredLanguage;
  final String surname;
  final String userPrincipalName;
  final String id;

  User({
    required this.businessPhones,
    required this.displayName,
    required this.givenName,
    required this.jobTitle,
    required this.mail,
    required this.mobilePhone,
    required this.officeLocation,
    required this.preferredLanguage,
    required this.surname,
    required this.userPrincipalName,
    required this.id,
  });

  const User.empty()
      : businessPhones = const [],
        displayName = '',
        givenName = '',
        jobTitle = '',
        mail = '',
        mobilePhone = '',
        officeLocation = '',
        preferredLanguage = '',
        surname = '',
        userPrincipalName = '',
        id = '';

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      businessPhones: List<String>.from(json['businessPhones'] ?? []),
      displayName: json['displayName'] ?? '',
      givenName: json['givenName'] ?? '',
      jobTitle: json['jobTitle'] ?? '',
      mail: json['mail'] ?? '',
      mobilePhone: json['mobilePhone'] ?? '',
      officeLocation: json['officeLocation'] ?? '',
      preferredLanguage: json['preferredLanguage'] ?? '',
      surname: json['surname'] ?? '',
      userPrincipalName: json['userPrincipalName'] ?? '',
      id: json['id'] ?? '',
    );
  }

  User copyWith({
    List<String>? businessPhones,
    String? displayName,
    String? givenName,
    String? jobTitle,
    String? mail,
    String? mobilePhone,
    String? officeLocation,
    String? preferredLanguage,
    String? surname,
    String? userPrincipalName,
    String? id,
  }) {
    return User(
      businessPhones: businessPhones ?? this.businessPhones,
      displayName: displayName ?? this.displayName,
      givenName: givenName ?? this.givenName,
      jobTitle: jobTitle ?? this.jobTitle,
      mail: mail ?? this.mail,
      mobilePhone: mobilePhone ?? this.mobilePhone,
      officeLocation: officeLocation ?? this.officeLocation,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      surname: surname ?? this.surname,
      userPrincipalName: userPrincipalName ?? this.userPrincipalName,
      id: id ?? this.id,
    );
  }
}
