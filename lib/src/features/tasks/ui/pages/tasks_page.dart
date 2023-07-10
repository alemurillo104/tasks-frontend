import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/core/utils/layout/dimensions.dart';

import '../../../../core/injections/tasks_injection.dart';
import '../../../../core/utils/theme/theme.dart';
import '../../bloc/tasks_bloc.dart';
import '../widgets/tasks_list_widget.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  late TasksBloc _tasksBloc;

  @override
  void initState() {
    TaskInjection().init();
    _tasksBloc = TaskInjection.instance.get<TasksBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => _tasksBloc
        ..add(
          GetTasksEvent(),
        ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: (screenWidth < narrowWidth),
          title: const Text(
            'My Tasks',
          ),
        ),
        body: Container(
          width: screenWidth,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My tasks list',
                style: AppTheme.lightTheme.primaryTextTheme.headline3,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      _tasksBloc.add(
                        GetTasksEvent(),
                      );
                    },
                    icon: const Icon(
                      Icons.list,
                    ),
                    label: const Text(
                      'Listar',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      _tasksBloc.add(
                        SortTasksEvent(),
                      );
                    },
                    icon: const Icon(
                      Icons.sort,
                    ),
                    label: const Text(
                      'Ordenar',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Expanded(child: TaskListWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
