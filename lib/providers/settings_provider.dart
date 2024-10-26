import 'package:flutter/material.dart';

enum SortBy {
  creationDate,
  title,
  status,
}

class SettingsProvider with ChangeNotifier {
  bool _isDarkMode = false;
  bool _showCompletedTasks = true;
  SortBy _sortBy = SortBy.creationDate;
  bool _sortAscending = true;

  bool get isDarkMode => _isDarkMode;
  bool get showCompletedTasks => _showCompletedTasks;
  SortBy get sortBy => _sortBy;
  bool get sortAscending => _sortAscending;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void toggleShowCompletedTasks() {
    _showCompletedTasks = !_showCompletedTasks;
    notifyListeners();
  }

  void setSortBy(SortBy value) {
    _sortBy = value;
    notifyListeners();
  }

  void toggleSortDirection() {
    _sortAscending = !_sortAscending;
    notifyListeners();
  }
}