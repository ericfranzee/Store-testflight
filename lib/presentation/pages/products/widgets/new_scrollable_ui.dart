import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/new_ui/new_ui_bloc.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/presentation/components/product_items/new_product_item.dart';

class NewScrollableUi extends StatefulWidget {
  final List<ProductData> list;

  const NewScrollableUi({Key? key, required this.list}) : super(key: key);

  @override
  State<NewScrollableUi> createState() => _NewScrollableUiState();
}

class _NewScrollableUiState extends State<NewScrollableUi> {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<NewUiBloc, NewUiState>(
        builder: (context, state) {
        return GestureDetector(
          onPanUpdate: (details) {

            var topPos = state.top + (details.delta.dy * 3);
            var leftPos = state.left + (details.delta.dx * 3);
            if ((leftPos < 50 && leftPos > -widget.list.length * 80) &&
                (topPos < 90 && topPos > -widget.list.length * 70)){
              context
                  .read<NewUiBloc>()
                  .add(NewUiEvent.updateCart(top: topPos, left: leftPos));
            }
          },
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white10,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeOut,
                    top: state.top,
                    left: state.left,
                    child: SizedBox(
                      width: sqrt(widget.list.length).toInt() * 420.r,
                      child: Wrap(
                          children: List.generate(
                            widget.list.length,
                                (index) =>
                                Transform.translate(
                                  offset: Offset(0, index.isEven ? 60.r : 0),
                                  child: SizedBox(
                                    width: 260.r,
                                    height: 450.r,
                                    child: NewProductItem(
                                      product: widget.list[index],
                                    ),
                                  ),
                                ),
                          )),
                    ),
                  ),
                ],
              )),
        );
      }
    );
  }
}
