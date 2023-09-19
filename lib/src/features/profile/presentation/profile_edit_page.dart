import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/constants/constants.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController poly = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorApp.secondaryBlue,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          "Edit Profile",
          style: TypographyApp.queueAppbarSmall,
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
              Center(
                child: CircleAvatar(
                  radius: 50.r,
                  backgroundImage: AssetImage('assets/images/profile_default_img.png'),
                  backgroundColor: Colors.white,
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: (){},
                  child: Text(
                    "Ubah Foto",
                    style: TypographyApp.eprofileBlueBtn,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Nama",
                style: TypographyApp.eprofileLabel,
              ),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: HexColor('#E5E5E5'),
                      width: 1.w,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: HexColor('#E5E5E5'),
                      width: 1.w,
                    ),
                  ),
                ),
                style: TypographyApp.eprofileValue,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Price",
                style: TypographyApp.eprofileLabel,
              ),
              TextFormField(
                controller: price,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: HexColor('#E5E5E5'),
                      width: 1.w,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: HexColor('#E5E5E5'),
                      width: 1.w,
                    ),
                  ),
                ),
                style: TypographyApp.eprofileValue,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Polyclinic",
                style: TypographyApp.eprofileLabel,
              ),
              TextFormField(
                controller: poly,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: HexColor('#E5E5E5'),
                      width: 1.w,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: HexColor('#E5E5E5'),
                      width: 1.w,
                    ),
                  ),
                ),
                style: TypographyApp.eprofileValue,
              ),
              SizedBox(height: 150.h,)
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        width: 1.sw,
        height: 98.h,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: HexColor('#929DAB').withOpacity(0.10),
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ]),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorApp.primary,
            padding: EdgeInsets.symmetric(horizontal: 87.w, vertical: 18.h),
          ),
          onPressed: () {},
          child: Text(
            'Ubah',
            style: TypographyApp.queueOnBtn,
          ),
        ),
      ),
    );
  }
}
