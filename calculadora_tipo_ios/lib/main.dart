import 'package:flutter/material.dart';

void main() => runApp(new CalculadoraIos());


class CalculadoraIos extends StatelessWidget {

  Widget build(BuildContext buildcx) {
    return new MaterialApp(
      title: '',
      home: new Calculadora(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Calculadora extends StatefulWidget {
  CalculadoraState createState() => CalculadoraState();
}

class CalculadoraState extends State<Calculadora> {

  dynamic text ='0';
  double num1 = 0;
  double num2 = 0;

  dynamic resultado = '';
  dynamic finalResultado = '';
  dynamic opr = '';
  dynamic preOpr = '';



  Widget btn(btnText, Color color) {
    return Container(
        padding: EdgeInsets.only(bottom: 20.0),
        child: new RaisedButton(
            child: Text(btnText,
              style: TextStyle(
                color: Colors.white,
                  fontSize: 20
              ),
            ),
            onPressed: (){
              calculation(btnText);
            },
            color: color,
            padding: EdgeInsets.all(20.0),
            shape: CircleBorder()

        )
    );
  } // end of button

  Widget btnZero(btnText, Color color) {
    return Container(
        padding: EdgeInsets.only(bottom: 20.0),
        child: new RaisedButton(
            child: Text(btnText,
              style: TextStyle(
                color: Colors.white,
                  fontSize: 25
              ),
            ),
            onPressed: (){
              calculation(btnText);
            },
            color: color,
            padding: EdgeInsets.only(left:65 ,top:15,right:65,bottom: 15),
            shape: StadiumBorder()

        )
    );
  } // end of button

  Widget build(BuildContext buildCx) {
    return new Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 22.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80.0,
                  ),
                  textAlign: TextAlign.right,
                  maxLines: 1,
                ),
              )
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btn('C',const Color(0xffa5a5a5)), // AARRGGBB
                btn('+/-',const Color(0xffa5a5a5)),
                btn('%',const Color(0xffa5a5a5)),
                btn('/', Colors.orange),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btn('7',const Color(0xff333333)),
                btn('8',const Color(0xff333333)),
                btn('9',const Color(0xff333333)),
                btn('x',Colors.orange),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btn('4',const Color(0xff333333)),
                btn('5',const Color(0xff333333)),
                btn('6',const Color(0xff333333)),
                btn('-',Colors.orange),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btn('1',const Color(0xff333333)),
                btn('2',const Color(0xff333333)),
                btn('3',const Color(0xff333333)),
                btn('+',Colors.orange),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                btnZero('0',const Color(0xff333333)),
                btn('.',const Color(0xff333333)),
                btn('=',Colors.orange),
              ],),
          ],
        ),
      ),
    );

  } // end of state class



  void calculation(btnText) {


    if(btnText  == 'C') {
      text ='0';
      num1 = 0;
      num2 = 0;
      resultado = '';
      finalResultado = '';
      opr = '';
      preOpr = '';

    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
        finalResultado = add();
      } else if( preOpr == '-') {
        finalResultado = sub();
      } else if( preOpr == 'x') {
        finalResultado = mul();
      } else if( preOpr == '/') {
        finalResultado = div();
      } else if( opr == '%') {
        finalResultado = por();
      }

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=' || btnText == '%') {

      if(num1 == 0) {
        num1 = double.parse(resultado);
      } else {
        num2 = double.parse(resultado);
      }

      if(opr == '+') {
        finalResultado = add();
      } else if( opr == '-') {
        finalResultado = sub();
      } else if( opr == 'x') {
        finalResultado = mul();
      } else if( opr == '/') {
        finalResultado = div();
      } else if( opr == '%') {
        finalResultado = por();
      }

      preOpr = opr;
      opr = btnText;
      resultado = '';
    }
    else if(btnText == '%') {
      resultado = num1 / 100;
      finalResultado = doesContainDecimal(resultado);
    } else if(btnText == '.') {
      if(!resultado.toString().contains('.')) {
        resultado = resultado.toString()+'.';
      }
      finalResultado = resultado;
    }

    else if(btnText == '+/-') {
      resultado.toString().startsWith('-') ? resultado = resultado.toString().substring(1): resultado = '-'+resultado.toString();
      finalResultado = resultado;

    }

    else {
      resultado = resultado + btnText;
      finalResultado = resultado;
    }


    setState(() {
      text = finalResultado;
    });

  }


  String add() {
    resultado = (num1 + num2).toString();
    num1 = double.parse(resultado);
    return doesContainDecimal(resultado);
  }

  String sub() {
    resultado = (num1 - num2).toString();
    num1 = double.parse(resultado);
    return doesContainDecimal(resultado);
  }
  String mul() {
    resultado = (num1 * num2).toString();
    num1 = double.parse(resultado);
    return doesContainDecimal(resultado);
  }
  String div() {
    resultado = (num1 / num2).toString();
    num1 = double.parse(resultado);
    return doesContainDecimal(resultado);
  }
  String por() {
    resultado = (num1 / num2).toString();
    num1 = double.parse(resultado);
    return doesContainDecimal(resultado);
  }

  String doesContainDecimal(dynamic result) {

    if(result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if(!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return resultado;
  }

}



