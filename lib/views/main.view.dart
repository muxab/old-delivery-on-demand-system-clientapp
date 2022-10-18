import 'package:client/controllers/main.controller.dart';
import 'package:client/statics/fonts.dart';
import 'package:client/widgets/general/loading.w.dart';
import 'package:client/widgets/home.widget.dart';
import 'package:client/widgets/main/offers.btn.w.dart';
import 'package:client/widgets/main/ship.btn.w.dart';
import 'package:client/widgets/main/shipmentList.w.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.indigoAccent),
            onPressed: () {
              // Add Dialoug ..
              // btn to call directly
              // form to sed message
              Get.defaultDialog(title: 'C.S Hlep Center');
            },
          ),
          onPressed: () {},
        ),
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          title: const Text('Yellow'),
          leading: IconButton(
            icon: const Icon(
              Icons.person,
              color: Colors.indigo,
            ),
            onPressed: () {
              Get.toNamed('/profile');
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.indigo,
              ),
              onPressed: () {
                Get.toNamed('/notifications');
                // controller.getShipment();
              },
            ),
          ],
        ),
        body: Obx(
          () => SafeArea(
            child: controller.sysError()
                ? const Center(
                    child: Text(
                      'حدث خطأ ما ',
                    ),
                  )
                : controller.loading()
                    ? const Center(child: LoadingWidget())
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            controller.loading()
                                ? const LoadingWidget()
                                : UserCard(
                                    name: controller.client!.name!.toString(),
                                    company: controller.client!.companyName!
                                        .toString(),
                                    isRep: controller.client!.isCompany!,
                                    // isRep: false,
                                  ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              child: SizedBox(
                                height: 120,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    OffersButton(
                                      controller: controller,
                                    ),
                                    ShipmentButton(
                                      controller: controller,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              // padding: const EdgeInsets.symmetric(
                              //     horizontal: 20, vertical: 5),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.indigo,
                              ),
                              child: SizedBox(
                                height: 60,
                                child: RawMaterialButton(
                                  elevation: 7,
                                  child: Center(
                                    child:
                                        lightMediumText('إضـافة شحنـــة جديدة'),
                                  ),
                                  onPressed: () {
                                    Get.toNamed("/newshipment");
                                    // controller.getShipment();
                                  },
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Divider(),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: SizedBox(
                                    height: 500,
                                    child: controller.loading.value
                                        ? const SizedBox(
                                            height: 50,
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 12,
                                                    ),
                                                    child: darkMediumText(
                                                      'شحنــات في الطريق',
                                                    ),
                                                  ),
                                                ),
                                                controller.isEmpty()
                                                    ? Container(
                                                        height: 100,
                                                        color: Colors.grey,
                                                        child: Center(
                                                          child: darkMediumText(
                                                            'ليس لديك شحنات في الطريق',
                                                          ),
                                                        ),
                                                      )
                                                    : Expanded(
                                                        child:
                                                            MainShipmentsList(
                                                          type: 'current',
                                                          controller:
                                                              controller,
                                                        ),
                                                      ),
                                                const Divider(),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: darkMediumText(
                                                      'شحنــات جديدة',
                                                    ),
                                                  ),
                                                ),
                                                controller.isNewEmpty()
                                                    ? const Center(
                                                        child: Text(
                                                          'لا شحنــات جديدة',
                                                        ),
                                                      )
                                                    : Expanded(
                                                        child:
                                                            MainShipmentsList(
                                                          type: 'new',
                                                          controller:
                                                              controller,
                                                        ),
                                                      ),
                                              ],
                                            ),
                                          ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 100,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
