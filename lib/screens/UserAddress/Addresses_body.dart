import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/UserAddress/card_Address.dart';
import 'package:shop_app/screens/add_address/add_address.dart';
import 'package:shop_app/size_config.dart';
import 'package:easy_localization/easy_localization.dart';

class AddressesBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(20),
              horizontal: getProportionateScreenWidth(20)),
          child: Stack(
            children: [
              ListView.builder(
                  primary: true,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return AddressCard();
                  }),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 100,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  color: Colors.white,
                  child: DefaultButton(
                    text: LocalKeys.ADDNEWADDRESS.tr(),
                    press: () =>
                        Navigator.pushNamed(context, AddNewAddress.routeName),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
