import 'package:flutter_test/flutter_test.dart';
import 'package:superapp/app/app.dart';

void main() {
  setUp(TestWidgetsFlutterBinding.ensureInitialized);

  group('HomePage', () {
    testWidgets('renders home page', (tester) async {
      await tester.pumpWidget(
        const App(),
      );
      await tester.pumpAndSettle();

      expect(find.text('Saint Petersburg'), findsOneWidget);
    });
  });
}
