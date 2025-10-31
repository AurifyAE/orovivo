import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app/features/auth/auth.dart';

part 'authentication_repository.g.dart';

@Riverpod(keepAlive: true)
IAuthenticationRepository authenticationRepo(AuthenticationRepoRef ref) =>
    AuthenticationRepository();

class AuthenticationRepository implements IAuthenticationRepository {
  AuthenticationRepository();
}
