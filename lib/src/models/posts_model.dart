
import 'dart:convert';

List<PostsResponse> postsResponseFromJson(String str) => List<PostsResponse>.from(json.decode(str).map((x) => PostsResponse.fromJson(x)));

String postsResponseToJson(List<PostsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostsResponse {
    PostsResponse({
        this.userId,
        this.id,
        this.title,
        this.body,
        this.isFavorite
    });

    int userId;
    int id;
    String title;
    String body;
    bool isFavorite;

    factory PostsResponse.fromJson(Map<String, dynamic> json) => PostsResponse(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
        isFavorite: false
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
        "isFavorite": isFavorite
    };
}
