
class PersonalInfoData {

  String? fullName;

  String? id;

  String? retypeId;

  bool isInputFull(){
    return fullName?.isNotEmpty == true && id?.isNotEmpty == true && retypeId?.isNotEmpty == true;
  }

  void reset(){
    fullName = null;
    id = null;
    retypeId = null;
  }

}