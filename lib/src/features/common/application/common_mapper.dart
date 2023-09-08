import 'package:klinnika/src/features/common/domain/queue.dart';
import 'package:klinnika/src/features/data.dart';
import 'package:klinnika/src/features/domain.dart';
import 'package:klinnika/src/services/services.dart';

class CommonMapper {
  static Result<Home> mapToHome(
    Result<List<Queue>> result,
  ) {
    return result.when(
      success: (data) {
        List<Queue> queue = [...data];
        return Result.success(
          Home(
            queueList: queue,
          ),
        );
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  static Result<Event> mapToEventDetail(Result<EventResponse> result) {
    return result.when(
      success: (item) {
        return Result.success(Event.fromResponse(item));
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  static Result<User> mapToProfile(Result<UserResponse> result) {
    return result.when(
      success: (item) {
        return Result.success(User.fromResponse(item));
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  // static Result<MyEvents> mapToMyEvents(
  //   Result<MyEventResponse> result,
  // ) {
  //   return result.when(
  //     success: (data) {
  //       List<Ticket> upcomingEvents = [...data.upcomingEvents.map((e) => Ticket.fromResponse(e))];
  //       List<Ticket> pastEvents = [...data.pastEvents.map((e) => Ticket.fromResponse(e))];

  //       return Result.success(
  //         MyEvents(
  //           upcomingEvents: upcomingEvents,
  //           pastEvents: pastEvents,
  //         ),
  //       );
  //     },
  //     failure: (error, stackTrace) {
  //       return Result.failure(error, stackTrace);
  //     },
  //   );
  // }
}
