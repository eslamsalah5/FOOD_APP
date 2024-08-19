import 'package:flutter/material.dart';
import 'package:food_app/models/add_topping_model.dart';
import 'package:food_app/views/eat_view/widgets/food_bottom_sheet/widgets/add_topping.dart';

class AddToppingListView extends StatelessWidget {
  const AddToppingListView({
    super.key,
    required this.addTopping,
  });

  final List<AddToppingModel> addTopping;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) =>
          Addtopping(addToppingModel: addTopping[index]),
      itemCount: addTopping.length,
    );
  }
}
