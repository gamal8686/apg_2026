import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/app_back.dart';

class ProductLocationView extends StatefulWidget {
  const ProductLocationView({super.key});

  @override
  State<ProductLocationView> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductLocationView> {
  List<String> list = List.generate(10, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBack(pass: 'arrow-left.svg', radius: 20.r, onTap: () {}),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'تفاصيل المنتج',
          style: TextStyle(
            fontSize: 20.sp,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(15.r),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: AppImage(fit: BoxFit.cover, path: 'product.png'),
              ),
              SizedBox(height: 20.h),
              Text(
                textAlign: TextAlign.right,
                'زجاجه ماء 1 لتر',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  fontFamily: 'Cairo',
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: 90.w,
                height: 40.h,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: Theme.of(context).primaryColor.withValues(alpha: .50),
                ),
                child: Center(
                  child: FittedBox(
                    child: Text(
                      'زجاج شفاف',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 150.h,
                      width: 180.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).primaryColor.withValues(alpha: 0.40),
                        ),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 30.h),
                          AppImage(path: 'bottle.png', height: 40.h),
                          SizedBox(height: 10.h),

                          Text(
                            '450',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                              fontFamily: 'Cairo',
                            ),
                          ),
                          Text(
                            'عبوه',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Container(
                      height: 150.h,
                      width: 180.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).primaryColor.withValues(alpha: 0.40),
                        ),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 30.h),
                          AppImage(path: 'colum.png', height: 40.h),
                          SizedBox(height: 10.h),
                          Text(
                            '450',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                              fontFamily: 'Cairo',
                            ),
                          ),
                          Text(
                            'عبوه',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Dismissible(
                      key: Key(list[index]),
                      direction: DismissDirection.startToEnd,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 20.w),
                        color: Theme.of(context).primaryColor,
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      confirmDismiss: (direction) async {
                        return await showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(20),
                                height: 270.h,

                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Divider(
                                      color: Color(0xff444444),
                                      thickness: 3,
                                      height: 10,
                                      indent: 100,
                                      endIndent: 100,
                                    ),
                                    Text(
                                      "حذف صنف ",
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 26.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    Text(
                                      "هل انت متاكد من حذف هذا الصنف ؟",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff263238),
                                      ),
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, false),
                                            child: Row(
                                              children: [
                                                SizedBox(width: 10.w),
                                                Text(
                                                  "إلغاء",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontFamily: 'Cairo',
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.close,
                                                  color: Colors.red,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Theme.of(context)
                                                  .primaryColor
                                                  .withValues(alpha: 0.1),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context, true),
                                            child: Row(
                                              children: [
                                                SizedBox(width: 10.w),
                                                Text(
                                                  "حذف",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontFamily: 'Cairo',
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Icon(Icons.check),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },

                      onDismissed: (direction) {
                        setState(() {
                          list.removeAt(index);
                        });
                      },
                      child: Container(
                        height: 100.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            width: 2.w,
                            color: Theme.of(context).primaryColor.withValues(),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 10.w),
                              AppBack(pass: 'Location.png', radius: 30.r),
                              SizedBox(width: 10.w),
                              Column(
                                mainAxisSize: MainAxisSize.max,

                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FittedBox(
                                    child: Text(
                                      'مخزن A',
                                      style: TextStyle(
                                        color: Color(0xff263238),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18.sp,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                  ),
                                  FittedBox(
                                    child: Text(
                                      '130 عبوه',
                                      style: TextStyle(
                                        color: Color(0xff263238),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
