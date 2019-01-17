

class Contact {
  const Contact({this.name,this.firstname,this.number,this.linkPicture,this.email});
  final String name;
  final  String firstname;
  final String number;
  final String linkPicture;
  final String email;

}


class ContactSelect extends Contact {
   bool checkbox;
  final String email;
  final String name;
  final  String firstname;
  final String number;

  ContactSelect({this.checkbox,this.email,this.name,this.firstname,this.number});
}
