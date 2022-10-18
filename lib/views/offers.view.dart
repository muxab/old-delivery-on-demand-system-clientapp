import 'package:client/controllers/offers.controller.dart';
import 'package:client/widgets/general/loading.w.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersView extends GetView<OffersController> {
  const OffersView({Key? key}) : super(key: key);

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
            // controller.goBack();
            Get.snackbar('title', 'message');
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
              ? const Center(
                  child: LoadingWidget(),
                )
              : Column(
                  children: [
                    Container(
                      height: 90,
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        controller: controller.search,
                        textDirection: TextDirection.rtl,
                        // onFieldSubmitted: (_) {},
                        onChanged: (v) {
                          controller.searchShipment();
                        },
                        decoration: InputDecoration(
                          hintTextDirection: TextDirection.rtl,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          hintText: 'ابحث برقم الشحنة',
                          icon: IconButton(
                            icon: const Icon(
                              Icons.search,
                              color: Colors.blue,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: controller.offersList.length,
                            itemBuilder: (ctx, i) {
                              return Card(
                                child: ListTile(
                                  onTap: () {
                                    Get.toNamed(
                                        '/offer/${controller.offersList[i].uuid.toString()}');
                                  },
                                  leading: SizedBox(
                                    height: 100,
                                    child: Text(controller.offersList[i].trackNo
                                        .toString()),
                                  ),
                                  trailing: Column(
                                    children: [
                                      const Text('عدد العروض'),
                                      Text(controller.offersList[i].newOffers
                                          .toString()),
                                    ],
                                  ),
                                  subtitle: Text(controller
                                      .offersList[0].created!
                                      .toIso8601String()),
                                ),
                              );
                            })),
                  ],
                ),
        ),
      ),
    );
  }
}
