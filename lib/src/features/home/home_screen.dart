import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{


  //For the Prompts Questions
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 3),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn
  );

  //For the 'Start chat' button
  late final AnimationController _controller1 = AnimationController(
    duration: Duration(seconds: 5),
    vsync: this,
  );

  late final Animation<double> _animation1 = CurvedAnimation(
      parent: _controller1,
      curve: Curves.easeIn
  );



  bool showText = false;
  bool showContainer = false;


  @override
  void initState() {
    _controller.forward();
    Future.delayed(Duration(milliseconds: 3000),(){
      setState(() {
        showText = true;
      });
    });
    _controller1.repeat(reverse: true);
    Future.delayed(Duration(seconds: 4),(){
      setState(() {
        showContainer = true;
      });
    });


    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text('AI Product Manager')
        ),
        leading:  IconButton(
          onPressed: (){
            //Drawer Page
            print('Drawer Page');
          },
            icon: Icon(Icons.menu)
        ),
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.68,
            child: Stack(
              children: [
                Positioned(
                  top: 30,
                    right: 20,
                    left: 20,
                    child: FadeTransition(
                      opacity: _animation,
                      child: GestureDetector(
                        onTap: (){

                          //API Call

                        },
                        child: Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: size.width,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.purple,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20, left: 10),
                              child: DefaultTextStyle(
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                  ),
                                  child: showText?AnimatedTextKit(
                                    repeatForever: false,
                                      totalRepeatCount: 1,
                                      animatedTexts: [
                                        TypewriterAnimatedText(
                                          'What does Product Management mean?',
                                          speed: Duration(milliseconds: 50)
                                        )
                                      ]
                                  ): Text('')
                              ),
                            ),

                          ),
                        ),
                      ),
                    )
                ),
                Positioned(
                  top: 140,
                    left: 20,
                    right: 20,
                    child: FadeTransition(
                      opacity: _animation,
                      child: GestureDetector(
                        onTap: (){

                          //API Call

                        },
                        child: Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: size.width,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20, left: 10),
                              child: DefaultTextStyle(
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                                ),
                                child: showText? AnimatedTextKit(
                                  repeatForever: false,
                                  totalRepeatCount: 1,
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                        'Who is a Product manager?',
                                        speed: Duration(milliseconds: 50)
                                    )
                                  ],
                                ): Text('')
                              ),
                            )
                          ),
                        ),
                      ),
                    )
                ),
                Positioned(
                    top: 250,
                    left: 20,
                    right: 20,
                    child: FadeTransition(
                      opacity: _animation,
                      child: GestureDetector(
                        onTap: (){

                          //API Call

                        },
                        child: Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                              width: size.width,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20, left: 10),
                                child: DefaultTextStyle(
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                    child: showText? AnimatedTextKit(
                                      repeatForever: false,
                                      totalRepeatCount: 1,
                                      animatedTexts: [
                                        TypewriterAnimatedText(
                                            'Internship Stage 5',
                                            speed: Duration(milliseconds: 50)
                                        )
                                      ],
                                    ): Text('')
                                ),
                              )
                          ),
                        ),
                      ),
                    )
                ),
                Positioned(
                    top: 360,
                    left: 20,
                    right: 20,
                    child: FadeTransition(
                      opacity: _animation,
                      child: GestureDetector(
                        onTap: (){

                          //API Call

                        },
                        child: Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                              width: size.width,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20, left: 10),
                                child: DefaultTextStyle(
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                    child: showText? AnimatedTextKit(
                                      repeatForever: false,
                                      totalRepeatCount: 1,
                                      animatedTexts: [
                                        TypewriterAnimatedText(
                                            'Dummy Data',
                                            speed: Duration(milliseconds: 50)
                                        )
                                      ],
                                    ): Text('')
                                ),
                              )
                          ),
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),

          showContainer? GestureDetector(
            onTap: (){
              //Navigation to the next screen
              print('Navigate');
            },
            child: FadeTransition(
              opacity: _animation1,
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffDB74D7)
                  ),
                  child: const Center(
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white
                      ),
                      child: Text('Start Chat'),

                    ),
                  ),
                ),
              ),
            ),
            ): Container(),
        ],
      ),
    );
  }
}
