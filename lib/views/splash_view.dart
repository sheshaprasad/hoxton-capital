import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/utils/colors.dart';
import '/utils/cus_widgets.dart';
import '/views/transactions_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  SplashView({Key? key}) : super(key: key);

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    controller.getData();
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24.sp),
                        bottomRight: Radius.circular(24.sp),
                      ),
                      color: CusColors.dashBg
                    ),
                    padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  CustomText('Holo, Michael', size: 18,),
                                  CustomText('Te tenemos excelentes noticias para ti', size: 14,),
                                ],
                              ),
                            ),
                            Image.asset(CustomImages.bell, height: 18.sp),
                            SizedBox(width: 4.w,),
                            Image.asset(CustomImages.navPp, height: 18.sp),
                          ],
                        ),
                        Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText('\$56,271.68', size: 22.sp, align: Alignment.center,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText('+\$9,736'),
                                    SizedBox(width: 8.w,),
                                    Row(
                                      children: [
                                        Icon(Icons.arrow_upward_outlined, color: Colors.green,),
                                        CustomText('2.3%', textColor: Colors.green,)
                                      ],
                                    ),
                                  ],
                                ),
                                CustomText('ACCOUNT BALANCE', align: Alignment.center,
                                  weight: FontWeight.w200,)
                              ],
                            ),
                        ),
                        Row(
                          children: [
                            dashMainItem('12', 'Following'),
                            Container(
                              color: Colors.white,
                              height: 5.h,
                              width: 0.25.w,
                            ),
                            dashMainItem('26', 'Transactions'),
                            Container(
                              color: Colors.white,
                              height: 5.h,
                              width: 0.25.w,
                            ),
                            dashMainItem('4', 'Bills'),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    child: Row(
                      children: [
                        Expanded(child: CustomTextDefault('PERFORMANCE CHART', weight: FontWeight.bold,)),
                        ActionButton('More', ()=> Get.to(TransactionsView()))
                      ],
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 1.70,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                          color: Color(0xffffffff)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 18.0, left: 12.0, top: 24, bottom: 12),
                        child: LineChart(mainData(), swapAnimationDuration: Duration(seconds: 5), swapAnimationCurve: Curves.easeIn,)
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    child: CustomTextDefault('TOP USERS FROM YOUR COMMUNITY', weight: FontWeight.bold,)
                  ),
                  Container(
                    height: 10.h,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Obx(()=> ListView.builder(
                        itemCount: controller.data.length == 0 ? 6 : controller.data.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (c, index){
                          int i = Random().nextInt(3);
                          return controller.data.length == 0 ?
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade700,
                                      borderRadius: BorderRadius.circular(2.5.h),
                                      border: Border.all(color: Colors.grey.shade700)
                                  ),
                                  height: 5.h, width: 10.w,),
                                SizedBox(height: 1.h),
                                Container(width: 15.w, color: Colors.grey.shade700, height: 1.5.h,)
                              ],
                            ),
                          ) : GestureDetector(
                            onTap: ()=>Get.to(TransactionsView()),
                            child: Container(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Column(
                                children: [
                                  Image.asset(CustomImages.usersPic[i], height: 5.h, width: 10.w,),
                                  SizedBox(height: 1.h),
                                  Obx(()=> CustomTextDefault('${controller.data[index].username}', size: 16, )),
                                ],
                              ),
                            ),
                          );
                        }))
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    child: Row(
                      children: [
                        Expanded(child: CustomTextDefault('RECENT TRANSACTIONS', weight: FontWeight.bold,)),
                        ActionButton('More', ()=> Get.to(TransactionsView()))
                      ],
                    ),
                  ),
                  CustomWidgets.getTransactionList(4),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    child: Row(
                      children: [
                        Expanded(child: CustomTextDefault('FINANCIAL GOALS', weight: FontWeight.bold,)),
                      ],
                    ),
                  ),
                  Obx(()=> CustomSlider("XX of total XX", 0, 30000, controller.val1.value, (d){
                      controller.val1(d);
                    }, CusColors.fGoal1),
                  ),
                  Obx(()=> CustomSlider("XX of total XX", 0, 30000, controller.val2.value, (d){
                      controller.val2(d);
                    }, CusColors.fGoal2),
                  ),
                  Obx(()=> CustomSlider("XX of total XX", 0, 30000, controller.val3.value, (d){
                      controller.val3(d);
                    }, CusColors.fGoal3),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }


  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xffffffff),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xfffbfbfb),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 24,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 32,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xfff0f0f0), width: 1)),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 4,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 1.4),
            FlSpot(2.1, 0.5),
            FlSpot(3.1, 2.5),
            FlSpot(3.8, 2),
            FlSpot(4.4, 1.2),
            FlSpot(5.4, 2.2),
            FlSpot(7.4, 0.2),
            FlSpot(8.4, 2.9),
            FlSpot(10.4, 2.8),
            FlSpot(11.8, 2.4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 5.sp,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: false,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('JAN', style: style);
        break;
      case 3:
        text = const Text('FEB', style: style);
        break;
      case 5:
        text = const Text('MAR', style: style);
        break;
      case 7:
        text = const Text('APR', style: style);
        break;
      case 9:
        text = const Text('MAY', style: style);
        break;
      case 11:
        text = const Text('JUN', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 2:
        text = '250';
        break;
      case 4:
        text = '500';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  dashMainItem(val, title){
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  CustomText('$val', size: 20, weight: FontWeight.bold,),
                  CustomText('$title', size: 14, weight: FontWeight.w200,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}

