import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mybudiluhur/features/auth/data/api_auth_repository.dart';
import 'package:mybudiluhur/features/auth/domain/entities/app_user.dart';
import 'package:mybudiluhur/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:mybudiluhur/features/auth/presentation/cubit/auth_state.dart';

class MockApiAuthRepository extends Mock implements ApiAuthRepository {}

final apiAuthRepository = ApiAuthRepository();
void main() {
  group('AuthCubit', () {
    late MockApiAuthRepository mockRepository;
    late AuthCubit authCubit;

    final dummyUser = AppUser(nis: "123", password: "123");

    setUp(() {
      mockRepository = MockApiAuthRepository();
      // Pastikan cubit lo bisa DI repo, misal AuthCubit(apiAuthRepository: mockRepository)
      authCubit = AuthCubit(apiAuthRepository: mockRepository);
    });

    tearDown(() {
      authCubit.close();
    });

    test("State Awal : AuthInitial", () {
      expect(authCubit.state, isA<AuthInitial>());
    });

    blocTest<AuthCubit, AuthState>(
      'State Kedua : setelah AuthInitial harus Unauthenticated',
      build: () => AuthCubit(apiAuthRepository: apiAuthRepository),
      act: (cubit) => cubit.initialize(),
      expect: () => [isA<AuthInitial>(), isA<Unauthenticated>()],
      wait: const Duration(
        milliseconds: 350,
      ), // ini buat nunggu delay di cubit lo!
    );

    // Contoh blocTest untuk Cubit
    blocTest<AuthCubit, AuthState>(
      'State Ketiga : setelah Unaunthenticated ada AuthLoading kemudian Authenticated',
      build: () {
        when(
          () => mockRepository.loginWithNisAndPassword(
            nis: any(named: 'nis'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => dummyUser);
        return authCubit;
      },
      act: (cubit) => cubit.login('123', '123'),
      expect: () => [isA<AuthLoading>(), isA<Authenticated>()],
      wait: const Duration(milliseconds: 350),
    );

    blocTest<AuthCubit, AuthState>(
      'State Keempat : setelah Authenticated kemudian Unauthenticated ',
      build: () {
        // mock method logout di repository
        when(() => mockRepository.logout()).thenAnswer((_) async => {});
        return authCubit;
      },
      seed: () => Authenticated(
        dummyUser,
      ), // <-- Cubit langsung start dari Authenticated!
      act: (cubit) => cubit.logout(),
      expect: () => [
        isA<Unauthenticated>(),
      ], // biasaya cuma emit Unauthenticated setelah logout
      verify: (_) {
        // Cek juga kalau repository.logout() bener-bener dipanggil!
        verify(() => mockRepository.logout()).called(1);
      },
    );
  });
}
