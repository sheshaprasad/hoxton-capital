import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/views/transactions_view.dart';
import 'package:ms_material_color/ms_material_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class CustomImages{
  static String placeHolder = 'images/placeholder.png';
  static String bell = 'images/bell.png';
  static String checkCircle = 'images/check_circle.png';
  static String inProgress = 'images/in_progress.png';
  static String navPp = 'images/nav_pp.png';
  static String pic_1 = 'images/pic_1.png';
  static String pic_2 = 'images/pic_2.png';
  static String pic_3 = 'images/pic_3.png';
  static String pic_4 = 'images/pic_4.png';
  static String card_1 = 'images/card_1.png';
  static String card_2 = 'images/card_2.png';

  static List<String> usersPic = [pic_1, pic_2, pic_3, pic_4];
  static List<String> cardsPic = [card_1, card_2];
}

class CustomWidgets{

  static TextStyle defaultTextStyle = TextStyle(color: Colors.white, fontSize: 16.sp);

  static getTransactionList(count){
    return GestureDetector(
      onTap: ()=> Get.to(TransactionsView()),
      child: Container(
        child: ListView.builder(
            itemCount: count,
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
      ),
    );
  }

}

class CustomText extends StatelessWidget {

  String title;
  double size;
  Alignment align;
  Color textColor;
  FontWeight weight;
  CustomText(this.title, {this.size = 16,
    this.align = Alignment.centerLeft, this.textColor = Colors.white, this.weight = FontWeight.normal
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.25.h),
      alignment: align,
        child: Text(title, style: CustomWidgets.defaultTextStyle.copyWith(
            fontSize: size.sp, color: textColor, fontWeight: weight
        ),
        )
    );
  }
}

class CustomTextDefault extends StatelessWidget {

  String title;
  double size;
  Alignment align;
  Color textColor;
  FontWeight weight;
  CustomTextDefault(this.title, {this.size = 16,
    this.align = Alignment.centerLeft, this.textColor = Colors.black, this.weight = FontWeight.normal
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.25.h),
      alignment: align,
        child: Text(title, style: CustomWidgets.defaultTextStyle.copyWith(
            fontSize: size.sp, color: textColor, fontWeight: weight
        ),
        )
    );
  }
}

class ActionButton extends StatelessWidget {

  String title;
  Function() onClick;

  ActionButton(this.title, this.onClick);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 4.w),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10.sp)
        ),
        child: Text('$title', style: CustomWidgets.defaultTextStyle,),
      ),
    );
  }
}

class CustomSlider extends StatelessWidget {

  String title;
  double minVal, maxVal, curVal;
  Function(double) onChanged;
  Color activeColor;
  CustomSlider(this.title, this.minVal, this.maxVal, this.curVal, this.onChanged, this.activeColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
      child: Column(
        children: [
          CustomTextDefault('XX of total XX'),
          SizedBox(height: 1.h,),
          Slider(min: minVal, max: maxVal, value: curVal, onChanged: onChanged, activeColor: activeColor, inactiveColor: Colors.grey.shade300,),

        ],
      ),
    );
  }
}


