import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nellikka/custom_colors.dart';
import 'package:nellikka/dto/complaintDto/complaint_type_model.dart';
import 'package:nellikka/dto/complaintDto/controller.dart';
import 'package:nellikka/dto/staffListDto/controller.dart';

String? selectedValue;

class CustomerAddNewComplaint extends StatelessWidget {
  CustomerAddNewComplaint({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerAddComplaintController>(
      init: CustomerAddComplaintController(),
      builder: (controller) {
        return controller.loadingPage == true
            ? const Center(
                child: SpinKitFadingCube(color: custom_green),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 8,right: 8),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                          child: Text(
                            "Complaint category",
                            style: GoogleFonts.mulish(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff959FB4),
                            ),
                          ),
                        ),
                        StatefulBuilder(builder: (context, setState) {
                          return DropdownButtonFormField<dynamic>(
                            icon: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Color(0xff7EA4AD),
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 11),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                    width: 1, color: const Color(0xffB8D0D6)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                    width: 1, color: const Color(0xffB8D0D6)),
                              ),
                              fillColor: const Color(0xffF8FBFF),
                              filled: true,
                            ),
                            isExpanded: true,
                            hint: Text(
                              "Select Category",
                              style: GoogleFonts.mulish(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: const Color(0xff626262),
                              ),
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'Required';
                              } else {
                                return null;
                              }
                            },
                            // value:,
                            onChanged: (value) {
                              setState(() {
                                //controller.complaintCategory = value;
                                // controller.catData![0] = value;
                                controller.typeId = value;
                              });
                            },
                            onSaved: (value) {
                              setState(() {
                                controller.typeId = value;
                              });
                            },
                            items: controller.catData!.map((value) {
                              // controller.typeId = value.id;
                              return DropdownMenuItem(
                                value: value.id,
                                child: Text(
                                  "${value.name}",
                                  style: GoogleFonts.mulish(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: const Color(0xff626262),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        }),
                        SizedBox(height: 20,),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                          child: Text(
                            "Staff",
                            style: GoogleFonts.mulish(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff959FB4),
                            ),
                          ),
                        ),
                        GetBuilder<StaffListController>(
                            init: StaffListController(),
                            builder: (staffController) {
                              return staffController.loadingPage
                                  ? const Center(
                                      child: Center(
                                        child: SpinKitFadingCircle(
                                            color: custom_green),
                                      ),
                                    )
                                  : staffController.staffListModel.success ==
                                          false
                                      ? const Center(
                                          child: Center(
                                            child: SpinKitFadingCircle(
                                                color: custom_green),
                                          ),
                                        )
                                      : StatefulBuilder(
                                          builder: (context, setState) {
                                          return DropdownButtonFormField<
                                              dynamic>(
                                            icon: const Icon(
                                              Icons
                                                  .keyboard_arrow_down_outlined,
                                              color: Color(0xff7EA4AD),
                                            ),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 11),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: const Color(
                                                        0xffB8D0D6)),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: const Color(
                                                        0xffB8D0D6)),
                                              ),
                                              fillColor:
                                                  const Color(0xffF8FBFF),
                                              filled: true,
                                            ),
                                            isExpanded: true,
                                            hint: Text(
                                              "Select Staff",
                                              style: GoogleFonts.mulish(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                                color: const Color(0xff626262),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null) {
                                                return 'Required';
                                              } else {
                                                return null;
                                              }
                                            },
                                            // value:,
                                            onChanged: (value) {
                                              setState(() {
                                                //staffController.staffData. = value;
                                                // controller.catData![0] = value;
                                                controller.staffId = value;
                                              });
                                            },
                                            onSaved: (value) {
                                              setState(() {
                                                //controller.complaintCategory = value;
                                                controller.staffId = value;
                                              });
                                            },
                                            items: staffController.staffData!
                                                .map((value) {
                                              // controller.staffId = value.id;
                                              return DropdownMenuItem(
                                                value: value.id,
                                                child: Text(
                                                  "${value.firstName}" +
                                                      '\t' +
                                                      "${value.lastName}",
                                                  style: GoogleFonts.mulish(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15,
                                                    color:
                                                        const Color(0xff626262),
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          );
                                        });
                            }),
                         SizedBox(height: 20,),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                          child: Text(
                            "Add Comment".tr,
                            style: GoogleFonts.mulish(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff959FB4),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CupertinoTextFormFieldRow(
                          placeholder: 'Comment',
                            placeholderStyle: GoogleFonts.mulish(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: custom_grey,
                            ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                            // contentPadding:
                            //     EdgeInsets.symmetric(horizontal: 11),
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(5.0),
                            //   borderSide: BorderSide(
                            //       width: 1, color: const Color(0xffB8D0D6)),
                            // ),
                            // enabledBorder: OutlineInputBorder(
                            
                            //   borderSide: BorderSide(
                            //       width: 1, color: const Color(0xffB8D0D6)),
                            // ),
                            // fillColor: const Color(0xffF8FBFF),
                            // filled: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Required';
                            } else {
                              return null;
                            }
                          },
                          controller: controller.comment,
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: const Color(0xff626262),
                          ),
                        ),
                        
                        SizedBox(height: 20,),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                          child: Text(
                            "Add Image".tr,
                            style: GoogleFonts.mulish(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff959FB4),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.pickImage();
                                  },
                                  child: Container(
                                    width: 84.11,
                                    height: 87.09,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF8F8F8),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: controller.images!.isNotEmpty
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.file(
                                              File(controller.images![0].path),
                                              fit: BoxFit.fill,
                                            ))
                                        : SizedBox(
                                            height: 91,
                                            width: 88,
                                            child: Icon(
                                             CupertinoIcons.photo,
                                              color: Color(0xFFC4C4C4),
                                            ),
                                          ),
                                  ),
                                ),
                                Visibility(
                                  visible: controller.images!.isNotEmpty,
                                  child: SizedBox(
                                    width: 84.11,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller.images!
                                                .remove(controller.images![0]);
                                            controller.update();
                                          },
                                          child: Icon(
                                           CupertinoIcons.delete,
                                            color: custom_red,
                                            size: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.pickImage();
                                  },
                                  child: Container(
                                    width: 84.11,
                                    height: 87.09,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF8F8F8),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: controller.images!.length >= 2
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.file(
                                              File(controller.images![1].path),
                                              fit: BoxFit.fill,
                                            ),
                                          )
                                        : SizedBox(
                                            height: 91,
                                            width: 88,
                                            child: Icon(
                                             CupertinoIcons.photo,
                                              color: Color(0xFFC4C4C4),
                                            ),
                                          ),
                                  ),
                                ),
                                Visibility(
                                  visible: controller.images!.length >= 2,
                                  child: SizedBox(
                                    width: 84.11,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller.images!
                                                .remove(controller.images![1]);
                                            controller.update();
                                          },
                                          child: Icon(
                                           CupertinoIcons.delete,
                                            color: custom_red,
                                            size: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.pickImage();
                                  },
                                  child: Container(
                                    width: 84.11,
                                    height: 87.09,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF8F8F8),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: controller.images!.length >= 3
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.file(
                                              File(controller.images![2].path),
                                              fit: BoxFit.fill,
                                            ),
                                          )
                                        : SizedBox(
                                            height: 91,
                                            width: 88,
                                            child: Icon(
                                             CupertinoIcons.photo,
                                              color: Color(0xFFC4C4C4),
                                            ),
                                          ),
                                  ),
                                ),
                                Visibility(
                                  visible: controller.images!.length >= 3,
                                  child: SizedBox(
                                    width: 84.11,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller.images!
                                                .remove(controller.images![2]);
                                            controller.update();
                                          },
                                          child: Icon(
                                           CupertinoIcons.delete,
                                            color: custom_red,
                                            size: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.pickImage();
                                  },
                                  child: Container(
                                    width: 84.11,
                                    height: 87.09,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF8F8F8),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: controller.images!.length == 4
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.file(
                                              File(controller.images![3].path),
                                              fit: BoxFit.fill,
                                            ),
                                          )
                                        : SizedBox(
                                            height: 91,
                                            width: 88,
                                            child: Icon(
                                             CupertinoIcons.photo,
                                              color: Color(0xFFC4C4C4),
                                            ),
                                          ),
                                  ),
                                ),
                                Visibility(
                                  visible: controller.images!.length == 4,
                                  child: SizedBox(
                                    width: 84.11,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller.images!
                                                .remove(controller.images![3]);
                                            controller.update();
                                          },
                                          child: Icon(
                                           CupertinoIcons.delete,
                                            color: custom_red,
                                            size: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 58.91,
                        ),
                        Center(
                          child: controller.submittingComplaint == true
                              ? const SpinKitThreeBounce(
                                  color: custom_green,
                                  size: 30,
                                )
                              : CupertinoButton(
                                  onPressed: () async {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      controller.formKey.currentState!.save();
                                      await controller.addComplaint();
                                     
                                    }
                                  },
                                  color: const Color(0xff3FA54A),
                                  // shape: RoundedRectangleBorder(
                                  //   borderRadius: BorderRadius.circular(5),
                                  // ),
                                 // height: 45,
                                  minSize: 287,
                                  child: Text(
                                    "Submit",
                                    style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: background_white,
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
