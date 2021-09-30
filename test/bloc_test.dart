// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'blocs/character_card_bloc.dart' as character_card_bloc_test;
import 'blocs/character_list_bloc.dart' as character_list_bloc_test;

void main() {
  character_list_bloc_test.main();
  character_card_bloc_test.main();
}
