import 'package:cloud_firestore/cloud_firestore.dart';

class ThreeCard {
  final String id;
  final String img;
  final String past;
  final String present;
  final String future;

  ThreeCard(this.id, this.img, this.past, this.present, this.future);

  factory ThreeCard.fromJson(
    Map<String, dynamic> json,
  ) {
    return ThreeCard(
      json['id'] as String,
      json['img'] as String,
      json['past'] as String,
      json['present'] as String,
      json['future'] as String,
    );
  }
}

class AllThreeCard {
  final List<ThreeCard> threecard;
  AllThreeCard(this.threecard);

  factory AllThreeCard.fromJson(List<dynamic> json) {
    List<ThreeCard> threecard;

    threecard = json.map((index) => ThreeCard.fromJson(index)).toList();
    return AllThreeCard(threecard);
  }

  factory AllThreeCard.fromSnapshot(QuerySnapshot s) {
    List<ThreeCard> threecard = s.docs.map((DocumentSnapshot ds) {
      return ThreeCard.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllThreeCard(threecard);
  }
}
