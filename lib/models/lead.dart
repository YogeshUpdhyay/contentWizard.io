// To parse this JSON data, do
//
//     final lead = leadFromJson(jsonString);

import 'dart:convert';

Lead leadFromJson(String str) => Lead.fromJson(json.decode(str));

String leadToJson(Lead data) => json.encode(data.toJson());

class Lead {
    Lead({
      required this.name,
      required this.avatarUrl,
      required this.lastMessage,
      required this.lastMessageTime,
    });

    String name;
    String avatarUrl;
    String lastMessage;
    DateTime lastMessageTime;

    factory Lead.fromJson(Map<String, dynamic> json) => Lead(
        name: json["name"],
        avatarUrl: json["avatarUrl"],
        lastMessage: json["lastMessage"],
        lastMessageTime: DateTime.parse(json["lastMessageTime"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "avatarUrl": avatarUrl,
        "lastMessage": lastMessage,
        "lastMessageTime": "${lastMessageTime.year.toString().padLeft(4, '0')}-${lastMessageTime.month.toString().padLeft(2, '0')}-${lastMessageTime.day.toString().padLeft(2, '0')}",
    };
}
