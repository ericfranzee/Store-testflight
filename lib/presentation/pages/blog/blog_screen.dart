import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cea_zed/application/blog/blog_bloc.dart';
import 'package:cea_zed/domain/service/helper.dart';
import 'package:cea_zed/domain/service/tr_keys.dart';
import 'package:cea_zed/infrastructure/local_storage/local_storage.dart';
import 'package:cea_zed/presentation/components/button/pop_button.dart';
import 'package:cea_zed/presentation/components/custom_network_image.dart';
import 'package:cea_zed/presentation/components/custom_scaffold.dart';
import 'package:cea_zed/presentation/components/keyboard_dismisser.dart';
import 'package:cea_zed/presentation/components/loading.dart';
import 'package:cea_zed/presentation/pages/blog/widgets/blog_title.dart';
import 'package:cea_zed/presentation/style/style.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => SafeArea(
        bottom: false,
        child: KeyboardDismisser(
          isLtr: LocalStorage.getLangLtr(),
          child: Column(
            children: [
              Text(
                AppHelper.getTrn(TrKeys.blog),
                style:
                    CustomStyle.interNoSemi(color: colors.textBlack, size: 18),
              ),
              Expanded(
                child: BlocBuilder<BlogBloc, BlogState>(
                  builder: (context, state) {
                    return state.isLoading
                        ? const Loading()
                        : ListView(
                            padding: EdgeInsets.all(16.r),
                            shrinkWrap: true,
                            children: [
                              BlogTitle(blog: state.blog, colors: colors),
                              24.verticalSpace,
                              CustomNetworkImage(
                                  url: state.blog?.img ?? "",
                                  height: 180,
                                  width: double.infinity,
                                  radius: 24),
                              16.verticalSpace,
                              state.isLoading
                                  ? const Loading()
                                  : Html(
                                      data: state
                                              .blog?.translation?.description ??
                                          "",
                                      style: {
                                        "body": Style(
                                          color: colors.textBlack,
                                        ),
                                      },
                                    ),
                              100.verticalSpace,
                            ],
                          );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingButton: (colors) => PopButton(colors: colors),
    );
  }
}
