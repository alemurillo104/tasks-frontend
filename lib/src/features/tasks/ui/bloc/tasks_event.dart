part of 'tasks_bloc.dart';

abstract class TasksEvent {}

class GetTasksEvent extends TasksEvent {}

class SortTasksEvent extends TasksEvent {}
