import 'package:endless_software/home_page.dart';
import 'package:endless_software/onboard/onboard_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

bool onLastPage = false;
class _OnBoardState extends State<OnBoard> {
  int currentIndex =0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  _storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
              onPressed: () async {
                await _storeOnBoardInfo();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
              },
              child: const Text('Tanıtımı Atla',style: TextStyle(fontSize: 18,fontFamily: 'Poppins', color: Colors.black),))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PageView.builder(
          controller: _pageController,
            itemCount: screens.length,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (int index){
            setState(() {
              currentIndex = index;
              onLastPage = (index == 2);
            });
            },
            itemBuilder: (context,index){
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(screens[index].img),
              Text(screens[index].text,style: const TextStyle(fontSize: 20,fontFamily: 'Poppins', color: Colors.black, fontWeight: FontWeight.bold),),
              Text(screens[index].desc,style: const TextStyle(fontSize: 18,fontFamily: 'Poppins', color: Color(0xff828282),),),
              Container(
                height: 10,
                child: ListView.builder(
                    itemCount: screens.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_,index){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin:const EdgeInsets.symmetric(horizontal: 3),
                            width: currentIndex == index ? 20 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                                color: const Color(0xff7D87F5),
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              InkWell(
                onTap: () async {
                  await _storeOnBoardInfo();
                  if(index== screens.length - 1){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomePage()));
                  }
                  _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                },
                child: Container(
                  height: 40,
                  padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(1000)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      onLastPage ? Text('Uygulamaya Geç',style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold)) :
                      Text('Sonraki',style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
