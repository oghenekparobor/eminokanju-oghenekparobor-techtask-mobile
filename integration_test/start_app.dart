import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/main.dart' as app;
import 'package:tech_task/main.dart';
import 'package:tech_task/module/lunch/presentation/change-notifier/lunch.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late LunchNotifier notifier;

  testWidgets('run the app', (
    tester,
  ) async {
    // Load app widget.
    await app.main();

    // start the app
    await tester.pumpWidget(app.MyApp());

    await tester.pumpAndSettle();

    // look for the splash logo
    final logoWidget = find.byType(Image);
    expect(logoWidget, findsOneWidget);

    // waiting for splash delay
    await Duration(milliseconds: 1300);
    await tester.pumpAndSettle();

    // confirm I'm in a new screen
    final homeWidget = find.byKey(Key('home_scree'));
    expect(homeWidget, findsOneWidget);

    // find the button
    final button = find.byKey(Key('get_ingredient'));
    expect(button, findsOneWidget);

    await tester.tap(button);
    await tester.pumpAndSettle();

    await Future.delayed(Duration(milliseconds: 9000));
    await tester.pumpAndSettle();

    notifier = navkey.currentContext!.read<LunchNotifier>();

    if (notifier.ingredients != null && notifier.ingredients!.isNotEmpty) {
      final item = find.byKey(Key(notifier.ingredients!.first.title));
      expect(item, findsOneWidget);

      await tester.tap(item);
      await tester.pumpAndSettle();

      await Future.delayed(Duration(milliseconds: 800));

      if (notifier.isDatePaased(notifier.ingredients!.first)) {
        // use date has passed
        final notification = find.byKey(
          Key('${notifier.ingredients!.first.title} is passed it\'s use date'),
        );

        expect(notification, findsOneWidget);

        await tester.drag(notification, Offset(-100, 0));
      } else {
        // use date is still valid
        await tester.tap(button);
        await tester.pumpAndSettle();

        await Future.delayed(Duration(milliseconds: 800));
        await tester.pumpAndSettle();

        final recipeScreen = find.byKey(Key('recipe_screen'));
        expect(recipeScreen, findsOneWidget);

        final showRecipeButton = find.byKey(Key('show_recipe_button'));
        expect(showRecipeButton, findsOneWidget);

        await tester.tap(showRecipeButton);
        await tester.pumpAndSettle();

        await Future.delayed(Duration(milliseconds: 9000));
        await tester.pumpAndSettle();

        expect(notifier.recipes, isNotNull);
        expect(notifier.recipes, isList);
      }
    } else {
      final tryAgainButton = find.byKey(Key('try_again_button'));
      expect(tryAgainButton, findsOneWidget);

      await tester.tap(tryAgainButton);
      await tester.pumpAndSettle();

      await Future.delayed(Duration(milliseconds: 9000));
    }
  });
}
