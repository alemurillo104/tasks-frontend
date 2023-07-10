import '../../../core/helpers/string_to_enum.dart';
import '../../../core/utils/enums/enum.dart';

class Task {
  int id;
  String nombre;
  Priority prioridad;
  String fechaVencimiento;

  Task({
    required this.id,
    required this.nombre,
    required this.prioridad,
    required this.fechaVencimiento,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      nombre: json['nombre'],
      prioridad: priorityStringToEnum(json['prioridad']),
      fechaVencimiento: json['fechaVencimiento'],
    );
  }
}
