import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xff1d1e33);
const inActiveCardColour = Color(0xff111328);
const bottomContainerColour = Color(0xffeb1555);

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = inActiveCardColour;
  Color femaleCardColor = inActiveCardColour;

  void updateColor(int gender) {
    if(gender == 1) {
      if(maleCardColor == inActiveCardColour) {
        maleCardColor = activeCardColour;
        femaleCardColor = inActiveCardColour;
      } else {
        maleCardColor = inActiveCardColour;
        femaleCardColor = activeCardColour;
      }
    }

    if(gender == 0) {
      if(femaleCardColor == inActiveCardColour) {
        femaleCardColor = activeCardColour;
        maleCardColor = inActiveCardColour;
      } else {
        femaleCardColor = inActiveCardColour;
        maleCardColor = activeCardColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        backgroundColor: const Color(0xff0a0e21),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: ReusableCard(
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                      colour: maleCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(0);
                      });
                    },
                    child: ReusableCard(
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                      colour: femaleCardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: ReusableCard(
              cardChild: Text('a'),
              colour: activeCardColour,
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: ReusableCard(
                    cardChild: Text('a'),
                    colour: activeCardColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Text('a'),
                    colour: activeCardColour,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
