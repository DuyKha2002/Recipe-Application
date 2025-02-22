import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thflutter/constants/constant_function.dart';

import '../screens/detail_screen.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return DefaultTabController(length: 4,
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          height: h*.05,
          child: TabBar(
            unselectedLabelColor: Colors.redAccent,
            labelColor: Colors.white,
            dividerColor: Colors.white,
            indicator: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),

            ),
            labelPadding: EdgeInsets.symmetric(horizontal: w*.012),

            tabs: [
              TabItem(title: 'Bữa sáng'),
              TabItem(title: 'Bữa trưa'),
              TabItem(title: 'Bữa tối'),
              TabItem(title: 'Thức ăn nhanh'),
          ],),
        ),
        SizedBox(height: h*.02,),

        SizedBox(
          height: h*.3,
          child: TabBarView(
            children: [
              HomeTabBarView(recipe: 'breakfast'),
              HomeTabBarView(recipe: 'lunch'),
              HomeTabBarView(recipe: 'diner'),
              HomeTabBarView(recipe: 'quick'),
            ],
          ),
        ),
      ],
    ));
  }
}
class TabItem extends StatelessWidget {
  final String title;

  const TabItem({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,

        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: Text(title,style:const TextStyle  (
            fontSize: 9.8,
          ),),
        ),
      ),
    );
  }
}

class HomeTabBarView extends StatelessWidget {
  final String recipe;
  const HomeTabBarView({Key? key,required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return  FutureBuilder(
      future: ConstantFunction.getResponse(recipe),
      builder: (context, snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }
       else if (!snapshot.hasData){
          return const Center(
            child: Text('no data'),
          );
        }

        return SizedBox(
          height: h*.28,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              Map<String,dynamic> snap=snapshot.data![index];
              int time=snap['totalTime'].toInt();
              int calories=snap['calories'].toInt();
              return Container(
                margin: EdgeInsets.only(
                  right: w*.02,

                ),
                width: w*.5,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=>
                                    DetailScreen(item: snap,))
                            );
                          },
                          child: Container(
                            width: w,
                            height: h*.17,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(image: NetworkImage(snap['image']),fit: BoxFit.fill)
                            ),
                          ),
                        ),
                        SizedBox(height: h*.01,),
                        Text(snap['label'],style: TextStyle(
                          fontSize: w*.035,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: h*.01,),
                        Text("calories: ${calories.toString()}  . ${time.toString()} min",style: TextStyle(
                          fontSize: w*.03, color: Colors.grey,
                        ),),
                      ],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context,index){
              return const SizedBox(width: 15,);
            },
            itemCount: snapshot.data!.length,
          ),
        );
      },
    );
  }
}

