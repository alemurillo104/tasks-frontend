part of 'tasks_bloc.dart';

enum GetTaskSt { initial, success, loading, error }

class TasksState extends Equatable {
  List<Task> tasks;
  GetTaskSt status;
  String? messageError;
  TasksState({
    this.tasks = const [],
    this.status = GetTaskSt.initial,
    this.messageError,
  });

  @override
  List<Object?> get props => [tasks, status, messageError];

  TasksState copyWith({
    List<Task>? tasks,
    GetTaskSt? status,
    String? messageError,
  }) =>
      TasksState(
        tasks: tasks ?? this.tasks,
        status: status ?? this.status,
        messageError: messageError ?? this.messageError,
      );
}
