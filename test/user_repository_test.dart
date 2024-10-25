import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test/user_model.dart';
import 'package:flutter_unit_test/user_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockHTTPClient extends Mock implements Dio {}

void main() {
  late UserRepository userRepository;
  late MockHTTPClient mockHTTPClient;

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    userRepository = UserRepository(mockHTTPClient);
  });

  group('UserRepository', () {
    group('getUser Function', () {
      test(
          'given testUser when getUser function is called and status code is 200 then a UserModel should be returned',
          () async {
        // Arrange

        when(() => mockHTTPClient
                .get('https://jsonplaceholder.typicode.com/users/1'))
            .thenAnswer((_) async => Response(
                  requestOptions: RequestOptions(path: ''),
                  data: {
                    "id": 1,
                    "name": "Leanne Graham",
                    "username": "Bret",
                    "email": "Sincere@april.biz",
                    "phone": "1-770-736-8031 x56442",
                    "website": "hildegard.org"
                  },
                  statusCode: 200,
                ));

        // Act
        final user = await userRepository.getUser();

        // Assert
        expect(user, isA<User>());
        expect(user.id, 1);
        expect(user.name, 'Leanne Graham');
      });

      test(
          'given testUser when getUser function is called and status code is not 200 then an error exception is thrown',
          () async {
        // Arrange
        when(() => mockHTTPClient
                .get('https://jsonplaceholder.typicode.com/users/1'))
            .thenAnswer((_) async => Response(
                  requestOptions: RequestOptions(path: ''),
                  statusCode: 404, // Non-200 status code
                ));

        // Act & Assert
        expect(() async => await userRepository.getUser(), throwsException);
      });
    });
  });
}
