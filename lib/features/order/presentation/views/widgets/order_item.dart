import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/order/data/models/orders_model.dart';
import 'package:food_app/features/order/presentation/mangers/order_cubit/order_cubit.dart';

class OrderItem extends StatelessWidget {
  final OrderModel order;

  OrderItem({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return Dismissible(
          key: Key("${order.id}"),
          onDismissed: (direction) {
            BlocProvider.of<OrderCubit>(context).deleteOrder(orderId: order.id);
          },
          direction: DismissDirection.endToStart,
          background: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16,
              ),
              color: Color(0xffFFB01D),
            ),
            child: Row(
              children: [
                Spacer(),
                Icon(
                  Icons.delete_outline_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 24,
                )
              ],
            ),
          ),
          child: Container(
            height: 120,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x0A323247),
                  blurRadius: 20,
                  offset: Offset(0, 4),
                  spreadRadius: -2,
                ),
                BoxShadow(
                  color: Color(0x070C1A4B),
                  blurRadius: 1,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    height: 120,
                    width: 120,
                    imageUrl: order.image,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error_outline_outlined),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 8.0, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          order.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff32324d),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_half,
                            color: Colors.amber,
                            size: 16,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '${order.rating.round()}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff8e8ea9),
                            ),
                          ),
                          Text(
                            "(120 reviews)",
                            style: TextStyle(
                              fontFamily: "Mulish",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffc0c0cf),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 8,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$',
                            style: TextStyle(
                              color: Color(0xFFFFB080),
                              fontSize: 9,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '${order.total}',
                            style: TextStyle(
                              color: Color(0xFFFF7B2C),
                              fontSize: 16,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w800,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.remove_circle,
                          color: Color(
                            0xFFFF7B2C,
                          ),
                          size: 30,
                        )),
                    Text('${order.quantity}'),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle,
                        color: Color(0xFFFF7B2C),
                        size: 30,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
