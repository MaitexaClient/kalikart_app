import 'package:flutter/material.dart';
import 'package:kalicart/common/widgets/row_product_card.dart';


class CompletedOrderListWidget extends StatelessWidget {
  const CompletedOrderListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
        child: 
            const RowProductCard(),  
        
      ),
    );
  }
}
