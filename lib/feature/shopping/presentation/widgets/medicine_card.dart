import 'package:dro_health_pharmacy/feature/shopping/data/models/medicine_model.dart';
import 'package:dro_health_pharmacy/feature/shopping/presentation/product_details_view.dart';
import 'package:dro_health_pharmacy/utilities/colors.dart' as AppColor;
import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  final Medicine medicine;

  const MedicineCard({Key key, this.medicine}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsView(med: medicine),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 2),
                color: AppColor.appGrey.withOpacity(0.3),
                blurRadius: 2,
              ),
              BoxShadow(
                offset: Offset(-2, -2),
                color: AppColor.appGrey.withOpacity(0.3),
                blurRadius: 2,
              ),
            ],
            color: AppColor.appWhite),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Center(
                child: Image(
                  image: AssetImage(medicine?.imagePath ?? ""),
                  alignment: Alignment.center,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              medicine.name ?? "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              medicine.pharmName ?? "",
              style: TextStyle(
                color: AppColor.appGrey,
              ),
            ),
            Text(
              medicine.detail ?? "",
              style: TextStyle(
                color: AppColor.appGrey,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.appGrey,
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Text(
                  "₦${medicine?.price ?? ""}",
                  style: TextStyle(
                    color: AppColor.appWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
