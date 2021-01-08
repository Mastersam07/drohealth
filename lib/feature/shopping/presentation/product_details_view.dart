import 'package:dro_health_pharmacy/feature/shopping/data/models/cart_model.dart';
import 'package:dro_health_pharmacy/feature/shopping/data/models/medicine_model.dart';
import 'package:dro_health_pharmacy/feature/shopping/presentation/view_models/cart_view_model.dart';
import 'package:dro_health_pharmacy/feature/shopping/presentation/widgets/long_button.dart';
import 'package:dro_health_pharmacy/utilities/colors.dart' as AppColor;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsView extends StatefulWidget {
  final Medicine med;

  const ProductDetailsView({Key key, this.med}) : super(key: key);

  @override
  _ProductDetailsViewState createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int numberOfItem = 1;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartViewModel>(context, listen: false);
    final providerListener = Provider.of<CartViewModel>(context);
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Icon(Icons.arrow_back),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.darkPurple,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_bag_outlined),
                      Text(
                        "${providerListener.bagLength}",
                        style: TextStyle(color: AppColor.appWhite),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Image(
              image: AssetImage("images/drug.png"),
              height: screenSize.height * 0.18,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.med?.name ?? "",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            Text(
              widget.med?.detail ?? "",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColor.appGrey,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SOLD BY",
                      style: TextStyle(
                        color: AppColor.appGrey.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      widget.med?.seller ?? "",
                      style: TextStyle(
                        color: AppColor.droPurple,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.appGrey.withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (numberOfItem > 0) numberOfItem--;
                            });
                          }),
                      Text(
                        "$numberOfItem",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              numberOfItem++;
                            });
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${widget.med?.modeOfDispense ?? ""}(s)",
                  style: TextStyle(
                    color: AppColor.appGrey.withOpacity(0.5),
                  ),
                ),
                Spacer(),
                Text(
                  "₦${widget.med?.price ?? ""}",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ],
            ),
            Spacer(),
            Text(
              "PRODUCT DETAILS",
              style: TextStyle(
                color: AppColor.appGrey.withOpacity(0.4),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 15,
              children: [
                ConstituentCard(
                  icon: Icon(Icons.drag_indicator),
                  title: "PACK SIZE",
                  size: "3X10",
                ),
                ConstituentCard(
                  icon: Icon(Icons.qr_code),
                  title: "PRODUCT ID",
                  size: widget.med?.id ?? "",
                ),
                ConstituentCard(
                  icon: Icon(Icons.drag_indicator),
                  title: "CONSTITUENTS",
                  size: widget.med?.constituents,
                ),
                ConstituentCard(
                  icon: Icon(Icons.drag_indicator),
                  title: "DISPENSED IN",
                  size: widget.med?.modeOfDispense,
                ),
              ],
            ),
            Spacer(),
            Text(
              "1 ${widget.med?.modeOfDispense ?? ""} of${widget.med?.name ?? ""} contains 3 units(s) of 10 tablet(s)",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.appGrey,
                fontSize: 12,
              ),
            ),
            Spacer(
              flex: 3,
            ),
            CustomLongButton(
              label: "Add to bag",
              onTap: () {
                provider.addToBag(
                    CartItem(medicine: widget.med, numberOfItem: numberOfItem));
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Transform.translate(
                                offset: Offset(0, -screenSize.height * 0.05),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.droTurquoise,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 4,
                                    ),
                                  ),
                                  height: screenSize.height * 0.1,
                                  width: screenSize.height * 0.1,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: screenSize.height * 0.08,
                                  ),
                                ),
                              ),
                              Text(
                                "Successful",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${widget.med?.name ?? ""} has been added to the bag",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomLongButton(
                                label: "View bag",
                                color: AppColor.droTurquoise,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                borderRadius: 0,
                              ),
                              CustomLongButton(
                                label: "Done",
                                color: AppColor.droTurquoise,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                borderRadius: 0,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              color: AppColor.droPurple,
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: AppColor.appWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConstituentCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String size;
  const ConstituentCard({
    Key key,
    @required this.icon,
    this.title,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 30),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? "SIZE",
                style: TextStyle(
                  color: AppColor.appGrey.withOpacity(0.4),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Text(
                size ?? "size",
                style: TextStyle(
                  color: AppColor.droPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
