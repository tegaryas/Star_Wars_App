import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starwars_app/screens/detail_screen.dart';
import 'package:starwars_app/theme.dart/text_style.dart';
import 'package:starwars_app/viewmodels/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Halo,',
                                style: headingTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Selamat Datang',
                                style: headingTextStyle,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Silahkan memilih tokoh Star Wars favorite mu 😊',
                                style: subtitleTextStyle,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Daftar Tokoh',
                                    style: titleTextStyle,
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      controller.setChangeView();
                                    },
                                    child: Icon(
                                      // ignore: unrelated_type_equality_checks
                                      controller.changeView == true
                                          ? Icons.sort_rounded
                                          : Icons.grid_view,
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // ignore: unrelated_type_equality_checks
                              controller.changeView == true
                                  ? _gridViewList()
                                  : _buildCard(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildCard() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => ListView.builder(
        shrinkWrap: true,
        itemCount: controller.peopleListModel.length,
        itemBuilder: (context, index) {
          var people = controller.peopleListModel[index];
          return Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          people.name,
                          style: titleTextStyle,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          people.gender,
                          style: subtitleTextStyle.copyWith(
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 25,
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                  height: 30,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _gridViewList() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.peopleListModel.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.65,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            var people = controller.peopleListModel[index];
            return GestureDetector(
              onTap: () {
                Get.to(DetailScreen(
                  people: people,
                ));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    image: AssetImage('assets/images/poster.jpg'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(3, 3),
                      blurRadius: 5,
                      color: Colors.grey,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white.withOpacity(0.8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  people.gender,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: headingTextStyle,
                                ),
                                Text(
                                  people.name,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: RawMaterialButton(
                                onPressed: () {},
                                elevation: 0,
                                constraints: BoxConstraints(
                                  minWidth: 0,
                                ),
                                shape: CircleBorder(),
                                fillColor: Colors.red,
                                padding: EdgeInsets.all(5),
                                child: Icon(Icons.bookmark,
                                    size: 16, color: Colors.white)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
