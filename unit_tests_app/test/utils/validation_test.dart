import 'package:flutter_test/flutter_test.dart';

import 'package:unit_tests_app/utils/validation_utils.dart';

void main() {
  group('Validation Tests', () {
    test('valid email returns true', () {
      expect(ValidationUtils.isValidEmail('test@gmail.com'), true);
    });

    test('invalid email returns false', () {
      expect(ValidationUtils.isValidEmail('testgmail.com'), false);
    });

    test('empty string returns false', () {
      expect(ValidationUtils.isNotEmpty(''), false);
    });

    test('non empty string returns true', () {
      expect(ValidationUtils.isNotEmpty('Flutter'), true);
    });
  });
}
