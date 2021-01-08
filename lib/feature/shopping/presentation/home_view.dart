import 'package:dro_health_pharmacy/feature/shopping/data/models/medicine_model.dart';
import 'package:dro_health_pharmacy/feature/shopping/presentation/view_models/core_view_model.dart';
import 'package:dro_health_pharmacy/feature/shopping/presentation/view_models/stock_view_model.dart';
import 'package:dro_health_pharmacy/feature/shopping/presentation/widgets/icon_button.dart';
import 'package:dro_health_pharmacy/feature/shopping/presentation/widgets/medicine_card.dart';
import 'package:dro_health_pharmacy/utilities/colors.dart' as AppColor;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _searchFieldController = TextEditingController();
  bool textFieldVisible = false;
  Medicine myMeds = Medicine(
      name: "Medicine o",
      pharmName: "Pharm Something",
      price: 5000,
      detail: "Medicine krmfpemlemtrgkoeo",
      imagePath: "images/drug.png");
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<StockViewModel>(context, listen: false).initializeApp();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Consumer<StockViewModel>(builder: (context, provider, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: provider.appState == AppState.busy
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColor.darkPurple,
                ),
              )
            : SafeArea(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${provider.allMeds.length} Item(s)",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                              icon: Icon(Icons.swap_vert_sharp),
                              onTap: () {},
                            ),
                            CustomIconButton(
                              icon: Icon(Icons.filter_list_alt),
                              onTap: () {},
                            ),
                            CustomIconButton(
                              icon: Icon(Icons.search),
                              onTap: () {
                                setState(() {
                                  textFieldVisible = !textFieldVisible;
                                });
                              },
                            ),
                          ],
                        ),
                        Visibility(
                          visible: textFieldVisible,
                          replacement: SizedBox(),
                          child:
                              buildTextField(context, _searchFieldController),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        provider.allMeds.isEmpty
                            ? Center(
                                child: Text("No Drugs Available at this time"),
                              )
                            : Expanded(
                                child: GridView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                      10, 5, 10, screenSize.height * 0.1),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    childAspectRatio: 0.75,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    if (provider.allMeds.isNotEmpty) {
                                      return MedicineCard(
                                        medicine: provider.filtered
                                            ? provider.filteredMeds[index]
                                            : provider.allMeds[index],
                                      );
                                    } else {
                                      return Center(
                                        child: Text("Medicine  stock is empty"),
                                      );
                                    }
                                  },
                                  itemCount: provider.filtered
                                      ? provider.filteredMeds.length
                                      : provider.allMeds.length,
                                ),
                              ),
                      ],
                    ),
                    buildBottomSheet(
                      context,
                    ),
                  ],
                ),
              ),
      );
    });
  }
}

Widget buildTextField(
  BuildContext context,
  TextEditingController controller,
) {
  Size screenSize = MediaQuery.of(context).size;
  final provider = Provider.of<StockViewModel>(context, listen: false);
  return Container(
    height: screenSize.height * 0.07,
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    child: TextFormField(
      controller: controller,
      onChanged: (parameter) {
        provider.search(parameter);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        prefixIcon: Icon(Icons.search),
        suffixIcon: InkWell(
          onTap: () {
            controller.clear();
          },
          child: Icon(Icons.clear),
        ),
      ),
    ),
  );
}
