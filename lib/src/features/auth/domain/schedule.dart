class Schedule {
  final String day;
  final String endTime;
  final String startTime;

  Schedule({
    required this.day,
    required this.endTime,
    required this.startTime,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      day: json['day'] ?? '',
      endTime: json['endTime'] ?? '',
      startTime: json['startTime'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'day': day,
      'endTime': endTime,
      'startTime': startTime,
    };
  }

  Schedule copyWith({
    String? day,
    String? endTime,
    String? startTime,
  }) {
    return Schedule(
      day: day ?? this.day,
      endTime: endTime ?? this.endTime,
      startTime: startTime ?? this.startTime,
    );
  }
}
