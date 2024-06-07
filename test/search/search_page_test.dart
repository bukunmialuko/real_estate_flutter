import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superapp/app/app.dart';

void main() {
  group('SearchPage', () {
    setUp(TestWidgetsFlutterBinding.ensureInitialized);

    testWidgets('renders search page', (tester) async {
      await tester.pumpWidget(
        const App(),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('svg_search')));
      await tester.pumpAndSettle();

      expect(find.text('Saint Petersburg'), findsOneWidget);
      expect(find.text('List of variants'), findsOneWidget);
    });
  });
}
