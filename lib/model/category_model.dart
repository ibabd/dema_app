class CategoryModel {
  String? id;
  String? nameProject;
  String? describeProject;
  String? nameCharity;
  String? addressCharity;
  String? emailCharity;
  String? benefitsName;

  String? image;

  CategoryModel(
      {this.id,
      this.nameProject,
      this.image,
      this.describeProject,
      this.addressCharity,
      this.nameCharity,
      this.benefitsName,
      this.emailCharity});

  CategoryModel.fromJJson(Map<String, dynamic> json) {
    id = json['id'];
    nameProject = json['nameProject'];
    describeProject = json['descriptionProject'];
    nameCharity = json['nameCharity'];
    addressCharity = json['addressCharity'];
    benefitsName = json['benefits'];
    image = json['image'];
  }
  Map<String,dynamic>toJson(){
    final Map<String,dynamic> data=<String,dynamic>{};
    data['id']=id;
    data['nameProject']=nameProject;
    data['descriptionProject']=describeProject;
    data['nameCharity']=nameCharity;
    data['addressCharity']=addressCharity;
    data['benefits']=benefitsName;
    data['image']=image;
    return data;
  }
}
