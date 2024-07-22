// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibeauty/domain/interface/cart.dart';
import 'package:ibeauty/domain/model/model/local_cart_model.dart';
import 'package:ibeauty/domain/model/response/cart_calculate_response.dart';
import 'package:ibeauty/domain/model/response/cart_response.dart';
import 'package:ibeauty/domain/model/response/product_calculate_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';

part 'cart_event.dart';

part 'cart_state.dart';

part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartInterface _cartRepo;

  CartBloc(this._cartRepo) : super(const CartState()) {
    on<GetCart>((event, emit) async {
      if (event.refresh ?? false) {
        emit(state.copyWith(isButtonLoading: true));
      } else {
        emit(state.copyWith(isLoading: true));
      }
      if (LocalStorage.getGroupOrder().id == null &&
          LocalStorage.getCartList().isNotEmpty) {
        _cartRepo.insertCart();
      } else {
        _cartRepo.insertGroupCart();
      }

      final res = LocalStorage.getGroupOrder().id == null
          ? await _cartRepo.getCart()
          : await _cartRepo.getGroupCart();
      res.fold((l) {
        emit(state.copyWith(
            isLoading: false, isButtonLoading: false, cart: l.cart, notes: []));
        if (!(state.cart?.group ?? false)) {
          LocalStorage.deleteGroupOrder();
        }
        List<LocalCartModel> list = [];
        l.cart?.userCarts?.first.cartDetails?.forEach((element) {
          element.cartDetailProducts?.forEach((e) {
            if (!(e.bonus ?? false)) {
              list.add(LocalCartModel(
                  productId: e.stocks?.product?.id,
                  stockId: e.stocks?.id ?? 0,
                  count: e.quantity ?? 0));
            }
          });
        });
        LocalStorage.setTotalCartList(list: list);
      }, (r) {
        emit(state.copyWith(
          isLoading: false,
          isButtonLoading: false,
        ));
        if (r != "Item's not found.") {
          AppHelper.errorSnackBar(context: event.context, message: r);
        }
      });
    });

    on<InsertCart>((event, emit) async {
      if (LocalStorage.getCartList().isNotEmpty) {
        if (event.refresh ?? false) {
          emit(state.copyWith(isButtonLoading: true));
        } else {
          emit(state.copyWith(isLoading: true));
        }

        if (LocalStorage.getGroupOrder().id != null) {
          final res = await _cartRepo.insertGroupCart();
          res.fold((l) {
            emit(state.copyWith(
                isLoading: false,
                isButtonLoading: false,
                cart: l.cart,
                notes: []));

            event.onSuccess.call();
          }, (r) {
            emit(state.copyWith(
              isLoading: false,
              isButtonLoading: false,
            ));
            AppHelper.errorSnackBar(context: event.context, message: r);
          });
          return;
        }

        if (LocalStorage.getToken().isNotEmpty) {
          final res = await _cartRepo.insertCart();
          res.fold((l) {
            emit(state.copyWith(
                isLoading: false,
                isButtonLoading: false,
                cart: l.cart,
                notes: []));
            if (!(state.cart?.group ?? false)) {
              LocalStorage.deleteGroupOrder();
            }
            List<LocalCartModel> list = [];
            l.cart?.userCarts?.first.cartDetails?.forEach((element) {
              element.cartDetailProducts?.forEach((e) {
                if (!(e.bonus ?? false)) {
                  list.add(LocalCartModel(
                      productId: e.stocks?.product?.id,
                      stockId: e.stocks?.id ?? 0,
                      count: e.quantity ?? 0));
                }
              });
            });

            LocalStorage.setTotalCartList(list: list);
            event.onSuccess.call();
          }, (r) {
            emit(state.copyWith(
              isLoading: false,
              isButtonLoading: false,
            ));
            AppHelper.errorSnackBar(context: event.context, message: r);
          });
        } else {
          if (LocalStorage.getCartList()
              .where((element) => element.count > 0)
              .isEmpty) {
            emit(state.copyWith(
              isLoading: false,
              isButtonLoading: false,
            ));
            return;
          }
          final res = await _cartRepo.productCalculateCart();
          res.fold((p) {
            emit(state.copyWith(
                isLoading: false,
                isButtonLoading: false,
                productCalculate: p,
                notes: []));

            List<LocalCartModel> list = [];
            p.data?.shops?.forEach((element) {
              element.stocks?.forEach((e) {
                list.add(LocalCartModel(
                    productId: e.stock?.product?.id,
                    stockId: e.stock?.id ?? 0,
                    count: e.quantity ?? 0));
              });
            });

            LocalStorage.setTotalCartList(list: list);
            event.onSuccess.call();
          }, (r) {
            emit(state.copyWith(
              isLoading: false,
              isButtonLoading: false,
            ));
            AppHelper.errorSnackBar(context: event.context, message: r);
          });
        }
      } else {
        emit(state.copyWith(
          isLoading: true,
        ));
        emit(state.copyWith(
          isLoading: false,
          isButtonLoading: false,
        ));
      }
    });

    on<RemoveProductCart>((event, emit) async {
      if (LocalStorage.getToken().isNotEmpty && (state.cart?.group ?? false)) {
        return;
      }
      emit(state.copyWith(isButtonLoading: true));
      final res = await _cartRepo.removeProductCart(
          cartDetailId: event.cartDetailId ?? 0);
      res.fold((l) {
        emit(state.copyWith(isButtonLoading: false, cart: l.cart));
        List<LocalCartModel> list = [];
        l.cart?.userCarts?.first.cartDetails?.forEach((element) {
          element.cartDetailProducts?.forEach((e) {
            if (!(e.bonus ?? false)) {
              list.add(LocalCartModel(
                  productId: e.stocks?.product?.id,
                  stockId: e.stocks?.id ?? 0,
                  count: e.quantity ?? 0));
            }
          });
        });

        LocalStorage.setTotalCartList(list: list);
        if (LocalStorage.getToken().isNotEmpty) {
          event.context
              .read<CartBloc>()
              .add(CartEvent.calculateCartWithCoupon(context: event.context));
        }
      }, (r) {
        emit(state.copyWith(
          isButtonLoading: false,
        ));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<SetNotes>((event, emit) {
      emit(state.copyWith(isButtonLoading: true));
      List<ProductNote> list = List.from(state.notes ?? []);
      bool isAdd = true;
      for (int i = 0; i < list.length; i++) {
        if (list[i].stockId == event.stockId) {
          list[i].comment = event.note;
          isAdd = false;
          break;
        }
      }
      if (isAdd) {
        list.add(ProductNote(stockId: event.stockId, comment: event.note));
      }
      emit(state.copyWith(notes: list, isButtonLoading: false));
    });

    on<CheckCoupon>((event, emit) async {
      if (event.clear ?? false) {
        emit(state.copyWith(coupons: {}));
        return;
      }

      final res = await _cartRepo.checkCoupon(
          coupon: event.coupon, shopId: event.shopId);
      res.fold((l) {
        Map<int, String> coupons = Map.from(state.coupons);
        coupons[event.shopId] = event.coupon;
        emit(state.copyWith(coupons: coupons));
      }, (r) {
        Map<int, String> coupons = Map.from(state.coupons);
        coupons.remove(event.shopId);
        emit(state.copyWith(coupons: coupons));
        if (event.coupon.trim().isNotEmpty) {
          AppHelper.errorSnackBar(
            context: event.context,
            message: r,
          );
        }
      });
    });

    on<UpdateState>((event, emit) {
      emit(state.copyWith(isLoading: !state.isLoading));
      emit(state.copyWith(isLoading: !state.isLoading));
    });

    on<CalculateCart>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        cartCalculate: null,
      ));
      final res = await _cartRepo.calculateCart(
          cartId: state.cart?.id ?? 0,
          pointId: event.pointId,
          deliveryPriceId: event.deliveryPriceId,
          coupon: state.coupons,
          fullDigital: event.fullDigital);
      res.fold((l) {
        emit(state.copyWith(isLoading: false, cartCalculate: l.data));
      }, (r) {
        emit(state.copyWith(isLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<CalculateCartWithCoupon>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        cartCalculate: null,
      ));
      final res = await _cartRepo.calculateCart(
        fullDigital: true,
        cartId: state.cart?.id ?? 0,
        withoutDeliveryFee: true,
        coupon: state.coupons,
      );
      res.fold((l) {
        emit(state.copyWith(isLoading: false, cartCalculate: l.data));
      }, (r) {
        emit(state.copyWith(isLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<StartGroupOrder>((event, emit) async {
      emit(state.copyWith(isButtonLoading: true));

      final res = await _cartRepo.startGroupOrder(cartId: state.cart?.id);
      res.fold((l) {
        emit(state.copyWith(cart: l.cart));
        event.onSuccess.call();
      }, (r) {
        emit(state.copyWith(
          isButtonLoading: false,
        ));
      });
    });

    on<CreateLink>((event, emit) async {
      if (state.cart?.group ?? false) {
        final res = await _cartRepo.createLink(cartId: state.cart?.id ?? 0);
        res.fold((l) {
          emit(state.copyWith(isButtonLoading: false, groupOrderLink: l));
        }, (r) {
          emit(state.copyWith(
            isButtonLoading: false,
          ));
        });
      }
    });

    on<DeleteCart>((event, emit) async {
      emit(state.copyWith(isButtonLoading: true));
      final res = await _cartRepo.deleteCart(cartId: state.cart?.id ?? 0);
      res.fold((l) {
        LocalStorage.deleteCartList();
        emit(state.copyWith(isButtonLoading: false, cart: null));
      }, (r) {
        emit(state.copyWith(isButtonLoading: false));
      });
    });

    on<DeleteUser>((event, emit) async {
      emit(state.copyWith(isButtonLoading: true));
      final res = await _cartRepo.deleteUser(
          cartId: state.cart?.id ?? 0, uuid: event.uuid);
      event.onSuccess.call();
      res.fold((l) {
        emit(state.copyWith(isButtonLoading: false));
      }, (r) {
        emit(state.copyWith(isButtonLoading: false));
      });
    });

    on<ChangeReady>((event, emit) async {
      emit(state.copyWith(isButtonLoading: true));
      final res = await _cartRepo.changeStatus(
          cartId: state.cart?.id ?? 0, uuid: event.uuid);
      event.onSuccess.call();
      res.fold((l) {
        emit(state.copyWith(isButtonLoading: false));
      }, (r) {
        emit(state.copyWith(isButtonLoading: false));
      });
    });
  }
}
