import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:trading_app/common/theme/colors.dart';
import 'package:trading_app/common/utils/extensions/datetime_extension.dart';
import 'package:trading_app/common/utils/extensions/text_style_extension.dart';
import 'package:trading_app/widgets/cached_image.dart';

import '../../../common/constants/images.dart';
import '../../../configs/size_config.dart';
import '../../../widgets/button.dart';
import '../../../widgets/select_radio.dart';
import '../../../widgets/text_field.dart';
import '../helpers/enums/sign_up_tab_enum.dart';
import 'title_with_subtitle_text.dart';



class SignUpTabs extends StatefulWidget {
  const SignUpTabs({super.key, required this.signUpTab});

  final SignUpTab signUpTab;

  @override
  State<SignUpTabs> createState() => _SignUpTabsState();
}

class _SignUpTabsState extends State<SignUpTabs> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameOfEmergencyController =
      TextEditingController();
  final TextEditingController _addressOfEmergencyController =
      TextEditingController();
  final TextEditingController _relationshipController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _placeOfBirthController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _streetAddressController =
      TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  late String _currentHopeOption = _hopeOptions.first;
  late String _currentJobOption = _jobOptions.first;
  late String _currentHouseStatusOption = _houseStatusOptions.first;
  final List<String> _currentTermsAndConditions = [];
  Size get size => MediaQuery.of(context).size;
  bool _hasExperience = true;
  bool _isInvesting = true;
  Gender _selectedGender = Gender.male;

  final List<String> _hopeOptions = [
    "I want to grow my capital",
    "I want to speculate",
    "I want to hedge",
    "I want to learn investments",
    "I still don't know for sure",
  ];
  final List<String> _jobOptions = [
    "I’m employed",
    "I’m a professional",
    "I’m an entrepreneur",
    "I’m a freelancer",
    "I’m a student",
    "I’m a stay at home spouse",
  ];
  final List<String> _houseStatusOptions = [
    "A house I own",
    "A house I rent",
    "My family’s house",
    "My mother-in-law's house",
    "Other",
  ];
  final List<String> _termsAndConditions = [
    "I certify that I am a national of the United States of America.",
    "I am not currently or formerly a politically exposed person or public official.",
    "I am not working at and do not have family members working at Coino.",
    "I have read, understood and agree to be bound by all terms, disclosures, certifications, and disclaimers applicable to me, as found on the legal page of the Coino website.",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TitleWithSubtitleText(
            title: widget.signUpTab.title,
            subTitle: widget.signUpTab.subTitle,
          ),
          SizedBox(height: getProportionateScreenHeight(32)),
          _buildBody()
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (widget.signUpTab) {
      case SignUpTab.name:
        return BasicTextField(
          label: "Full Name",
          controller: _nameController,
        );
      case SignUpTab.gender:
        return SelectGenderField(
          selectedGender: _selectedGender,
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _selectedGender = value;
              });
            }
          },
        );
      case SignUpTab.birthday:
        return SelectDateTextField(
          controller: _dateOfBirthController,
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _dateOfBirthController.text = value.toDDMMYYYYString();
              });
            }
          },
        );
      case SignUpTab.placeOfBirth:
        return BasicTextField(
          label: "Place of Birth",
          controller: _placeOfBirthController,
        );
      case SignUpTab.hope:
        return SelectRadioField(
            selectedValue: _currentHopeOption,
            onChanged: (value) {
              if (value?.isNotEmpty ?? false) {
                setState(() {
                  _currentHopeOption = value!;
                });
              }
            },
            list: _hopeOptions);
      case SignUpTab.experience:
        return SelectRadioYesNoField(
          selectedValue: _hasExperience,
          onChanged: (value) {
            setState(() {
              _hasExperience = value ?? false;
            });
          },
        );
      case SignUpTab.job:
        return SelectRadioField(
            selectedValue: _currentJobOption,
            onChanged: (value) {
              if (value?.isNotEmpty ?? false) {
                setState(() {
                  _currentJobOption = value!;
                });
              }
            },
            list: _jobOptions);
      case SignUpTab.investing:
        return SelectRadioYesNoField(
          selectedValue: _isInvesting,
          onChanged: (value) {
            setState(() {
              _isInvesting = value ?? false;
            });
          },
        );
      case SignUpTab.company:
        return BasicTextField(
          label: "Company Name",
          controller: _companyNameController,
        );
      case SignUpTab.occupation:
        return BasicTextField(
          label: "Your Occupation",
          controller: _occupationController,
        );
      case SignUpTab.idCard:
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 70),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  border: const GradientBoxBorder(
                      gradient: kGreenGradient, width: 3)),
              child: Center(
                child: Column(
                  children: [
                    const Icon(
                      CupertinoIcons.photo,
                      color: kGray500,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      "Select file",
                      style:
                          Theme.of(context).textTheme.bodyLarge!.w500.gray500,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      "or",
                      style:
                          Theme.of(context).textTheme.titleMedium!.w400.gray700,
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
            ),
            BasicButton(
                padding: const EdgeInsets.symmetric(vertical: 18),
                backgroundColor: kPrimary100Color,
                radius: 100,
                width: double.infinity,
                icon: const Icon(
                  CupertinoIcons.camera_fill,
                  size: 18,
                ),
                textStyle: Theme.of(context).textTheme.bodyLarge!.w600.primary,
                label: "Open Camera & Take Photo"),
          ],
        );
      case SignUpTab.address:
        return Column(
          children: [
            BasicTextField(
              label: "Street Address",
              controller: _streetAddressController,
            ),
            const SizedBox(height: 40),
            BasicTextField(
              label: "City",
              controller: _cityController,
            ),
            const SizedBox(height: 40),
            BasicTextField(
              readOnly: true,
              label: "Country",
              controller: _countryController,
              suffixIcon: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  )),
            ),
          ],
        );
      case SignUpTab.house:
        return SelectRadioField(
            selectedValue: _currentHouseStatusOption,
            onChanged: (value) {
              if (value?.isNotEmpty ?? false) {
                setState(() {
                  _currentHouseStatusOption = value!;
                });
              }
            },
            list: _houseStatusOptions);
      case SignUpTab.selfie:
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 21),
          child: CachedImage(
            width: double.infinity,
            url: kSelfieImage,
          ),
        );
      case SignUpTab.emergency:
        return Column(
          children: [
            BasicTextField(
              label: "Full Name",
              controller: _nameOfEmergencyController,
            ),
            const SizedBox(height: 40),
            BasicTextField(
              label: "Relationship",
              controller: _relationshipController,
            ),
            const SizedBox(height: 40),
            BasicTextField(
              label: "Address",
              controller: _addressOfEmergencyController,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
                Text(
                  "Same as my address",
                  style: Theme.of(context).textTheme.titleMedium!.w600,
                ),
              ],
            )
          ],
        );
      case SignUpTab.contact:
        return Column(
          children: [
            BasicTextField(
              label: "Email",
              controller: _emailController,
            ),
            const SizedBox(height: 40),
            BasicTextField(
              label: "Phone Number",
              controller: _phoneController,
              keyboardType: TextInputType.phone,
            ),
          ],
        );
      case SignUpTab.termsAndConditions:
        return Column(
          children: _termsAndConditions
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Checkbox(
                          value: _currentTermsAndConditions.contains(e),
                          onChanged: (value) {
                            if (value == true) {
                              setState(() {
                                _currentTermsAndConditions.add(e);
                              });
                            } else {
                              setState(() {
                                _currentTermsAndConditions.remove(e);
                              });
                            }
                          },
                        ),
                        Expanded(
                          child: Text(
                            e,
                            style:
                                Theme.of(context).textTheme.titleMedium!.w600,
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        );
      case SignUpTab.digitalSignature:
        return Column(
          children: [
            BasicTextField(
              label: "Full Name",
              controller: _nameController,
            ),
            const SizedBox(height: 32),
            Container(
              height: 360,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  border: const GradientBoxBorder(
                      gradient: kGreenGradient, width: 3)),
            ),
          ],
        );
      case SignUpTab.congratulations:
        return Column(
          children: [
            const CachedImage(
              width: double.infinity,
              url: kCongratulationsImage,
            ),
            const SizedBox(height: 32),
            Text(
              "Make a deposit now to activate your account now! Or you can do it later.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.w500,
            )
          ],
        );
      
    }
  }
}
