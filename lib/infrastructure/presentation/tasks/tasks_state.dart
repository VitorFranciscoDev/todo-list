import 'package:flutter/widgets.dart';
import 'package:to_do_list/domain/entities/task.dart';
import 'package:to_do_list/domain/usecases/task_usecases.dart';

// Tasks State
class TasksProvider with ChangeNotifier {
  // Constructor
  TasksProvider({ required this.useCases });
  final TaskUseCases useCases;

  // Today Tasks
  List<Task> _todayTasks = [];
  List<Task> get todayTasks => _todayTasks;

  // Upcoming Tasks
  List<Task> _upcomingTasks = [];
  List<Task> get upcomingTasks => _upcomingTasks;

  // Is Initialized Boolean
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  // Setter Function
  void _setInitialized(bool initialized) {
    _isInitialized = initialized;
    notifyListeners();
  }

  // Is Loading Boolean
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Setter Function
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Errors
  String? _errorTitle;
  String? get errorTitle => _errorTitle;

  String? _errorDescription;
  String? get errorDescription => _errorDescription;

  String? _errorDate;
  String? get errorDate => _errorDate;

  String? _errorStartTime;
  String? get errorStartTime => _errorStartTime;

  String? _errorEndTime;
  String? get errorEndTime => _errorEndTime;

  String? _errorLocal;
  String? get errorLocal => _errorLocal;

  bool validateTask(String title, String description, String date, String startTime, String endTime, String local) {
    

    notifyListeners();

    return _errorTitle == null && _errorDescription == null && _errorDate == null && _errorStartTime == null && _errorEndTime == null && _errorLocal == null;
  }

  // Clean All Errors
  void clearErrors() {
    _errorTitle = null;
    _errorDescription = null;
    _errorDate = null;
    _errorStartTime = null;
    _errorEndTime = null;
    _errorLocal = null;
  }

  // Use Cases
  // Add Task
  Future<int> addTask(Task task) async {
    _setLoading(true);

    try {
      return await useCases.addTask(task);
    } catch(e) {
      return 0;
    } finally {
      _setLoading(false);
    }
  }

  // Delete Task
  Future<int> deleteTask(int? id) async {
    _setLoading(true);

    try {
      return await useCases.deleteTask(id);
    } catch(e) {
      return 0;
    } finally {
      _setLoading(false);
    }
  }

  // Update Task
  Future<int> updateTask(Task task) async {
    _setLoading(true);

    try {
      return await useCases.updateTask(task);
    } catch(e) {
      return 0;
    } finally {
      _setLoading(false);
    }
  }

  // Get All Tasks
  Future<List<Task>> getAllTasks(int uid) async {
    _setInitialized(false);

    try {
      return await useCases.getAllTasks(uid);
    } catch(e) {
      return [];
    } finally {
      _setInitialized(true);
    }
  }
}