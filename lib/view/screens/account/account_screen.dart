import 'package:deliverypartner/config/const_string.dart';
import 'package:deliverypartner/config/const_wid.dart';
import 'package:deliverypartner/controller/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'shadow_wid.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with SingleTickerProviderStateMixin {
  var controller = Get.put(AccountController());
  // final _duration = const Duration(milliseconds: 01);
  // var height = 100.0.obs;
  // OverlayEntry? _overlayEntry;
  // final _dropdownKey = GlobalKey();

  // void _toggleDropdown() {
  //   if (controller.isDropdownOpen.value) {
  //     _overlayEntry!.remove();
  //     _overlayEntry = null;
  //   } else {
  //     _overlayEntry = _createOverlayEntry();
  //     Overlay.of(context).insert(_overlayEntry!);
  //   }
  //   controller.isDropdownOpen.value = !controller.isDropdownOpen.value;
  // }

  // OverlayEntry _createOverlayEntry() {
  //   RenderBox renderBox =
  //       _dropdownKey.currentContext!.findRenderObject() as RenderBox;
  //   var size = renderBox.size;
  //   var offset = renderBox.localToGlobal(Offset.zero);

  //   return OverlayEntry(
  //     builder: (context) => Positioned(
  //       left: offset.dx,
  //       top: offset.dy + size.height,
  //       width: size.width,
  //       child: Material(
  //         elevation: 0,
  //         color: ColorTheme.bg1.withOpacity(.27),
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 20),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: controller.listItem
  //                 .map((value) => InkWell(
  //                       onTap: () {
  //                         controller.selectedItem.value = value;
  //                         controller.isDropdownOpen.value =
  //                             !controller.isDropdownOpen.value;
  //                         setState(() {
  //                           _overlayEntry!.remove();
  //                           _overlayEntry = null;
  //                         });
  //                       },
  //                       child: Container(
  //                         padding: const EdgeInsets.all(8),
  //                         margin: const EdgeInsets.symmetric(
  //                           horizontal: 20,
  //                           vertical: 5,
  //                         ),
  //                         width: size.width,
  //                         decoration: BoxDecoration(
  //                           color: ColorTheme.bg1.withOpacity(.48),
  //                           borderRadius: BorderRadius.circular(10),
  //                         ),
  //                         child: Text(
  //                           value,
  //                           style: styleC(
  //                             ColorTheme.black,
  //                             20,
  //                             FontWeight.w600,
  //                           ),
  //                           textAlign: TextAlign.center,
  //                         ),
  //                       ),
  //                     ))
  //                 .toList(),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.white,
        surfaceTintColor: ColorTheme.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_rounded,
              size: 22,
              color: ColorTheme.black,
            ),
          ),
        ),
        leadingWidth: 30,
        title: Text(
          "Account Dashboard",
          style: styleC(
            ColorTheme.black,
            16,
            FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(width * 0.05),
              child: InnerShadow(
                blur: 5,
                color: ColorTheme.black.withOpacity(.25),
                offset: const Offset(1, 1),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorTheme.white,
                  ),
                  width: width,
                  padding: EdgeInsets.all(width * 0.04),
                  child: Obx(
                    () => SizedBox(
                      height: controller.isDropdownOpen.value ? 235 : 45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width,
                            height: 45,
                            child: Card(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                              surfaceTintColor: ColorTheme.bg1,
                              margin: EdgeInsets.zero,
                              color: ColorTheme.bg1,
                              elevation: 3,
                              child: Row(
                                children: [
                                  const Spacer(),
                                  Text(
                                    "Select",
                                    textAlign: TextAlign.center,
                                    style: styleC(
                                      ColorTheme.black,
                                      20,
                                      FontWeight.w600,
                                    ),
                                  ),
                                  const Spacer(),
                                  Obx(
                                    () => InkWell(
                                      onTap: () {
                                        controller.isDropdownOpen.value =
                                            !controller.isDropdownOpen.value;
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: Icon(
                                          controller.isDropdownOpen.value
                                              ? Icons.keyboard_arrow_up_rounded
                                              : Icons
                                                  .keyboard_arrow_down_rounded,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Obx(
                            () => controller.isDropdownOpen.value
                                ? Container(
                                    width: width,
                                    color: ColorTheme.bg1.withOpacity(.27),
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Column(
                                      children: controller.listItem
                                          .map(
                                            (e) => InkWell(
                                              onTap: () {
                                                controller.selectedItem.value =
                                                    e;
                                              },
                                              child: SizedBox(
                                                width: width,
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      10,
                                                    ),
                                                  ),
                                                  elevation: controller
                                                              .selectedItem
                                                              .value ==
                                                          e
                                                      ? 3
                                                      : 0,
                                                  surfaceTintColor: controller
                                                              .selectedItem
                                                              .value ==
                                                          e
                                                      ? ColorTheme.bg1
                                                      : ColorTheme.bg1
                                                          .withOpacity(
                                                          .48,
                                                        ),
                                                  color: controller.selectedItem
                                                              .value ==
                                                          e
                                                      ? ColorTheme.bg1
                                                      : ColorTheme.bg1
                                                          .withOpacity(
                                                          .48,
                                                        ),
                                                  margin: const EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                    top: 10,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      e,
                                                      style: styleC(
                                                        ColorTheme.black,
                                                        20,
                                                        FontWeight.w600,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ))
                                : const SizedBox.shrink(),
                          )
                        ],
                      ),
                    ),
                  ),
                  // child: Theme(
                  //   data: Theme.of(context).copyWith(
                  //     dividerColor: Colors.transparent,
                  //   ),
                  //   child: Container(
                  //     margin: const EdgeInsets.symmetric(horizontal: 10),
                  //     decoration: BoxDecoration(
                  //       color: ColorTheme.white,
                  //       boxShadow: const [
                  //         BoxShadow(
                  //           color: Color(0x33000000),
                  //           blurRadius: 4,
                  //           offset: Offset(0, 1),
                  //           spreadRadius: 1,
                  //         )
                  //       ],
                  //     ),
                  //     child: ExpansionTile(
                  //       title: Container(
                  //         color: ColorTheme.bg1,
                  //         child: Text(
                  //           "Select",
                  //           textAlign: TextAlign.center,
                  //           style: styleC(
                  //             ColorTheme.black,
                  //             20,
                  //             FontWeight.w600,
                  //           ),
                  //         ),
                  //       ),
                  //       backgroundColor: ColorTheme.bg1.withOpacity(.24),
                  //       expandedAlignment: Alignment.topLeft,
                  //       expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  //       childrenPadding: const EdgeInsets.only(
                  //         top: 10,
                  //         bottom: 10,
                  //         left: 15,
                  //         right: 5,
                  //       ),
                  //       children: controller.listItem
                  //           .map(
                  //             (e) => Container(
                  //               padding: const EdgeInsets.all(8),
                  //               margin: const EdgeInsets.symmetric(
                  //                 horizontal: 20,
                  //                 vertical: 5,
                  //               ),
                  //               decoration: BoxDecoration(
                  //                 color: ColorTheme.bg1.withOpacity(.48),
                  //                 borderRadius: BorderRadius.circular(10),
                  //               ),
                  //               child: Text(
                  //                 e,
                  //                 style: styleC(
                  //                   ColorTheme.black,
                  //                   20,
                  //                   FontWeight.w600,
                  //                 ),
                  //                 textAlign: TextAlign.center,
                  //               ),
                  //             ),
                  //           )
                  //           .toList(),
                  //     ),
                  //   ),
                  // ),
                ),
              ),
            ),
            Container(
              width: width,
              height: height * 0.43,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.only(
                top: 8,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    ColorTheme.b1,
                    ColorTheme.b2,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 5,
                    ),
                    child: Text(
                      "Today Action",
                      style: styleC(
                        ColorTheme.white,
                        14,
                        FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    height: height * 0.352,
                    margin: const EdgeInsets.only(top: 15),
                    child: Scrollbar(
                      interactive: true,
                      scrollbarOrientation: ScrollbarOrientation.bottom,
                      thickness: 10,
                      radius: const Radius.circular(5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: controller.tableLi
                                  .map(
                                    (e) => Container(
                                      width: 150,
                                      padding: const EdgeInsets.all(8),
                                      margin: const EdgeInsets.only(left: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: ColorTheme.b1.withOpacity(.4),
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorTheme.b1,
                                            blurRadius: 1,
                                            offset: const Offset(0, 1),
                                            spreadRadius: 1,
                                          )
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          e,
                                          style: styleC(
                                            ColorTheme.black,
                                            14,
                                            FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              width: double.parse(
                                  (155 * controller.tableLi.length).toString()),
                              child: Divider(
                                height: 1,
                                color: ColorTheme.black,
                              ),
                            ),
                            SizedBox(
                              width: double.parse(
                                  (155 * controller.tableLi.length).toString()),
                              height: height * 0.285,
                              child: ListView.separated(
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(top: 10),
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var item1 = controller.tempTableDet[index];
                                  return Row(
                                    children: item1
                                        .map(
                                          (e) => SizedBox(
                                            width: 155,
                                            child: Text(
                                              e,
                                              textAlign: TextAlign.center,
                                              style: styleC(
                                                ColorTheme.black,
                                                14,
                                                FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                    ),
                                    height: 1,
                                    child: Divider(
                                      height: 1,
                                      color: ColorTheme.black.withOpacity(.16),
                                    ),
                                  );
                                },
                                itemCount: controller.tempTableDet.length,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
            // Stack(
            //   alignment: Alignment.topCenter,
            //   children: [
            //     InnerShadow(
            //       blur: 5,
            //       color: ColorTheme.black.withOpacity(.25),
            //       offset: const Offset(1, 1),
            //       child: Obx(
            //         () => Container(
            //           decoration: BoxDecoration(
            //             color: ColorTheme.white,
            //           ),
            //           width: width,
            //           padding: EdgeInsets.all(width * 0.04),
            //           height: controller.isDropdownOpen.value ? 320 : 85,
            //         ),
            //       ),
            //     ),
            //     Positioned(
            //       left: 10,
            //       right: 10,
            //       top: 15,
            //       child: GestureDetector(
            //         key: _dropdownKey,
            //         onTap: _toggleDropdown,
            //         child: Container(
            //           padding: const EdgeInsets.symmetric(
            //             horizontal: 10,
            //             vertical: 10,
            //           ),
            //           color: ColorTheme.bg1,
            //           alignment: Alignment.center,
            //           height: 55,
            //           child: Row(
            //             mainAxisSize: MainAxisSize.min,
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               const Spacer(),
            //               Obx(
            //                 () => Text(
            //                   controller.selectedItem.value,
            //                   textAlign: TextAlign.center,
            //                   style: styleC(
            //                     ColorTheme.black,
            //                     20,
            //                     FontWeight.w600,
            //                   ),
            //                 ),
            //               ),
            //               const Spacer(),
            //               Obx(
            //                 () => AnimatedRotation(
            //                   duration: const Duration(milliseconds: 200),
            //                   turns:
            //                       controller.isDropdownOpen.value ? 0.5 : 0.0,
            //                   child: const Icon(
            //                     Icons.keyboard_arrow_down_rounded,
            //                     size: 35,
            //                   ),
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
