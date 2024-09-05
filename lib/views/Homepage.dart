import 'dart:math';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {






var lista = ['pedra', 'papel', 'tesoura'];
// pedra = 1   papel = 2  tesoura = 3



int pontosvoce = 0;
int pontocpc = 0;
String jogadadopc = '';

String resultado = 'Clique em uma opção para jogar';


void  jogar(num){


int numero = Random().nextInt(3);

String resvoce = lista[num];
String respc = lista [numero];

setState(() {
  jogadadopc = respc;
});



// logica do texto
if (pontocpc == pontosvoce) {

  setState(() {
    resultado = 'empatado';
  });



}
else if (pontosvoce > pontocpc){

setState(() {
  resultado = 'você ganhou';
});

}
else {
setState(() {
  resultado = 'você perdeu';
});

}

// logica do jogo 
if (resvoce == respc) {
  print('empatou');

  setState(() {
    pontocpc ++;
    pontosvoce ++;

  });
}
 
            
       else if  ((resvoce == "pedra" && respc == "tesoura") ||
        (resvoce == "papel" && respc == "pedra") || 
        (resvoce == "tesoura" && respc == "papel"))
        
        {
        print("Você ganhou!");

        setState(() {
           pontosvoce ++;
          
        });

       }
            
        else {print("Você perdeu!");
setState(() {
  pontocpc ++;
});

        }
            

}






// tentar fazer com que a lista seja usada tanto pelo usuario quanto pelo programa
//basicamente tenho que fazer com que o numero aleatorio escolha um item da lista, e o usuario também.
// entao tenho que fazer as condiçoes.




  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          


           Text('sua jogada'),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: [
        
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(
                onTap: () {
                  jogar(0);
                },
                
                child: CircleAvatar(
                  child: Text('pedra'),
                )),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(
                onTap: () {
                  jogar(1);

                },
                child: CircleAvatar(
                  child: Text('papel'),
                )),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    jogar(2);
                  });
                  



                },
                child: CircleAvatar(
                  child: Text('tesoura'),
                )),
            ),
          ],
        
        
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(child: Text('jogada do computador'))
          ],
        ),

        CircleAvatar(child: Text(jogadadopc),),

        Text('Resultado:'),

        Text(resultado),

        Text('placar'),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(   
                   
          width: 300,
          height: 100,
           // Cor definida para o container
          decoration: BoxDecoration(
          color: Colors.grey,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                          Text('voce'),
                          
                          Text(pontosvoce.toString()),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        Text('pc'),
                        Text(pontocpc.toString()),
                  
                    ],
                  ),
                )

            ],


          )
          
          )
            ],
          )





        ],
      ),
    );
  }
}
