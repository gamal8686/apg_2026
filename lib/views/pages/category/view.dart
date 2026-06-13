import 'package:company_apg_2026/core/components/app_back.dart';
import 'package:company_apg_2026/core/components/app_image.dart';
import 'package:company_apg_2026/core/logic/helper_methods.dart';
import 'package:company_apg_2026/views/auth/login/view.dart';
import 'package:company_apg_2026/views/pages/home_page/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/components/app_admin_card.dart';
import '../employer/edite/view.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    createEmployeeIfNotExists();
    getUserData();
  }

  Future<void> createEmployeeIfNotExists() async {
    final user =    Supabase.instance.client.auth.currentUser!.id;

    if (user == null) return;

    final res = await Supabase.instance.client
        .from('employees')
        .select()
        .eq('user_id', user)
        .maybeSingle();

    if (res == null) {
      await Supabase.instance.client.from('employees').insert({
        'user_id': user,
        'name': '',
        'phone': '',
        'address': '',
      });
    }
  }
  Map<String, dynamic>? userData;



  Future<void> getUserData() async {
    final user =    Supabase.instance.client.auth.currentUser!.id;

    final response = await Supabase.instance.client
        .from('employees')
        .select()
        .eq('user_id', user)
        .single();

    setState(() {
      userData = response;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(15.h),

          children: [
            Row(
              children: [
                ClipOval(
                  child: GestureDetector(
                    onTap: () {
                      goTo(EditeEmployerView(employeeId:  userData!['id']));
                    },
                    child: AppImage(
                      path:
                      userData?['image'] ?? '',
                      height: 70.h, width: 70.w,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  children: [

                    Text(
                      userData?['name'] ?? 'موظف جديد',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20.sp,
                        fontFamily: 'Cairo',
                        color: Color(0xff292D32),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(width: 15.h),

                    Text(
                      userData?['job_title'] ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15.sp,
                        fontFamily: 'Cairo',
                        color: Color(0xff292D32),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                AppBack(
                  pass: 'logout.svg',
                  onTap: () async {
                    await Supabase.instance.client.auth.signOut();


                    goTo(LoginView(), canPop: false);
                  },
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Text(
              'اهلا بكم في الشركة العربية للزجاج الدوائى',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                fontFamily: 'Cairo',
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              'اداره الانتاج والمخزون بكفاءه',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                fontFamily: 'Cairo',
                color: Color(0xff7F8B8B),
              ),
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                onTap: () {
                      goTo(HomePage(initialIndex: 1,));
    },
                    child: AppAdminCard(
                      title: 'الانتاج التام',
                      subtitle: 'عرض كل الزجاجات والعبوات\nواماكنها',
                      path: 'box_admin.png',
                      count: '1,200',
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      goTo(HomePage(initialIndex: 3,));
                    },
                    child: AppAdminCard(
                      title: 'العاملين',
                      subtitle: 'تحديث كميات اليوم\n لكل صنف',
                      path: 'under_ review.png',
                      count: 'تحديث الان',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      goTo(HomePage(initialIndex: 2,));
                    },
                    child: AppAdminCard(
                      title: 'سيارات التحميل',
                      subtitle: 'مواعيد الشحنات \nالقادمه وتفاصيلها',
                      path: 'car_car.png',
                      count: '8 شحنات اليوم',
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      goTo(HomePage(initialIndex: 4,));
                    },
                    child: AppAdminCard(
                      title: 'التعليمات',
                      subtitle: 'اطلع علي تعليماتك\n او تعليمات المدير',
                      path: 'sheet.png',
                      count: '3 تعليمات جديده',
                    ),
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
