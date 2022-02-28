import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbasequick/presentation/dialog/confirm_dialog.dart';
import 'package:flutterbasequick/presentation/widget/toolbar_page.dart';
import '/bloc/base/locale/locale_bloc.dart';
import '/bloc/base/locale/locale_state.dart';
import '/bloc/demo/demo_bloc.dart';
import '/bloc/demo/demo_state.dart';
import '/common/mixins/after_first_frame.dart';
import '/common/mixins/loading_view.dart';
import '/common/values/font_sizes.dart';
import '/gen/assets/assets.gen.dart';
import '/gen/assets/colors.gen.dart';
import '/gen/localization/l10n.dart';
import '/presentation/dialog/info_dialog.dart';
import '/presentation/widget/base/custom_button.dart';
import '/presentation/widget/base/custom_text.dart';

class DemoPage extends StatefulWidget {
  final String title;
  const DemoPage({Key? key, required this.title}) : super(key: key);

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage>
    with AfterFirstFrameMixin, LoadingViewMixin {
  late DemoBloc _bloc;

  @override
  void afterFirstFrame(BuildContext context) {
    // Get locale
    BlocProvider.of<LocaleBloc>(context).getLocale();

    // Get int value
    _bloc.getValue();
  }

  @override
  void initState() {
    super.initState();

    // Bloc
    _bloc = DemoBloc();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => _bloc),
      ],
      child: ToolbarPage(
        title: widget.title,
        toolbarBackgroundColor: ColorName.primary,
        child: Center(
          child: Column(
            children: <Widget>[
              demoAccessResources(),
              demoBloc(),
              demoLocalization(),
              demoDialog(),
              demoNetwork(),
              FloatingActionButton(
                onPressed: () {
                  _bloc.increaseValue();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///
  /// Access text, font, dimens, images,...
  ///
  Widget demoAccessResources() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomText(
            "DEMO RESOURCES ACCESS",
            fontWeight: FontWeight.bold,
            fontSize: FontSize.BIG,
          ),

          // Access text S.current.xyz
          CustomText(S.of(context).ok),

          // Access image
          Container(
              decoration: const BoxDecoration(color: ColorName.primary),
              width: 100,
              height: 100,
              child: Assets.images.icBack.image())
        ],
      ),
    );
  }

  ///
  /// BLOC
  ///
  Widget demoBloc() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          CustomText(
            "DEMO BLOC",
            fontWeight: FontWeight.bold,
            fontSize: FontSize.BIG,
          ),
          CustomText(
            'You have pushed the FLOATING button this many times:',
          ),
          BlocBuilder<DemoBloc, DemoState>(buildWhen: (context, state) {
            if (state is DemoIntState) {
              return true;
            }
            return false;
          }, builder: (context, state) {
            if (state is DemoIntState) {
              return CustomText(
                '${state.value}',
                fontSize: FontSize.BIG_2,
              );
            }
            return Container();
          })
        ]));
  }

  ///
  /// LOCALIZATION
  ///
  Widget demoLocalization() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          CustomText(
            "DEMO LOCALIZATION",
            fontWeight: FontWeight.bold,
            fontSize: FontSize.BIG,
          ),
          CustomText(S.of(context).app_name),
          BlocBuilder<LocaleBloc, LocaleState>(
              // bloc: Auto lookup LocaleBloc
              builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomText(
                  'Current locale: ${state.locale}',
                ),
                CustomButton(
                  "CLICK TO CHANGE LOCALE",
                  onTap: () {
                    BlocProvider.of<LocaleBloc>(context).changeLocale(Locale(
                        state.locale.languageCode == "vi" ? "en" : "vi"));
                  },
                )
              ],
            );
          }),
        ]));
  }

  ///
  /// DIALOG
  ///
  Widget demoDialog() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          CustomText(
            "DEMO DIALOG",
            fontWeight: FontWeight.bold,
            fontSize: FontSize.BIG,
          ),
          CustomButton(
            "SHOW OK DIALOG",
            onTap: () {
              InfoDialog(
                      context: context,
                      title: "Hello",
                      content: "Empty content",
                      callbackPositive: () {})
                  .show();
            },
          ),
          const SizedBox(height: 8),
          CustomButton(
            "SHOW CONFIRM DIALOG",
            onTap: () {
              ConfirmDialog(
                      context: context,
                      title: "Hello",
                      content: "Empty content",
                      callbackPositive: () {})
                  .show();
            },
          )
        ]));
  }

  ///
  /// NETWORK
  ///
  Widget demoNetwork() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          CustomText(
            "DEMO NETWORK & LOADING",
            fontWeight: FontWeight.bold,
            fontSize: FontSize.BIG,
          ),
          CustomButton(
            "DUMMY REQUEST",
            onTap: () async {
              _bloc.requestNetwork();
            },
          ),
          BlocConsumer<DemoBloc, DemoState>(listener: (context, state) {
            if (state is DemoLoadingState) {
              showLoading();
            } else {
              dismissLoading();
            }
          }, builder: (context, state) {
            if (state is DemoNetworkState) {
              return CustomText("Result: ${state.data}");
            }
            return Container();
          })
        ]));
  }
}
