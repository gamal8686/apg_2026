import 'package:company_apg_2026/auth/login.dart';
import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:company_apg_2026/core/logic/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int currentSelect = 0;
  final List<Model> list = [
    Model(
      image: 'on_boarding1.jpg',
      description: 'إدارة المخزون بسهولة',
      title: 'تابع كميات زجاجات الأدوية في كل مكان داخل',
      newTitle: ' المخزن بشكل دقيق ومنظم.',
    ),
    Model(
      image: 'on_boarding2.jpg',
      description: 'تحكم كامل في الإنتاج',
      title: 'اعرف تفاصيل سيارات التحميل وخطوط التوزيع',
      newTitle: 'ومواعيد التسليم أول بأول.',
    ),
    Model(
      image: 'on_boarding3.jpg',
      description: 'نظام ذكي لإدارة شركتك',
      title: 'كل ما تحتاجه لإدارة المخزون والإنتاج والشحن',
      newTitle: ' في مكان واحد.',
    ),
    Model(
      image: 'on_boarding4.jpg',
      description: 'ابدأ إدارة شغلك بكفاءة',
      title: 'تحكم كامل في المخزون والإنتاج والشحن من',
      newTitle: ' مكان واحد وبخطوات بسيطة.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(15.w),
        children: [
          SizedBox(height: 50),
          AppImage(
            path: list[currentSelect].image,
            height: 350.h,
            width: 150.w,
          ),
          Text(
            list[currentSelect].description,
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff5A3A22),
              fontFamily: 'Cairo',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: list[currentSelect].title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5A3A22),
                    fontFamily: 'Cairo',
                  ),
                ),
                TextSpan(
                  text: list[currentSelect].newTitle,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5A3A22),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),
          Row(
            children: [
              ...List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    backgroundColor: currentSelect == index
                        ? Theme.of(context).primaryColor
                        : Color(0xffD9D9D9),
                    maxRadius: 8.r,
                  ),
                );
              }),
              Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (currentSelect < 4 - 1) {
                      currentSelect++;
                    } else {
                      goTo(LoginView());
                    }
                  });
                },
                child: Container(
                  height: 55.h,
                  width: 55.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: AppImage(
                      path: 'arrow_left.svg',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Model {
  final String title;
  final String newTitle;
  final String description;
  final String image;

  Model({
    required this.title,
    required this.description,
    required this.image,
    required this.newTitle,
  });
}
