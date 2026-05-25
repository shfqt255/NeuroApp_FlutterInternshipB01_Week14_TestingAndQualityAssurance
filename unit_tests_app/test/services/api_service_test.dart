import 'package:flutter_test/flutter_test.dart';
import 'package:unit_tests_app/services/api_service.dart';

void main() {
  group('ApiService', () {
    test('should be created with default baseUrl', () {
      final service = ApiService();
      expect(service.baseUrl, 'https://jsonplaceholder.typicode.com/users');
    });

    test('should accept a custom baseUrl', () {
      final service = ApiService(baseUrl: 'https://example.com/api');
      expect(service.baseUrl, 'https://example.com/api');
    });
  });
}
