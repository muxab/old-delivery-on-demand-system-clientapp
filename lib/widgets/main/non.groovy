class ShipmentsList extends StatelessWidget {
  const ShipmentsList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ShipmentsController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 200),
        itemCount: controller.shipments.length,
        itemBuilder: (con, i) {
          return Container(
            height: 200,
            child: Card(
              elevation: 0.5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // height: 20,

                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SelectableText(
                              controller.shipments[i].trackNo.toString(),
                            ),
                            SelectableText(
                                // controller.shipments[i].created.toString(),
                                displayTimeAgoFromTimestamp(
                                    controller.shipments[i].created.toString()))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Divider(
                        thickness: 0.3,
                        color: Colors.indigo,
                      ),
                    ),
                    Container(
                      // height: 20,
                      decoration: BoxDecoration(
                        boxShadow: [
                          // BoxShadow(color: Colors.red),
                          // BoxShadow(color: Colors.redAccent),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SelectableText(
                                  'إلى',
                                ),
                                SelectableText(
                                  'من',
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 100),
                              child: Divider(
                                thickness: 0.1,
                                color: Colors.indigo,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SelectableText(
                                  controller.shipments[i].destination.city
                                      .toString(),
                                ),
                                SelectableText(
                                  controller.shipments[i].origin.city
                                      .toString(),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.snackbar('title', 'message');
                          },
                          child: Text('عرض التفاصيل'),
                        ),
                        statusText(
                          controller.shipments[i].status.toString(),
                        ),
                        paymentText(
                          controller.shipments[i].status.toString(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

Text statusText(String status) {
  switch (status) {
    case 'onway':
      return Text('قرب');
    // break;
    default:
      return Text('جديد');
    // break;
  }
}

paymentText(String status) {
  switch (status) {
    case 'yes':
      return Card(
          elevation: 4,
          child:
              Container(height: 30, child: Center(child: Text('تم السداد'))));
    case 'no':
      return Card(
          elevation: 4,
          child: Container(
              height: 30, child: Center(child: Text('لم يتم السداد'))));
    case 'check':
      return Card(
          elevation: 4,
          child: Container(height: 30, child: Text('يتم التحقق')));
    // break;
    default:
      return Card(
          elevation: 1,
          child: Container(
              height: 30, child: Center(child: Text('بانتظار التسديد'))));
    // break;
  }
}
