import 'package:meta/meta.dart';

class Backend {
  const Backend(this.hostUrl);

  final String hostUrl;

  Future<List<Rocket>> getRockets() async {
    return const [];
  }
}

class Rocket {
  Rocket({
    @required this.name,
    @required this.description,
    this.flickrImages = const [],
  })  : assert(name != null),
        assert(description != null);

  final String name;
  final String description;
  final List<String> flickrImages;
}
