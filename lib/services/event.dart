import 'activity.dart';

class Event extends Activity {
  @override
  final String imageUrl;
  @override
  final String name;
  @override
  final List tags;

  Event({required this.imageUrl, required this.name, required this.tags});
}
