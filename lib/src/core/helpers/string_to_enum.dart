import '../utils/enums/enum.dart';

Priority priorityStringToEnum(String str) {
  switch (str) {
    case 'alta':
      return Priority.alta;
    case 'media':
      return Priority.media;
    default:
      return Priority.baja;
  }
}

String priorityToString(Priority pr) {
  switch (pr) {
    case Priority.alta:
      return 'alta';
    case Priority.media:
      return 'media';
    default:
      return 'baja';
  }
}
