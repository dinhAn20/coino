enum SignUpTab {
  name,
  gender,
  birthday,
  placeOfBirth,
  hope,
  experience,
  job,
  investing,
  company,
  occupation,
  idCard,
  address,
  house,
  selfie,
  emergency,
  contact,
  termsAndConditions,
  digitalSignature,
  congratulations,
}

extension SignUpTabX on SignUpTab {
  String get title {
    switch (this) {
      case SignUpTab.name:
        return "What is your name? 🧑 👩";
      case SignUpTab.gender:
        return "What is your gender? 🚻";
      case SignUpTab.birthday:
        return "Cool! When is your birthday? 🎂";
      case SignUpTab.placeOfBirth:
        return "Where were you born? 👶";
      case SignUpTab.hope:
        return "What do you hope to achieve with your crypto investments? 🚀";
      case SignUpTab.experience:
        return "Do you have any experience in cryptocurrency investing before? 🎓";
      case SignUpTab.job:
        return "What do you do for a living? 💼";
      case SignUpTab.investing:
        return "Are you investing with your savings? 💵";
      case SignUpTab.company:
        return "What’s the name of the company you work for? 🏢";
      case SignUpTab.occupation:
        return "What do you do at your company? 💼";
      case SignUpTab.idCard:
        return "Upload a photo of your National ID Card 🪪";
      case SignUpTab.address:
        return "What is your address on the ID Card you just uploaded? 🏠";
      case SignUpTab.house:
        return "What is status of this house? 🏠";
      case SignUpTab.selfie:
        return "But wait, you gotta take a selfie with your National ID Card 🤳";
      case SignUpTab.emergency:
        return "Last question, provide details of your emergency contact 🆘";
      case SignUpTab.contact:
        return "What are their contact details? 🤙 ";
      case SignUpTab.termsAndConditions:
        return "By checking the box, you agree to our terms and conditions 📜";
      case SignUpTab.digitalSignature:
        return "Last step, can we get your digital signature? ✍️";
      case SignUpTab.congratulations:
        return "Congratulations!\nYour account is ready 🚀";
    }
  }

  String? get subTitle {
    switch (this) {
      case SignUpTab.name:
        return null;
      case SignUpTab.gender:
        return null;
      case SignUpTab.birthday:
        return null;
      case SignUpTab.placeOfBirth:
        return null;
      case SignUpTab.hope:
        return null;
      case SignUpTab.experience:
        return null;
      case SignUpTab.job:
        return null;
      case SignUpTab.investing:
        return null;
      case SignUpTab.company:
        return "Regulations require us to ask you this question. We will never contact your company.";
      case SignUpTab.occupation:
        return null;
      case SignUpTab.idCard:
        return "Regulations require you to upload a national identity card. Don't worry, your data will stay safe and private.";
      case SignUpTab.address:
        return null;
      case SignUpTab.house:
        return null;
      case SignUpTab.selfie:
        return "Make sure your face is clearly visible. Hold your ID card with a selfie.";
      case SignUpTab.emergency:
        return "Regulations require us to ask you this question. We will never contact your emergency contact.";
      case SignUpTab.contact:
        return "Regulations require us to ask you this question. We will never contact your emergency contact.";
      case SignUpTab.termsAndConditions:
        return null;
      case SignUpTab.digitalSignature:
        return null;
      case SignUpTab.congratulations:
        return null;
     
    }
  }

  double get progressVal {
    int length = SignUpTab.values.length;
    return (index + 1) / (length - 1);
  }
}