class PostModel {
  final String content;
  final String? imageUrl;
  final List<String> tags;
  final String? universityTag;
  final String? specialtyTag;
  final String? yearTag;
  int upvotes = 0;
  int downvotes = 0;

  PostModel({
    required this.content,
    this.imageUrl,
    required this.tags,
    this.universityTag,
    this.specialtyTag,
    this.yearTag
  });
}
