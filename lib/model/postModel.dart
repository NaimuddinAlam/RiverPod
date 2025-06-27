class PostModel {
  final int id;
  final String title;
  final String body;

  PostModel({required this.id, required this.body, required this.title});

  factory PostModel.jsonFrom(PostModel postmadel) {
    return PostModel(
      body: postmadel.body,
      title: postmadel.title,
      id: postmadel.id,
    );
  }
}
