import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmo_food/config/routes_imports.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/helper/custom_appbar.dart';
import 'package:rmo_food/helper/error_message.dart';
import 'package:rmo_food/helper/loading_bar.dart';
import 'package:rmo_food/src/components/widget_helper.dart';
import 'package:rmo_food/src/pages/services/cafe/bloc/cafe_cubit/cafe_cubit.dart';
import 'package:rmo_food/src/pages/services/cafe/data/model/cafe.dart';

class CafeScreen extends StatefulWidget {
  const CafeScreen({super.key});

  @override
  State<CafeScreen> createState() => _CafeScreenState();
}

class _CafeScreenState extends State<CafeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    BlocProvider.of<CafeCubit>(context).fetchCafeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: const CustomAppBar(
            title: Text("Restaurants",
                style: TextStyle(fontSize: 18, color: primaryColor),
                textAlign: TextAlign.center)),
        body: BlocBuilder<CafeCubit, CafeState>(builder: (context, state) {
          if (state is CafeListFetching) {
            return const ScreenLoadingIndicator();
          }
          if (state is CafeListFetchError) {
            return ErrorMessage(
                errorMessage: state.errorMessage,
                onPressed: BlocProvider.of<CafeCubit>(context).fetchCafeList);
          }
          if (state is CafeListFetched) {
            final List<CafeDatum> cafeList = state.cafeModel.results ?? [];

            return Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<CafeCubit>(context).fetchCafeList();
                  },
                  child: GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: cafeList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 1.3,
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        final CafeDatum cafeDatum = cafeList[index];
                        return InkWell(
                            onTap: () =>
                                Navigator.pushNamed(context, Routes.cafeDetail),
                            child: AppWidgetHelper.decoratedContainer(context,
                                margin: const EdgeInsets.only(bottom: 10.0),
                                child: Column(children: [
                                  // image
                                  Flexible(
                                      flex: 7,
                                      child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius
                                                            .vertical(
                                                            top:
                                                                Radius.circular(
                                                                    2)),
                                                    color: Colors.black,
                                                    image: (cafeDatum.image ==
                                                            null)
                                                        ? const DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: AssetImage(
                                                                "assets/images/splash.png"))
                                                        : DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: NetworkImage(
                                                                cafeDatum
                                                                    .image!)))),
                                            Positioned(
                                                left: -8,
                                                top: 10,
                                                child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 5,
                                                        horizontal: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .orange.shade800,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                              color: Colors
                                                                  .black26,
                                                              blurRadius: 4)
                                                        ]),
                                                    child: const Center(
                                                        child: Text("30%",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)))))
                                          ])),

                                  // bottom information
                                  Flexible(
                                      flex: 4,
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 3, left: 8.0, right: 8),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "${cafeDatum.name?.toUpperCase()}",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Row(children: [
                                                  Expanded(
                                                      child: Text(
                                                          "${cafeDatum.address}")),
                                                  if (cafeDatum.isMainBranch ??
                                                      false)
                                                    const Text("Head",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                primaryColor))
                                                ]),
                                                if (cafeDatum.isHomeDelivery ??
                                                    false)
                                                  const Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                          "Home Delivery Available",
                                                          style: TextStyle(
                                                              fontSize: 10))),
                                                const Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Icon(
                                                          Icons
                                                              .timelapse_rounded,
                                                          size: 15,
                                                          color: primaryColor),
                                                      Text("8am - 9pm")
                                                    ])
                                              ])))
                                ])));
                      }),
                ));
          }
          return const SizedBox.shrink();
        }));
  }

  @override
  bool get wantKeepAlive => true;
}
