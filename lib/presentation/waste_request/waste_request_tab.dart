import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/wasteRequestDto/controllers.dart';
import 'package:nellikka/dto/wasteRequestDto/wasteItemsmodel.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nellikka/presentation/waste_request/waste_request.dart';

bool _enableBtn = true;

class WasteRequestView extends StatefulWidget {
  const WasteRequestView({Key? key}) : super(key: key);

  @override
  State<WasteRequestView> createState() => _WasteRequestViewState();
}

class _WasteRequestViewState extends State<WasteRequestView> {
  @override
  Widget build(BuildContext context) {
    final categoryWidth = 118.w;
    final categoryHeight = 40.h;
    final _formKey = GlobalKey<FormState>();
    return GetBuilder<WasteRequestController>(
        init: WasteRequestController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
              child: Form(
                key: controller.formKey,
                onChanged: () => setState(
                    () => _enableBtn = _formKey.currentState!.validate()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    controller.loadingCategories == true
                        ? Center(
                            child: SpinKitThreeBounce(
                                color: custom_green, size: 35.sp),
                          )
                        : GridView.builder(
                            physics: const PageScrollPhysics(
                                parent: BouncingScrollPhysics()),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio:
                                  (categoryWidth / categoryHeight),
                              mainAxisSpacing: 6.h,
                              crossAxisSpacing: 4.w,
                            ),
                            shrinkWrap: true,
                            itemCount: controller.categories.data!.length,
                            itemBuilder: (context, index) {
                              Datum data = controller.categories.data![index];
                              return GestureDetector(
                                onTap: () {
                                  controller.selectedMethod[index] =
                                      !controller.selectedMethod[index];
                                  controller.update();
                                  controller.selectedMethod[index] == true
                                      ? controller.selectedCategories
                                          .add(data.id!)
                                      : controller.selectedCategories
                                          .remove(data.id);
                                },
                                child: Container(
                                   height: 40.h,
                                   width: 118.w,                                  
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: const Color(0xff5E88E5),
                                    ),
                                    color:
                                        controller.selectedMethod[index] == true
                                            ? const Color(0xff5E88E5)
                                            : const Color(0xffEBF3FA),
                                  ),
                                  child: Center(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom:3.0,top: 3),
                                        child: Text(
                                          "${data.wasteItemsName}",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.mulish(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                            color: controller.selectedMethod[
                                                        index] ==
                                                    true
                                                ? background_white
                                                : const Color(0xff5E88E5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 11.w),
                      child: Row(
                        children: [
                          Text(
                            "Approximate Weight in Kg ",
                            style: GoogleFonts.mulish(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff959FB4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CupertinoTextFormFieldRow(
                        placeholder: "Weight",
                        placeholderStyle: GoogleFonts.mulish(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          color: const Color(0xff959FB4),
                        ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                      
                      ),
                      controller: controller.weight,
                      style: GoogleFonts.mulish(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        color: const Color(0xff626262),
                      ),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val!.isEmpty || val == '0' || val == null) {
                          return 'Required';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 11.w),
                      child: Row(
                        children: [
                          Text(
                            "Quantity (Bags) ",
                            style: GoogleFonts.mulish(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff959FB4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CupertinoTextFormFieldRow(
                       placeholder: "No. of Bags ",
                        placeholderStyle: GoogleFonts.mulish(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          color: const Color(0xff959FB4),
                        ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                       
                       
                      ),
                      controller: controller.quantity,
                      style: GoogleFonts.mulish(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        color: const Color(0xff626262),
                      ),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val!.isEmpty || val == '0' || val == null) {
                          return 'Required';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 287,
                        child: CupertinoButton(
                          disabledColor:const Color.fromARGB(255, 55, 97, 59),
                          color:const Color(0xFF3FA54A),  
                         
                          onPressed: _enableBtn
                              ? () {
                                  if (controller.formKey.currentState!
                                          .validate() &&
                                      controller
                                          .selectedCategories.isNotEmpty) {
                                    controller.wasteRequest(
                                        wasteItemId: controller
                                            .selectedCategories
                                            .toList(),
                                        context: context);
                                        //controller.selectedMethod == false;  
                                                                        

                                          }else if (controller.wasteRequestModel.success ==
                                        true ) {                                                                    
                                      controller.quantity.clear();
                                      controller.weight.clear();                                                                    
                                     // controller.selectedMethod == false;
                                                                                                      
                                    }
                                  
                                  else if (controller
                                      .selectedCategories.isEmpty) {
                                    Fluttertoast.showToast(
                                      msg: "Select a waste category",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.SNACKBAR,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: custom_red,
                                      textColor: background_white,
                                      fontSize: 16.sp,
                                    );
                                  }   
                                }
                              : null,
                          child: Text(
                            "Submit",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: background_white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
