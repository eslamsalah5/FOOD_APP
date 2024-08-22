import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/service_locator.dart';
import 'package:food_app/core/widgets/nav_to.dart';
import 'package:food_app/core/utils/constants.dart';
import 'package:food_app/features/home/data/repos/home_repo_impl.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/home/presentation/mangers/cubit/add_order_cubit.dart';
import 'package:food_app/features/order/presentation/views/order_view.dart';

class BuyFoodButton extends StatefulWidget {
  final FoodEntitie food;
  const BuyFoodButton({
    super.key,
    required this.food,
  });

  @override
  State<BuyFoodButton> createState() => _BuyFoodButtonState();
}

class _BuyFoodButtonState extends State<BuyFoodButton> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(
        getIt.get<HomeRepoImpl>(),
      ),
      child: BlocBuilder<AddOrderCubit, AddOrderState>(
        builder: (context, state) {
          return Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: double.infinity,
              height: 90,
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: 16,
                horizontal: 24,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(26)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 90,
                    padding: const EdgeInsetsDirectional.symmetric(
                      vertical: 15,
                      horizontal: 0,
                    ),
                    decoration: BoxDecoration(
                        color: const Color(0xFFF6F6F9),
                        borderRadius: BorderRadiusDirectional.circular(16)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              if (widget.food.number > 0) {
                                setState(() {
                                  widget.food.number--;
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Color(0xff8E8EA9),
                            )),
                        Text(
                          '${widget.food.number}',
                          style: TextStyle(
                            fontSize: headLineFont3,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF8E8EA9),
                          ),
                        ),
                        IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              setState(() {
                                widget.food.number++;
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Color(0xff8E8EA9),
                            )),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      BlocProvider.of<AddOrderCubit>(context)
                          .addOrder(widget.food);
                          
                      navTo(context, const OrderView());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 90,
                      padding: const EdgeInsetsDirectional.symmetric(
                        vertical: 15,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                          color: const Color(0xFF615793),
                          borderRadius: BorderRadiusDirectional.circular(16)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add to order',
                            style: TextStyle(
                              fontSize: headLineFont2,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          Text(
                            '\$ ${widget.food.price * widget.food.number}',
                            style: TextStyle(
                              fontSize: headLineFont2,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFFFFFFFF),
                            ),
                          )
                        ],
                      ),
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
}
