class Giveaways {
  int? id;
  String? title;
  String? worth;
  String? thumbnail;
  String? image;
  String? description;
  String? instructions;
  String? openGiveawayUrl;
  String? publishedDate;
  String? type;
  String? platforms;
  String? endDate;
  int? users;
  String? status;
  String? gamerpowerUrl;
  String? openGiveaway;

  Giveaways(
      {this.id,
      this.title,
      this.worth,
      this.thumbnail,
      this.image,
      this.description,
      this.instructions,
      this.openGiveawayUrl,
      this.publishedDate,
      this.type,
      this.platforms,
      this.endDate,
      this.users,
      this.status,
      this.gamerpowerUrl,
      this.openGiveaway});

  Giveaways.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    worth = json['worth'];
    thumbnail = json['thumbnail'];
    image = json['image'];
    description = json['description'];
    instructions = json['instructions'];
    openGiveawayUrl = json['open_giveaway_url'];
    publishedDate = json['published_date'];
    type = json['type'];
    platforms = json['platforms'];
    endDate = json['end_date'];
    users = json['users'];
    status = json['status'];
    gamerpowerUrl = json['gamerpower_url'];
    openGiveaway = json['open_giveaway'];
  }
}
