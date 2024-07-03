import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:to_do_app/utils/utils.dart';
import 'package:to_do_app/view%20model/controller/signin_controller.dart';

class MockUtils extends Mock implements Utils {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SignInController Tests', () {
    late SignInController controller;
    late MockUtils mockUtils;

    setUp(() {
      mockUtils = MockUtils();
      controller = SignInController();
    });

    test('Initial values are correct', () {
      expect(controller.emailFocus.value, false);
      expect(controller.passwordFocus.value, false);
      expect(controller.correctEmail.value, false);
      expect(controller.showPassword.value, true);
      expect(controller.loading.value, false);
      expect(controller.email.value.text, '');
      expect(controller.password.value.text, '');
    });

    test('Login account with incorrect email shows snackbar', () {
      controller.email.value.text = 'incorrectemail';
      controller.correctEmail.value = false;
      controller.loginAccount();
    });

    test('Login account with short password shows snackbar', () {
      controller.email.value.text = 'test@example.com';
      controller.correctEmail.value = true;
      controller.password.value.text = '123';

      controller.loginAccount();
    });

    test('Set loading state works correctly', () {
      controller.setLoading(true);
      expect(controller.loading.value, true);

      controller.setLoading(false);
      expect(controller.loading.value, false);
    });

    test('Focus handling functions work correctly', () {
      controller.onFocusEmail();
      expect(controller.emailFocus.value, true);
      expect(controller.passwordFocus.value, false);

      controller.onFocusPassword();
      expect(controller.emailFocus.value, false);
      expect(controller.passwordFocus.value, true);
    });
  });
}

class MockBuildContext extends Mock implements BuildContext {}
