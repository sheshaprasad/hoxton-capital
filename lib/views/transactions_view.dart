import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/transaction_controller.dart';
import '/utils/cus_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TransactionsView extends GetView<TransactionController> {
  const TransactionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TransactionController());
    return SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: ()=> Get.back(),
                          child: Icon(Icons.arrow_back, size: 20.sp,)),
                      SizedBox(width: 2.w,),
                      Expanded(child: Text('My saved cards', style: TextStyle(fontSize: 18.sp),)),
                      SizedBox(width: 2.w,),
                      Icon(Icons.sort_outlined, size: 18.sp,),
                    ],
                  ),
                ),
                SizedBox(height: 2.h,),
                AspectRatio(
                  aspectRatio: 1.80,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    child: GetBuilder<TransactionController>(
                      builder: (sc) => ListView.builder(
                          itemCount: CustomImages.cardsPic.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (c, index){
                            return Container(
                              child: Column(
                                children: [
                                  Image.asset(CustomImages.cardsPic[index], width: 80.w, fit: BoxFit.fitHeight,),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                ),
                TabBar(
                  controller: controller.tabController,
                  isScrollable: true, // Required
                  unselectedLabelColor: Colors.grey.shade500,
                  labelColor: Colors.black,
                  labelPadding: EdgeInsets.symmetric(horizontal: 30),
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                    insets: EdgeInsets.symmetric(horizontal: 48),
                  ),
                  tabs: [
                    for(int i=0;i<6;i++)Tab(text: 'Menu Item $i',),
                  ],
                ),
                SizedBox(height: 2.h,),
                Flexible(
                  child: ListView.builder(
                      itemCount: 14,
                      shrinkWrap: true,
                      itemBuilder: (_, index){
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                          child: Row(

                            children: [
                              Image.asset(CustomImages.placeHolder, height: 5.5.h,),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomTextDefault('John Doe', size: 16,),
                                      CustomTextDefault('United Kingdom', size: 14, weight: FontWeight.w200,)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Column(
                                  children: [
                                    CustomTextDefault('80,000 AED', size: 16,),
                                    CustomTextDefault('11 Aug 2021', size: 14, weight: FontWeight.w200,)
                                  ],
                                ),
                              ),
                              Container(
                                  alignment: Alignment.topCenter,
                                  child: Image.asset(index == 0 ? CustomImages.inProgress : CustomImages.checkCircle, height: 2.h,)),
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        )
    );
  }
}
