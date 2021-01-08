import 'package:dro_health_pharmacy/feature/shopping/data/models/cart_model.dart';
import 'package:dro_health_pharmacy/feature/shopping/presentation/view_models/cart_view_model.dart';
import 'package:dro_health_pharmacy/utilities/colors.dart' as AppColor;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatefulWidget {
  final CartItem medicine;

  const ItemCard({Key key, this.medicine}) : super(key: key);
  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  void increment() {
    widget.medicine.numberOfItem++;
  }

  void decrease() {
    if (widget.medicine.numberOfItem > 1) {
      widget.medicine.numberOfItem--;
    }
  }

  bool menuVisible = false;
  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<CartViewModel>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                menuVisible = !menuVisible;
              });
            },
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.appWhite,
                    image: DecorationImage(
                      image: AssetImage("images/drug.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  "${widget.medicine.numberOfItem}X",
                  style: TextStyle(color: AppColor.appWhite),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.medicine?.medicine?.name ?? ""}",
                      style: TextStyle(
                        color: AppColor.appWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "${widget.medicine?.medicine?.detail ?? ""}",
                      style: TextStyle(
                        color: AppColor.appWhite,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "₦${widget.medicine.medicine.price * widget.medicine?.numberOfItem}",
                  style: TextStyle(color: AppColor.appWhite),
                ),
              ],
            ),
          ),
          Visibility(
            visible: menuVisible,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    final provider =
                        Provider.of<CartViewModel>(context, listen: false);
                    provider.removeFromBag(widget.medicine);
                  },
                  child: Icon(
                    Icons.delete,
                    color: AppColor.appWhite,
                    size: 30,
                  ),
                ),
                Spacer(),
                iconButton(
                  () {
                    setState(() {
                      decrease();
                    });
                    provide.calculateTotal();
                  },
                  Icon(
                    Icons.remove,
                    color: AppColor.darkPurple,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${widget.medicine?.numberOfItem}",
                  style: TextStyle(color: AppColor.appWhite, fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                iconButton(
                  () {
                    provide.calculateTotal();
                    setState(() {
                      increment();
                    });
                  },
                  Icon(
                    Icons.add,
                    color: AppColor.darkPurple,
                  ),
                ),
              ],
            ),
            replacement: SizedBox(),
          ),
        ],
      ),
    );
  }
}

iconButton(Function onPressed, Icon icon) {
  return Material(
    color: AppColor.appWhite,
    shape: CircleBorder(),
    child: Center(
      child: Ink(
        decoration: ShapeDecoration(
          color: AppColor.appWhite,
          shape: CircleBorder(),
        ),
        child: IconButton(icon: icon, onPressed: onPressed),
      ),
    ),
  );
}
