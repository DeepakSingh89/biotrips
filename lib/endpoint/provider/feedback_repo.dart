import 'package:dio/dio.dart';

class FeedBackRepo {
  Dio client;
  FeedBackRepo({required this.client});

  sendFeedback(String tripId, String rating, String other) async {
    var data = ({
      "trip": tripId,
      "rating": rating,
      "cleanliness": true,
      "driving": true,
      "politeness": true,
      "other": other
    });

    Response response = await client.post("/api/review", data: data);
    
  }
}
