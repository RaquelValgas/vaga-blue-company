import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vaga_blue_company/presentation/login/login_page.dart';

void main() {
  const List<Size> screenSizes = [
    Size(320, 480), // Tamanho da tela do iPhone 4
    Size(360, 592), // Tamanho da tela do Galaxy Nexus
    Size(480, 800), // Tamanho da tela do Samsung Galaxy S2
    Size(720, 1280), // Tamanho da tela do Nexus 4
    Size(1080, 1920), // Tamanho da tela do Nexus 5
  ];

  testWidgets(
    'Should not throw an [Exception] for different screen sizes',
    (tester) async {
      for (var screenSize in screenSizes) {
        debugPrint('SIZE: $screenSize');
        if (screenSize.width == 360) {
          tester.view.devicePixelRatio = 0.6081081081081081;
        }

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (BuildContext context) {
                MediaQueryData newQuery = MediaQuery.of(context).copyWith(
                  size: screenSize,
                );
                return MediaQuery(
                  data: newQuery,
                  child: const LoginPage(),
                );
              },
            ),
          ),
        );

        await tester.pump();

        expect(tester.takeException(), isNull);
        expect(find.byType(OverflowBox), findsNothing);
      }
    },
  );

  testWidgets('Field [CPF] should return: "CPF inválido"', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginPage(),
      ),
    );

    final cpf = find.widgetWithText(TextFormField, 'CPF');
    expect(cpf, findsOneWidget);
    await tester.tap(cpf);
    await tester.enterText(cpf, '12345678912');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Entrar'));
    await tester.pump();
    final cpfInvalidNumber = find.widgetWithText(TextFormField, 'CPF inválido');
    expect(cpfInvalidNumber, findsOneWidget);
    await tester.tap(cpf);
    await tester.enterText(cpf, '45282531860');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Entrar'));

    await tester.pump();
    expect(cpfInvalidNumber, findsNothing);
    await tester.pump();
  });
}
