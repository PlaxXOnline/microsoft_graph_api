import 'package:microsoft_graph_api/models/models.dart';

class Notebook {
  final User? createdBy;
  final String? createdDateTime;
  final String? id;
  final bool? isDefault;
  final bool? isShared;
  final User? lastModifiedBy;
  final String? lastModifiedDateTime;
  final List<String>? links;
  final String? displayName;
  final String? sectionGroupsUrl;
  final String? sectionsUrl;
  final String? self;
  final String? userRole;

  Notebook({
    this.createdBy,
    this.createdDateTime,
    this.id,
    this.isDefault,
    this.isShared,
    this.lastModifiedBy,
    this.lastModifiedDateTime,
    this.links,
    this.displayName,
    this.sectionGroupsUrl,
    this.sectionsUrl,
    this.self,
    this.userRole,
  });

  Notebook copyWith({
    User? createdBy,
    String? createdDateTime,
    String? id,
    bool? isDefault,
    bool? isShared,
    User? lastModifiedBy,
    String? lastModifiedDateTime,
    List<String>? links,
    String? displayName,
    String? sectionGroupsUrl,
    String? sectionsUrl,
    String? self,
    String? userRole,
  }) {
    return Notebook(
      createdBy: createdBy ?? this.createdBy,
      createdDateTime: createdDateTime ?? this.createdDateTime,
      id: id ?? this.id,
      isDefault: isDefault ?? this.isDefault,
      isShared: isShared ?? this.isShared,
      lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
      lastModifiedDateTime: lastModifiedDateTime ?? this.lastModifiedDateTime,
      links: links ?? this.links,
      displayName: displayName ?? this.displayName,
      sectionGroupsUrl: sectionGroupsUrl ?? this.sectionGroupsUrl,
      sectionsUrl: sectionsUrl ?? this.sectionsUrl,
      self: self ?? this.self,
      userRole: userRole ?? this.userRole,
    );
  }

  factory Notebook.fromJson(Map<String, dynamic> json) {
    return Notebook(
      createdBy:
          json['createdBy'] != null ? User.fromJson(json['createdBy']) : null,
      createdDateTime: json['createdDateTime'],
      id: json['id'],
      isDefault: json['isDefault'],
      isShared: json['isShared'],
      lastModifiedBy: json['lastModifiedBy'] != null
          ? User.fromJson(json['lastModifiedBy'])
          : null,
      lastModifiedDateTime: json['lastModifiedDateTime'],
      links: json['links'] != null ? (json['links']) : null,
      displayName: json['displayName'],
      sectionGroupsUrl: json['sectionGroupsUrl'],
      sectionsUrl: json['sectionsUrl'],
      self: json['self'],
      userRole: json['userRole'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdBy': createdBy,
      'createdDateTime': createdDateTime,
      'id': id,
      'isDefault': isDefault,
      'isShared': isShared,
      'lastModifiedBy': lastModifiedBy,
      'lastModifiedDateTime': lastModifiedDateTime,
      'links': links,
      'displayName': displayName,
      'sectionGroupsUrl': sectionGroupsUrl,
      'sectionsUrl': sectionsUrl,
      'self': self,
      'userRole': userRole,
    };
  }
}
