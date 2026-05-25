import 'package:flutter_test/flutter_test.dart';

import 'package:unit_tests_app/models/user_model.dart';

void main() {
  group('UserModel test', () {
    test('fromJson creates valid object', () {
      final json = {
        'id': 1,
        'name': 'John',
        'username': 'john123',
        'email': 'john@gmail.com',
        'address': {'city': 'New York'},
      };

      final user = UserModel.fromJson(json);
      expect(user.id, 1);
      expect(user.name, 'John');
      expect(user.username, 'john123');
      expect(user.email, 'john@gmail.com');
      expect(user.address['city'], 'New York');
    });
  });
}
