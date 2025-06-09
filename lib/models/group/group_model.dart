import 'package:json_annotation/json_annotation.dart';

part 'group_model.g.dart';

/// Represents a Microsoft 365 group in Microsoft Graph API.
@JsonSerializable()
class Group {
  /// The unique identifier for the group.
  final String? id;

  /// The display name for the group.
  final String? displayName;

  /// The mail address for the group.
  final String? mail;

  /// The mail nickname for the group.
  final String? mailNickname;

  /// The description of the group.
  final String? description;

  /// The visibility of the group. Options are: Private, Public, or HiddenMembership.
  final String? visibility;

  /// The renewal policy of the group.
  final String? groupLifecyclePolicy;

  /// The time when the group was created.
  final DateTime? createdDateTime;

  /// The classification of the group if available.
  final String? classification;

  /// Whether there are any external members in the group.
  final bool? hasExternalMembers;

  /// Email addresses for the group (SMTP addresses).
  final List<String>? proxyAddresses;

  /// The URL to use when accessing the group's mailbox.
  final String? mailboxSettings;

  /// Whether the group is archived.
  final bool? isArchived;

  /// Legal age group classification for the group.
  final String? legalAgeGroupClassification;

  /// Whether the group is subscribed to by the current user.
  final bool? isSubscribedByMail;

  /// Whether the group is a favorite.
  final bool? isFavorite;

  /// The timestamp when the group was last renewed.
  final DateTime? renewedDateTime;

  /// Security enabled status.
  final bool? securityEnabled;

  /// Security identifier.
  final String? securityIdentifier;
  
  /// Mail enabled status.
  final bool? mailEnabled;
  
  /// Themes.
  final List<String>? theme;

  /// Group types.
  final List<String>? groupTypes;

  /// Membership rule.
  final String? membershipRule;

  /// Whether membership rule is processed.
  final bool? membershipRuleProcessingState;

  /// Preferred data location.
  final String? preferredDataLocation;

  /// Preferred language.
  final String? preferredLanguage;

  Group({
    this.id,
    this.displayName,
    this.mail,
    this.mailNickname,
    this.description,
    this.visibility,
    this.groupLifecyclePolicy,
    this.createdDateTime,
    this.classification,
    this.hasExternalMembers,
    this.proxyAddresses,
    this.mailboxSettings,
    this.isArchived,
    this.legalAgeGroupClassification,
    this.isSubscribedByMail,
    this.isFavorite,
    this.renewedDateTime,
    this.securityEnabled,
    this.securityIdentifier,
    this.mailEnabled,
    this.theme,
    this.groupTypes,
    this.membershipRule,
    this.membershipRuleProcessingState,
    this.preferredDataLocation,
    this.preferredLanguage,
  });

  const Group.empty()
      : id = null,
        displayName = null,
        mail = null,
        mailNickname = null,
        description = null,
        visibility = null,
        groupLifecyclePolicy = null,
        createdDateTime = null,
        classification = null,
        hasExternalMembers = null,
        proxyAddresses = null,
        mailboxSettings = null,
        isArchived = null,
        legalAgeGroupClassification = null,
        isSubscribedByMail = null,
        isFavorite = null,
        renewedDateTime = null,
        securityEnabled = null,
        securityIdentifier = null,
        mailEnabled = null,
        theme = null,
        groupTypes = null,
        membershipRule = null,
        membershipRuleProcessingState = null,
        preferredDataLocation = null,
        preferredLanguage = null;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
