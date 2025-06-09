import 'package:json_annotation/json_annotation.dart';
import 'package:microsoft_graph_api/models/calendar/email_address_model.dart';

part 'recipient_model.g.dart';

/// Represents an email recipient (sender, to, cc, bcc).
@JsonSerializable()
class Recipient {
  /// The recipient's email address information.
  final EmailAddress? emailAddress;

  Recipient({this.emailAddress});

  const Recipient.empty() : emailAddress = null;

  factory Recipient.fromJson(Map<String, dynamic> json) => _$RecipientFromJson(json);
  Map<String, dynamic> toJson() => _$RecipientToJson(this);
}
