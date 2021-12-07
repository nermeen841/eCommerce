import 'package:flutter/material.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/components/default_button.dart';

class VouncherMarket extends StatefulWidget {
  @override
  _VouncherMarketState createState() => _VouncherMarketState();
}

class _VouncherMarketState extends State<VouncherMarket> {
  final _formKey = GlobalKey<FormState>();
  String vounchercode;

  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: true,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Use avouncher on this order",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).cardColor),
              ),
              spaceH(40),
              buildVouncherTextfield(),
              spaceH(40),
              DefaultButton(
                text: "Use Vouncher",
                press: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  TextFormField buildVouncherTextfield() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => vounchercode = newValue,
      onChanged: (value) {},
      decoration: InputDecoration(
        hintText: "Enter vouncher code",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).cardColor),
        ),
      ),
    );
  }
}
