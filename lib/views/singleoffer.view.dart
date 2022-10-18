import 'package:client/controllers/singleoffer.controller.dart';
import 'package:client/statics/fonts.dart';
import 'package:client/widgets/general/loading.w.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleOfferView extends GetView<SingleOfferController> {
  const SingleOfferView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.indigo,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        actions: [
          IconButton(
            enableFeedback: true,
            icon: const Icon(
              Icons.info,
              color: Colors.indigo,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(
        () => SafeArea(
          child: controller.loading.isTrue
              ? const LoadingWidget()
              : SizedBox(
                  height: Get.height,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 50),
                    child: ListView(
                      children: [
                        Center(
                          child: Text(
                              ' ${controller.shipment!.trackNo}   الشحنــة'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1),
                          child: Card(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    darkMediumText(
                                        controller.shipment!.origin!.city),
                                    darkMediumText('الانطلاق'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    darkMediumText(
                                        controller.shipment!.destination!.city),
                                    darkMediumText('الوصول'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        controller.shipment!.offers!.isEmpty
                            ? const Center(
                                child: Text('لا يـوجد عروض '),
                              )
                            : const Divider(),
                        ...controller.shipment!.offers!
                            .map((e) => Card(
                                  child: SizedBox(
                                    height: 50,
                                    child: ListTile(
                                      onTap: () {
                                        controller.showOffer(e.uuid.toString());
                                        offerBtmSht();
                                      },
                                      trailing: darkSmallText('اضــغط للعرض '),
                                      leading: Text(e.amount!.toString()),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  offerBtmSht() {
    Get.bottomSheet(
      Obx(
        () => Container(
          color: Colors.white,
          child: controller.offerLoadingErr.isTrue
              ? Center(
                  child: darkBigText('حدث خطــأ'),
                )
              : controller.offerLoading.isTrue
                  ? const Center(
                      child: LoadingWidget(),
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            const Text(
                              ' تفــاصيل العرض',
                            ),
                            IconButton(
                              onPressed: () => Get.back(),
                              icon: const Icon(
                                Icons.close,
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Container(
                            height: 80,
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.redAccent,
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      lightSmallText(
                                          'يرجى الانتباه قبل قبول العرض  '),
                                      lightSmallText(
                                        'سيتواصل السـائق معك مباشرة اذا قبلت العرض  ',
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.info_sharp,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              darkSmallText('قيمة العرض'),
                              Text(controller.offer!.amount.toString()),
                              Text(controller.offer!.vehicle!.liceinseNo
                                  .toString()),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 3,
                                primary: Colors.red,
                              ),
                              onPressed: () => controller.rejectOffer(),
                              child: lightMediumText('رفض العرض'),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 3,
                                primary: Colors.indigo,
                              ),
                              onPressed: () => controller.acceptOffer(),
                              child: lightMediumText('قبول العرض'),
                            ),
                          ],
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
