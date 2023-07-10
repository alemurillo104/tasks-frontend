import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/task_model.dart';
import '../repository/task_repository.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TaskRepository repository;

  TasksBloc({
    required this.repository,
  }) : super(TasksState()) {
    on<GetTasksEvent>(_getAllTasksEvent);
    on<SortTasksEvent>(_sortTasksEvent);
  }

  _getAllTasksEvent(GetTasksEvent event, Emitter<TasksState> emit) async {
    try {
      emit(
        state.copyWith(
          status: GetTaskSt.loading,
        ),
      );

      var response = await repository.getAllTasks();
      emit(
        state.copyWith(
          status: GetTaskSt.success,
          tasks: response,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: GetTaskSt.error,
          messageError: 'Ups, algo salió mal',
        ),
      );
    }
  }

  _sortTasksEvent(SortTasksEvent event, Emitter<TasksState> emit) async {
    try {
      emit(
        state.copyWith(
          status: GetTaskSt.loading,
        ),
      );

      var response = await repository.sortTasks();
      emit(
        state.copyWith(
          status: GetTaskSt.success,
          tasks: response,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: GetTaskSt.error,
          messageError: 'Ups, algo salió mal',
        ),
      );
    }
  }
}
