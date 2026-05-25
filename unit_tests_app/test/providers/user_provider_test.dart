import 'package:flutter_test/flutter_test.dart';
import 'package:unit_tests_app/models/user_model.dart';
import 'package:unit_tests_app/providers/user_provider.dart';
import 'package:unit_tests_app/services/api_service.dart';

class FakeApiService extends ApiService {
  List<UserModel> usersToReturn = [];
  bool shouldThrow = false;

  @override
  Future<List<UserModel>> fetchUsers() async {
    if (shouldThrow) {
      throw Exception('Network error');
    }
    return List.from(usersToReturn);
  }
}

void main() {
  late FakeApiService fakeApiService;
  late UserProvider userProvider;

  final testUsers = List.generate(
    15,
    (index) => UserModel(
      id: index,
      name: 'User $index',
      username: 'username$index',
      email: 'email$index@gmail.com',
      address: {'city': 'City $index'},
    ),
  );

  setUp(() {
    fakeApiService = FakeApiService();
    fakeApiService.usersToReturn = testUsers;
    userProvider = UserProvider(apiService: fakeApiService);
  });

  group('fetchUsers', () {
    test('should load all users from API', () async {
      await userProvider.fetchUsers();

      expect(userProvider.allusers.length, 15);
      expect(userProvider.hasloadMore, true);
    });

    test('should set isLoading to false after fetch completes', () async {
      await userProvider.fetchUsers();

      expect(userProvider.isLoading, false);
    });

    test('should reset visible users and page on fetch', () async {
      await userProvider.fetchUsers();
      await userProvider.loadMoreUsers();
      expect(userProvider.visibleusers.length, 10);
      await userProvider.fetchUsers();
      expect(userProvider.visibleusers.length, 0);
      expect(userProvider.currentpage, 0);
    });

    test('should throw and reset isLoading on API error', () async {
      fakeApiService.shouldThrow = true;

      expect(() => userProvider.fetchUsers(), throwsA(isA<Exception>()));
      await Future.delayed(Duration.zero);
      expect(userProvider.isLoading, false);
    });
  });

  group('loadMoreUsers', () {
    test('should load first page of 10 users', () async {
      await userProvider.fetchUsers();
      await userProvider.loadMoreUsers();

      expect(userProvider.visibleusers.length, 10);
      expect(userProvider.currentpage, 1);
      expect(userProvider.hasloadMore, true);
    });

    test('should load remaining users on second page', () async {
      await userProvider.fetchUsers();
      await userProvider.loadMoreUsers(); // 10 users
      await userProvider.loadMoreUsers(); // 5 more users

      expect(userProvider.visibleusers.length, 15);
      expect(userProvider.currentpage, 2);
      expect(userProvider.hasloadMore, false);
    });

    test('should not load more when hasloadMore is false', () async {
      await userProvider.fetchUsers();
      await userProvider.loadMoreUsers();
      await userProvider.loadMoreUsers();

      expect(userProvider.hasloadMore, false);

      await userProvider.loadMoreUsers();
      expect(userProvider.visibleusers.length, 15);
      expect(userProvider.currentpage, 2);
    });

    test('should set isPaginationLoading correctly', () async {
      await userProvider.fetchUsers();
      await userProvider.loadMoreUsers();
      expect(userProvider.isPaginationLoading, false);
    });
  });

  group('refreshUsers', () {
    test('should clear and re-fetch users', () async {
      await userProvider.fetchUsers();
      await userProvider.loadMoreUsers();

      expect(userProvider.visibleusers.length, 10);
      expect(userProvider.currentpage, 1);

      await userProvider.refreshUsers();

      expect(userProvider.currentpage, 0);
      expect(userProvider.visibleusers.length, 0);
      expect(userProvider.allusers.length, 15);
      expect(userProvider.hasloadMore, true);
    });
  });
}
