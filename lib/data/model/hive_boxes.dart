import 'package:hive/hive.dart';

import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class BlogsData {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String imageUrl;

  BlogsData({
    required this.id,
    required this.title,
    required this.imageUrl,
  });
}

// Define your Hive Box for caching Blogs data
class BlogsBox {
  static const String boxName = 'blogs_box';

  Future<void> openBox() async {
    await Hive.openBox<BlogsData>(boxName);
  }

  // You can add more methods to interact with the box here if needed.
}

// Define the Hive adapter for your Blogs class
class BlogsAdapter extends TypeAdapter<BlogsData> {
  @override
  final int typeId = 0; // Unique ID for this type

  @override
  BlogsData read(BinaryReader reader) {
    return BlogsData(
      id: reader.readString(),
      title: reader.readString(),
      imageUrl: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, BlogsData obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.imageUrl);
  }
}
