import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  female,
  male,
}

Gender? selectedGender;

const kActiveColor = Color(0xffd50100);
const kInactiveColor = Color(0xff0c0c0c);

Color femaleCont = kActiveColor;
Color maleCont = kInactiveColor;

const kLabelText = TextStyle(fontSize: 18.0);
const kNumberText = TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold);

int height = 160;
int weight = 60;
int age = 25;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);





  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculate Your BMI'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableContaner(
                      otp: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      customChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 60,
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            'Male',
                            style: kLabelText,
                          ),
                        ],
                      ),
                      contColor: selectedGender == Gender.male
                          ? kActiveColor
                          : kInactiveColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableContaner(
                      otp: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      customChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            FontAwesomeIcons.venus,
                            size: 75,
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            'FEMALE',
                            style: kLabelText,
                          ),
                        ],
                      ),
                      contColor: selectedGender == Gender.female
                          ? kActiveColor
                          : kInactiveColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableContaner(
                      contColor: kActiveColor,
                      otp: () {},
                      customChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'SELECT HEIGHT',
                            style: kLabelText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString(),
                                style: kNumberText,
                              ),
                              const Text(
                                'CM',
                                style: kLabelText,
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 16.0),
                              thumbColor: kInactiveColor,
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 32.0),
                              activeTrackColor: Colors.white,
                              inactiveTickMarkColor: Colors.green,
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double changeHeight) {
                                setState(() {
                                  height = changeHeight.round();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableContaner(
                      otp: () {},
                      contColor: kActiveColor,
                      customChild: Column(
                        children: <Widget>[
                          const Text(
                            'WEIGHT',
                            style: kLabelText,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buttonPlusMinus(
                                buttonIcon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              buttonPlusMinus(
                                  buttonIcon: FontAwesomeIcons.plus,
                                  onPress: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableContaner(
                      otp: () {},
                      contColor: kActiveColor,
                      customChild: Column(
                        children: <Widget>[
                          const Text(
                            'Age',
                            style: kLabelText,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buttonPlusMinus(
                                buttonIcon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              buttonPlusMinus(
                                  buttonIcon: FontAwesomeIcons.plus,
                                  onPress: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ), //otp: null,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: const Center(
                child: Text(
                  'CALCULATE RESULT',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              height: 75.0,
              width: double.infinity,
              color: const Color(0xffd50100),
              margin: const EdgeInsets.only(top: 18.0),
            )
          ],
        ),
      ),
    );
  }
}

class buttonPlusMinus extends StatelessWidget {
  const buttonPlusMinus({required this.buttonIcon, required this.onPress});
  final IconData buttonIcon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(buttonIcon),
      fillColor: kInactiveColor,
      onPressed: onPress(),
      constraints: const BoxConstraints.tightFor(
        width: 34.0,
        height: 34.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
    );
  }
}

class ReusableContaner extends StatelessWidget {
  const ReusableContaner(
      {required this.contColor, required this.customChild, required this.otp});
  final Color contColor;
  final Widget customChild;
  final Function otp;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: otp(),
      child: Container(
        child: customChild,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: contColor, borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }
}
