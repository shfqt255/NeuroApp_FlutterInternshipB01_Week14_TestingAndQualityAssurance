import 'package:flutter/material.dart';
import 'package:unit_tests_app/models/user_model.dart';
import 'package:unit_tests_app/services/api_service.dart';

class UserProvider extends ChangeNotifier {
  final ApiService apiService;
  UserProvider({required this.apiService});

  List<UserModel> _allusers = [];
  List<UserModel> get allusers => _allusers;

  List<UserModel> _visibleusers = [];
  List<UserModel> get visibleusers => _visibleusers;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isPaginationLoading = false;
  bool get isPaginationLoading => _isPaginationLoading;

  bool _hasloadMore = false;
  bool get hasloadMore => _hasloadMore;
  int _currentPage = 0;
  int get currentpage => _currentPage;

  final int _usersPerPage = 10;

  Future<void> fetchUsers() async {
    try {
      _isLoading = true;
      notifyListeners();
      final users = await apiService.fetchUsers();
      _allusers = users;

      _visibleusers.clear();
      _currentPage = 0;
      _hasloadMore = true;
    } catch (e) {
      throw Exception('Failed to load');
    }
  }

  Future<void> loadMoreUsers() async {
    if (_isPaginationLoading || !_hasloadMore) return;

    _isPaginationLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    int startIndex = _currentPage * _usersPerPage;
    int endIndex = startIndex + _usersPerPage;
    if (endIndex > _allusers.length) {
      endIndex = _allusers.length;
    }

    List<UserModel> newUsers = _allusers.sublist(startIndex, endIndex);

    _visibleusers.addAll(newUsers);
    _currentPage++;

    if (_visibleusers.length >= _allusers.length) {
      _hasloadMore = false;
    }

    _isPaginationLoading = false;

    notifyListeners();
  }

  Future<void> refreshUsers() async {
    _allusers.clear();

    _visibleusers.clear();

    _currentPage = 0;

    _hasloadMore = true;

    await fetchUsers();
  }
}
