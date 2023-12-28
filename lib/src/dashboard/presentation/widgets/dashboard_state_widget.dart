import 'package:assignment_goodspace/src/dashboard/data/models/inactive_products_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../data/models/dashboard_job_feed_model.dart';
import 'text_field_search.dart';

class DashboardScreenDefaultState extends StatelessWidget {
  const DashboardScreenDefaultState({
    super.key,
    required this.height,
    required this.width,
    required this.size,
    required this.searchController,
    required this.searchFocusNode,
    required this.inactiveProducts,
    required this.dashboardJobs,
  });

  final double height;
  final double width;
  final Size size;
  final TextEditingController searchController;
  final FocusNode searchFocusNode;
  final List<InactiveProductsModel> inactiveProducts;
  final List<DashboardJobFeedModel> dashboardJobs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.15,
                  width: width,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: height * 0.01,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/profileframe.png',
                            height: 48,
                            width: 48,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/diamond.png',
                                height: 25,
                                width: 25,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                'assets/images/iconbell.png',
                                height: 25,
                                width: 25,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                'assets/images/iconleftalign.png',
                                height: 25,
                                width: 25,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.35,
                  width: width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/orange_diamond.png',
                              height: 25,
                              width: 25,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Step into the future',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  color: textBlack),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.22,
                          width: width,
                          child: ListView.builder(
                              itemCount: inactiveProducts.length,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 20, bottom: 10),
                                  child: Container(
                                    height: height * 0.22,
                                    width: width * 0.5,
                                    decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: primaryBlue2,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: white,
                                                radius: 40,
                                                child: Image.asset(
                                                    'assets/images/placeholder.png'),
                                              ),
                                              Text(
                                                'Kimaya',
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w600,
                                                    color: textBlack),
                                              ),
                                              Text(
                                                inactiveProducts[index]
                                                    .displayName,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                    color: primaryBlue2),
                                              ),
                                            ],
                                          ),
                                          Positioned(
                                            right: 1,
                                            top: 1,
                                            child: Image.asset(
                                              'assets/images/check_green.png',
                                              height: 20,
                                              width: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Jobs for you',
                                    style: TextStyle(
                                        color: primaryBlue2,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Divider(
                                color: primaryBlue2,
                                thickness: 1.5,
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.9,
                  child: textFieldSearch(
                      size, context, searchController, searchFocusNode),
                ),
                SizedBox(
                  height: height * 0.3 * dashboardJobs.length,
                  width: width,
                  // color: black,
                  child: ListView.builder(
                      itemCount: dashboardJobs.length,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            height: height * 0.26,
                            width: width * 0.5,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color:
                                    const Color.fromRGBO(196, 196, 196, 0.40),
                                width: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            dashboardJobs[index].title,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                color: textBlack),
                                          ),
                                          Image.asset(
                                            'assets/images/icon_share.png',
                                            height: 25,
                                            width: 25,
                                          )
                                        ],
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Goodspace',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff6D6E71)),
                                          ),
                                          Text(
                                            '2 Days ago',
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff6D6E71)),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/icon_home.png',
                                            height: 15,
                                            width: 15,
                                          ),
                                          Text(
                                            dashboardJobs[index].location_city,
                                            style: const TextStyle(
                                                fontSize: 11,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff6D6E71)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 35,
                                        width: width * 0.25,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF2FFF1),
                                          border: Border.all(
                                            color: const Color(0xff1E9915),
                                            width: 0.5,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(3),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/icon_rupees.png',
                                              height: 15,
                                              width: 15,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              dashboardJobs[index]
                                                  .displayCompensation,
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff1E9915)),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 35,
                                        width: width * 0.25,
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              240, 249, 255, 0.4),
                                          border: Border.all(
                                            color: const Color(0xff026AA2),
                                            width: 0.5,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(3),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/icon_star.png',
                                              height: 15,
                                              width: 15,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '${dashboardJobs[index].lowerworkex}-${dashboardJobs[index].upperworkex} Years',
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff026AA2)),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 35,
                                        width: width * 0.25,
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              238, 244, 255, 0.4),
                                          border: Border.all(
                                            color: const Color.fromRGBO(
                                                97, 114, 243, 0.73),
                                            width: 0.5,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(3),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/icon_briefcase.png',
                                              height: 15,
                                              width: 15,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              dashboardJobs[index].is_remote ==
                                                      "0"
                                                  ? 'On Site'
                                                  : 'Remote',
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      97, 114, 243, 0.73)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: white,
                                        radius: 20,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            dashboardJobs[index].image_id,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            dashboardJobs[index].name,
                                            style: const TextStyle(
                                                color: Color(0xff6D6E71),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(
                                            width: width * 0.3,
                                            child: AutoSizeText(
                                              dashboardJobs[index].companyName,
                                              maxFontSize: 11,
                                              minFontSize: 9,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  color: Color(0xff6D6E71),
                                                  fontSize: 11,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(primaryBlue),
                                            fixedSize:
                                                MaterialStateProperty.all<Size>(
                                              Size(width * 0.35, height * 0.04),
                                            ),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ))),
                                        child: const Text(
                                          'Apply',
                                          style: TextStyle(
                                            color: Color(0xffFFFFFF),
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
