import 'package:dro_health_pharmacy/feature/shopping/presentation/view_models/cart_view_model.dart';
import 'package:dro_health_pharmacy/feature/shopping/presentation/widgets/item_card.dart';
import 'package:dro_health_pharmacy/feature/shopping/presentation/widgets/long_button.dart';
import 'package:dro_health_pharmacy/utilities/colors.dart' as AppColor;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildBottomSheet(
  BuildContext context,
) {
  Size screenSize = MediaQuery.of(context).size;
  return Consumer<CartViewModel>(
    builder: (context, provider, child) => DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.1,
      builder: (context, ScrollController controller) {
        double total = provider.calculateTotal();
        return SingleChildScrollView(
          controller: controller,
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.darkPurple,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
            height: screenSize.height,
            width: screenSize.width,
            child: Column(
              children: [
                Container(
                  height: screenSize.height * 0.1,
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    color: AppColor.darkPurple,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_bag_outlined,
                            color: AppColor.appWhite,
                          ),
                          Text(
                            "Bag",
                            style: TextStyle(
                              color: AppColor.appWhite,
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: screenSize.width * 0.1,
                          height: screenSize.height * 0.007,
                          decoration: BoxDecoration(
                            color: AppColor.appWhite,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      Container(
                        width: screenSize.height * 0.06,
                        height: screenSize.height * 0.06,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.appWhite,
                        ),
                        child: Text(
                          "${provider.bagLength}",
                          style: TextStyle(
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColor.appWhite,
                  ),
                  child: Text(
                    "Tap on an item for add, delete or remove options",
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      if (provider.bag.isEmpty) {
                        return Center(
                          child: Text(
                            "Shopping bag is empty at the time",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      } else {
                        return ItemCard(
                          medicine: provider.bag[index],
                        );
                      }
                    },
                    itemCount: provider.bagLength,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                            color: AppColor.appWhite,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "₦$total",
                        style: TextStyle(color: AppColor.appWhite),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: CustomLongButton(
                    label: "Checkout",
                    labelColor: Colors.black,
                    onTap: () {},
                    color: AppColor.appWhite,
                    borderRadius: 30,
                  ),
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}
