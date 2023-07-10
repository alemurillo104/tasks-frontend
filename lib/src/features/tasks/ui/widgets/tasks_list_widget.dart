import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/core/helpers/string_to_enum.dart';
import 'package:frontend/src/core/utils/theme/sizes.dart';

import '../../../../core/utils/layout/dimensions.dart';
import '../bloc/tasks_bloc.dart';
import 'item_list_widget.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        if (state.status == GetTaskSt.success) {
          return GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (screenWidth > narrowWidth)
                  ? ((screenWidth > fullWidth) ? 3 : 2)
                  : 1,
              crossAxisSpacing: AppSizes.miniumPadding,
              mainAxisSpacing: AppSizes.miniumPadding,
              mainAxisExtent: AppSizes.cardHeight,
            ),
            children: state.tasks
                .map(
                  (item) => ItemListWidget(
                    width: screenWidth * 0.4,
                    title: item.nombre,
                    subtitle: " Prioridad: ${priorityToString(item.prioridad)}",
                    priority: item.prioridad,
                  ),
                )
                .toList(),
          );
        } else if (state.status == GetTaskSt.error) {
          return Center(
            child: Text(state.messageError!),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
