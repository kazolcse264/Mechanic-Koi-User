
import 'package:mechanic_koi/models/book_service_model.dart';

import 'user_model.dart';

const String collectionNotification = 'Notifications';

const String notificationFieldId = 'notificationId';
const String notificationFieldType = 'type';
const String notificationFieldMessage = 'Message';
const String notificationFieldStatus = 'status';
const String notificationFieldUser = 'user';
const String notificationFieldOrder = 'order';

class NotificationModel {
  String id;
  String type;
  String message;
  bool status;
  UserModel userModel;
  BookServiceModel orderModel;

  NotificationModel({
    required this.id,
    required this.type,
    required this.message,
    this.status = false,

    required this.userModel,
    required this.orderModel,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      notificationFieldId: id,
      notificationFieldType: type,
      notificationFieldMessage: message,
      notificationFieldStatus: status,
      notificationFieldUser: userModel.toMap(),
      notificationFieldOrder: orderModel.toMap(),
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) =>
      NotificationModel(
        id: map[notificationFieldId],
        type: map[notificationFieldType],
        message: map[notificationFieldMessage],
        status: map[notificationFieldStatus],
        userModel: UserModel.fromMap(map[notificationFieldUser]),
        orderModel: BookServiceModel.fromMap(map[notificationFieldOrder]),
      );
}
