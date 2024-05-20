part of 'notification_cubit.dart';


class NotificationState {

  final Status getNotification;
  final Status readNotification;
  final String callback;


  NotificationState({
    this.getNotification = Status.initial,
    this.readNotification = Status.initial,
    this.callback = '',
});



  NotificationState copyWith({
    Status? getNotification,
    Status? readNotification,
    String? callback,
}) => NotificationState(
    getNotification: getNotification?? this.getNotification,
    readNotification: readNotification?? this.readNotification,
    callback: callback?? this.callback,
  );


}


