

class GuestUserBean{

  final String userId;

  final String name;

  const GuestUserBean({required this.userId, required this.name});

  factory GuestUserBean.fromJson(Map<String,dynamic> map){
    String userId = map.containsKey("user_id") ? map["user_id"] : "";
    String name = map.containsKey("name") ? map["name"] : "";

    return GuestUserBean(userId: userId, name: name);
  }

}