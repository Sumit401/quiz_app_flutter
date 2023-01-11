
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'providers/snapshotProvider.dart';
import 'PageView/pageViewContainer.dart';
import 'providers/timerProvider.dart';

class StartQuiz extends StatefulWidget {
  const StartQuiz({Key? key}) : super(key: key);

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  final PageController _pagecontroller = PageController();


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        //appBar: appBarSimpleWithoutBack(context, "Start Quiz"),
        body: Consumer<SnapshotProvider>(
          builder: (context, providerValue, child) {
            print("build");
            return Container(
              alignment: Alignment.topCenter,
              child: StreamBuilder(
                  stream: providerValue.firestoreSnapshots,
                  builder: (context, snapshot) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        timer(),
                        Expanded(
                          child: PageView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _pagecontroller,
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              return pageViewContainer(snapshot, index, _pagecontroller,context);
                            },
                          ),
                        ),
                      ],
                    );
                  }),
            );
          },
        ),
      ),
    );
  }

  timer() {
    return Consumer<TimerProvider>(
      builder: (context, timerProvider, child) {
        return Container(
            margin: const EdgeInsets.only(top: 50),
            child: Text(timerProvider.timer.toString(),
              style: TextStyle(fontSize: 40),
            ));
      },
    );
  }
}
