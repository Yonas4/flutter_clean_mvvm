///onboarding model
class SliderObject {
  ///constructor
  SliderObject(this.title, this.subTitle, this.image);

  String title;
  String subTitle;
  String image;

}

class SliderViewObj {
  SliderViewObj(this.sliderObject, this.currentIndex, this.numOfSlid);

  SliderObject sliderObject;
  int numOfSlid;
  int currentIndex;
}

//login models
class Customer {
  Customer(this.id, this.name, this.nunOFNotiFicattons);

  String id;
  String name;
  String nunOFNotiFicattons;
}

class Contacts {
  Contacts(this.phone, this.email, this.link);

  String phone;
  String email;
  String link;
}

class Auth {
  Auth(this.customer, this.contacts);

  Customer? customer;
  Contacts? contacts;
}
