import 'activity.dart';

class Memory extends Activity {
  @override
  final String imageUrl;
  @override
  final String name;
    @override
  final List tags;

  Memory({required this.imageUrl, required this.name, required this.tags});
}
