import 'package:buildpc/model/general/e_role.dart';
import 'package:buildpc/model/general/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User', () {
    test('toJson() should return valid JSON', () {
      final user = User(
        id: 1,
        name: 'John Doe',
        username: 'johndoe',
        email: 'johndoe@example.com',
        password: 'password123',
        role: ERole.ROLE_USER,
      );
      final json = user.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['id'], 1);
      expect(json['name'], 'John Doe');
      expect(json['username'], 'johndoe');
      expect(json['email'], 'johndoe@example.com');
      expect(json['password'], 'password123');
      expect(json['role'], 'user');
    });

    test('fromJson() should return valid User instance', () {
      final json = {
        'id': 1,
        'name': 'John Doe',
        'username': 'johndoe',
        'email': 'johndoe@example.com',
        'password': 'password123',
        'role': 'user',
      };
      final user = User.fromJson(json);
      expect(user, isA<User>());
      expect(user.id, 1);
      expect(user.name, 'John Doe');
      expect(user.username, 'johndoe');
      expect(user.email, 'johndoe@example.com');
      expect(user.password, 'password123');
      expect(user.role, ERole.ROLE_USER);
    });

    test('parsedModels() should return valid list of fields', () {
      final user = User(
        id: 1,
        name: 'John Doe',
        username: 'johndoe',
        email: 'johndoe@example.com',
        password: 'password123',
        role: ERole.ROLE_USER,
      );

      final parsedFields = user.parsedModels();

      expect(parsedFields, isA<List<String>>());
      expect(parsedFields.length, 6);
      expect(parsedFields.first, '1');
      expect(parsedFields[1], 'John Doe');
      expect(parsedFields[2], 'johndoe');
      expect(parsedFields[3], 'johndoe@example.com');
      expect(parsedFields[4], 'password123');
      expect(parsedFields[5], 'user');
    });
  });
}
