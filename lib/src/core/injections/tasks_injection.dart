import 'package:frontend/src/features/tasks/repository/task_repository.dart';
import 'package:get_it/get_it.dart';

import '../../features/tasks/bloc/tasks_bloc.dart';

class TaskInjection {
  static GetIt instance = GetIt.instance;

  init() {
    if (!instance.isRegistered<TasksBloc>()) {
      if (!instance.isRegistered<TaskRepository>()) {
        instance.registerLazySingleton(
          () => TaskRepository(),
        );
      }
      instance.registerFactory(
        () => TasksBloc(
          repository: instance.get<TaskRepository>(),
        ),
      );
    }
  }
}
