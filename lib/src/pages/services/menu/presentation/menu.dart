import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/helper/custom_appbar.dart';
import 'package:rmo_food/helper/error_message.dart';
import 'package:rmo_food/helper/gap.dart';
import 'package:rmo_food/helper/loading_bar.dart';
import 'package:rmo_food/src/components/widget_helper.dart';
import 'package:rmo_food/src/pages/services/menu/bloc/menu_item/menu_item_cubit.dart';
import 'package:rmo_food/src/pages/services/menu/data/model/menu.dart';
import 'package:shimmer/shimmer.dart';

class MenuScreen extends StatefulWidget {
  final bool? showAppBar;
  const MenuScreen({super.key, this.showAppBar = true});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with AutomaticKeepAliveClientMixin {
  late final ScrollController _scrollController;
  List<MenuCategories> menuCategories = [];
  int _selectedCategory = -1;

  @override
  void initState() {
    BlocProvider.of<MenuItemCubit>(context).fetchMenuItem();
    _scrollController = ScrollController()..addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: widget.showAppBar!
          ? const CustomAppBar(
              title: Text("Menu",
                  style: TextStyle(fontSize: 18, color: primaryColor),
                  textAlign: TextAlign.center))
          : null,
      body: BlocBuilder<MenuItemCubit, MenuItemState>(
        builder: (context, state) {
          if (state is MenuItemFetching) return const ScreenLoadingIndicator();
          if (state is MenuItemFetchError) {
            return ErrorMessage(
                onPressed:
                    BlocProvider.of<MenuItemCubit>(context).fetchMenuItem,
                errorMessage: state.errorMessage);
          }
          if (state is MenuItemFetched) {
            final menuModel = state.menuModel;
            menuCategories = menuModel.results!;
            if (_selectedCategory < 0) {
              _selectedCategory = menuCategories.first.menuId ?? 0;
            }
            return Column(
              children: [
                SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: menuCategories
                            .map((item) => Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                            color: primaryColor, width: 1.5),
                                        backgroundColor:
                                            _selectedCategory == item.menuId
                                                ? primaryColor
                                                : null,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)))),
                                    onPressed: () => setState(() =>
                                        _selectedCategory = item.menuId ?? 0),
                                    child: Text(item.categoryName ?? "",
                                        style: TextStyle(fontFamily: "Lexend", fontWeight: FontWeight.w900, color: _selectedCategory == item.menuId ? Colors.white : primaryColor)))))
                            .toList())),
                FixedGaps.verticalGap10,
                Expanded(
                    child: RefreshIndicator(
                  onRefresh: () async {
                    _selectedCategory = -1;
                    BlocProvider.of<MenuItemCubit>(context).fetchMenuItem();
                  },
                  child: menuCategories
                              .firstWhere((element) =>
                                  element.menuId == _selectedCategory)
                              .items
                              ?.isEmpty ??
                          true
                      ? const Center(child: Text("No items to show."))
                      : ListView.separated(
                          separatorBuilder: (context, index) =>
                              const Divider(color: Colors.black12),
                          itemCount: menuCategories
                                  .firstWhere((element) =>
                                      element.menuId == _selectedCategory)
                                  .items
                                  ?.length ??
                              0,
                          itemBuilder: (context, index) {
                            final List<MenuItem> items = menuCategories
                                    .firstWhere((element) =>
                                        element.menuId == _selectedCategory)
                                    .items ??
                                [];

                            return Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                // color: Colors.red,
                                // height: 60, // 40 if no image
                                child: Stack(
                                    alignment: Alignment.centerRight,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                Text("${items[index].name}",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                // const Text("Description"),
                                                // FixedGaps.verticalGap10,
                                                Text(
                                                    "Rs. ${items[index].price} -/",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ])),
                                          // SizedBox(height: 70, width: 70),
                                          // Container(
                                          //     height: 70,
                                          //     width: 70,
                                          //     decoration: const BoxDecoration(
                                          //         borderRadius: BorderRadius.vertical(
                                          //             top: Radius.circular(2)),
                                          //         image: DecorationImage(
                                          //             image: AssetImage(
                                          //                 "assets/images/splash.png")))),
                                        ],
                                      ),
                                      InkWell(
                                          onTap: () {},
                                          child: AppWidgetHelper
                                              .decoratedContainer(context,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 5,
                                                      horizontal: 10),
                                                  borderRadius: 20,
                                                  child: const Text("ADD",
                                                      style: TextStyle(
                                                          color: primaryColor,
                                                          fontWeight: FontWeight
                                                              .bold)))),
                                      // Align(
                                      //     alignment: Alignment.centerRight,
                                      //     child: InkWell(
                                      //         onTap: () {},
                                      //         child: AppWidgetHelper.decoratedContainer(
                                      //             context,
                                      //             padding: const EdgeInsets.all(3),
                                      //             borderRadius: 15,
                                      //             border: const Border.fromBorderSide(
                                      //                 BorderSide(color: primaryColor)),
                                      //             child: Row(
                                      //                 mainAxisSize: MainAxisSize.min,
                                      //                 children: [
                                      //                   InkWell(
                                      //                       onTap: () {},
                                      //                       child: const Icon(Icons.remove,
                                      //                           size: 18,
                                      //                           color: primaryColor)),
                                      //                   FixedGaps.horizontalGap10,
                                      //                   const Text("1",
                                      //                       style: TextStyle(
                                      //                           color: primaryColor)),
                                      //                   FixedGaps.horizontalGap10,
                                      //                   InkWell(
                                      //                       onTap: () {},
                                      //                       child: const Icon(Icons.add,
                                      //                           size: 18,
                                      //                           color: primaryColor))
                                      //                 ]))))
                                    ]));
                          }),
                ))
                // Expanded(
                //     child: GridView.builder(
                //         padding: const EdgeInsets.symmetric(horizontal: 10),
                //         itemCount: 10,
                //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //             childAspectRatio: 1 / 1.04,
                //             crossAxisCount: 2,
                //             crossAxisSpacing: 20,
                //             mainAxisSpacing: 10),
                //         itemBuilder: (context, index) {
                //           return AppWidgetHelper.decoratedContainer(context,
                //               margin: const EdgeInsets.only(top: 5),
                //               child: Column(children: [
                //                 Flexible(
                //                     flex: 10,
                //                     child: Stack(clipBehavior: Clip.none, children: [

                //                       Container(
                //                           padding: const EdgeInsets.symmetric(
                //                               vertical: 5, horizontal: 10),
                //                           decoration: BoxDecoration(
                //                               color: Colors.orange.shade800,
                //                               boxShadow: const [
                //                                 BoxShadow(
                //                                     color: Colors.black26,
                //                                     blurRadius: 4)
                //                               ]),
                //                           child: const Center(
                //                               child: Text("30%",
                //                                   style: TextStyle(
                //                                       color: Colors.white))))
                //                     ])),
                //                 Flexible(
                //                     flex: 8,
                //                     child: Padding(
                //                         padding: const EdgeInsets.symmetric(
                //                             horizontal: 8.0),
                //                         child: Column(
                //                             crossAxisAlignment:
                //                                 CrossAxisAlignment.stretch,
                //                             children: [
                //                               const Column(
                //                                   crossAxisAlignment:
                //                                       CrossAxisAlignment.start,
                //                                   children: [
                //                                     Text("Chicken Burger",
                //                                         style: TextStyle(
                //                                             fontWeight:
                //                                                 FontWeight.bold,
                //                                             fontFamily: "Lexend")),
                //                                     Text("Rs. 220/-",
                //                                         style: TextStyle(
                //                                             color: Colors.black54,
                //                                             fontFamily: "Lexend"))
                //                                   ]),
                //                               const Spacer(),
                //                               Row(
                //                                   mainAxisAlignment:
                //                                       MainAxisAlignment.end,
                //                                   children: [
                //                                     InkWell(
                //                                         onTap: () {},
                //                                         child: const Icon(
                //                                             Icons.add_box_sharp,
                //                                             color: primaryColor,
                //                                             size: 30))
                //                                   ])
                //                             ])))
                //               ]));
                //         }))
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  _handleCategorySelection() {}

  @override
  bool get wantKeepAlive => true;
}

class MenuShimmerLoading extends StatelessWidget {
  const MenuShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Row(children: [
            for (int i = 0; i < 10; i++) ...{
              AppWidgetHelper.decoratedContainer(context,
                  margin: const EdgeInsets.only(left: 10, bottom: 10),
                  child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade200,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                          height: 40, width: 100, color: Colors.grey.shade300)))
            }
          ])),
      Expanded(
          child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  AppWidgetHelper.decoratedContainer(context,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade200,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                              height: 50, color: Colors.grey.shade100))),
              separatorBuilder: (context, index) => FixedGaps.verticalGap10,
              itemCount: 15))
    ]);
  }
}
