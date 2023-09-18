class Schedule {
  final String? days;
  final DateTime? endTime;
  final DateTime? startTime;

  Schedule({
    this.days,
    this.endTime,
    this.startTime,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      days: json['days'] ?? '',
      endTime: json['endTime']?.toDate(),
      startTime: json['startTime']?.toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'days': days,
      'endTime': endTime,
      'startTime': startTime,
    };
  }

  Schedule copyWith({
    String? days,
    DateTime? endTime,
    DateTime? startTime,
  }) {
    return Schedule(
      days: days ?? this.days,
      endTime: endTime ?? this.endTime,
      startTime: startTime ?? this.startTime,
    );
  }
}
