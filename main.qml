import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id:ventana
    visible: true
    width: 540
    height: 960
    title: qsTr("birdou")

    Image{
        id: fondo
        anchors.fill: parent
        source: "images/fondo1_6.png"
        property variant statesNames: ["fondo6", "fondo2", "fondo3", "fondo4", "fondo5", "fondo6"]

        states: [
          State {
            name: "fondo1"
            PropertyChanges {target:fondo; source: "images/fondo1_1.png";}
          },
            State {
              name: "fondo2"
              PropertyChanges {target:fondo; source: "images/fondo1_2.png"}
            },
            State {
              name: "fondo3"
              PropertyChanges {target:fondo; source: "images/fondo1_3.png"}
            },
            State {
              name: "fondo4"
              PropertyChanges {target:fondo; source: "images/fondo1_4.png"}
            },
            State {
              name: "fondo5"
              PropertyChanges {target:fondo; source: "images/fondo1_5.png"}
            },
            State {
              name: "fondo6"
              PropertyChanges {target:fondo; source: "images/fondo1_6.png"}
            }


        ]

        Timer {
          id:timerFondo
          interval: 100000;
          running: true;
          repeat: true
          property int count:0

          onTriggered: {
            if (count < 6) {
              fondo.state = fondo.statesNames[count]
              count = count + 1
            } else
              count = 0;
          }
        }

    }


    Image{
        x:10
        y:100
      id:personaje
      width:80
      height: 60
      smooth: true
      source:  "images/bird1.png"
      property variant statesNames: ["bird1", "bird2","bird3", "bird2"]


      states: [
        State {
          name: "bir1"
          PropertyChanges {target:personaje; source: "images/bird1.png"; scale: 0.98; opacity: 1.0}
        },
          State {
            name: "bird2"
            PropertyChanges {target:personaje; source: "images/bird2.png";scale: 0.99; opacity: 0.99}
          },
          State {
            name: "bird3"
            PropertyChanges {target:personaje; source: "images/bird3.png";scale: 1.0; opacity: 1.0}
          }
      ]

      Timer {
        id:timerPersonaje
        interval: 50;
        running: true;
        repeat: true
        property int counter:0

        onTriggered: {
          if (counter < 4) {
            personaje.state = personaje.statesNames[counter]
            counter = counter + 1
          } else
            counter = 0;
        }
      }
    }



    //escenarioInvisible
    Image {
        id: escenarioInvisible
        source: "images/escenarioInvisible.png"
        width:parent.width *4.0
        height: parent.height/2
        smooth: true
        z:9
        visible: true
        x:-20
        y:parent.height/2
    }

    //escenario//
    Image {
        id: escenario2
        source: "images/escenario.png"
        width:parent.width * 3.2
        height: parent.height/2
        smooth: true
        z:10
        visible: true
        x:parent.width*4.2
        y:parent.height/2

        NumberAnimation on x {id: animateescenarioxx; from:(ventana.width*4.0)-100; to: -(ventana.width*4.0);  duration: 3000;  loops: Animation.Infinite}


/*

        ParallelAnimation{
            id: animateEscenario2
            running: true

            loops: Animation.Infinite
            PropertyAnimation {id: animateEscenarioX2; target: escenario; properties: "x";  from: 0; to: -(parent.width*4.0); duration: 2000; loops: Animation.Infinite; }
            PropertyAnimation {id: animateEscenarioVisible2; target: escenario; properties: "visible";  from: true; to: false; duration: 2000; loops: Animation.Infinite }
        }*/
/*
    property variant statesNames: ["bird1", "bird2"]




    states: [
      State {
        name: "bird1"
        PropertyChanges {target: escenario;   source: "images/escenario.png";  x: 0; }
        },

        State {
          name: "bird2"
          PropertyChanges {target: escenario;   source: "images/escenario.png";  x: (parent.width*2.0)}
        }

    ]

    Timer {
      id:timerEscenario
      interval: 1;
      running: true;
      repeat: true
      property int counter:0

      onTriggered: {
        if (counter < 2) {
          escenario.state = escenario.statesNames[counter]
          counter = counter + 1
        } else
          counter = 0;
      }
    }*/
}




    //escenario//
    Image {
        id: escenario
        source: "images/escenario.png"
        width:parent.width * 4.2
        height: parent.height /2
        smooth: true
        z:10
        visible: true
        x:parent.width * 4.2
        y:parent.height/2
/*
        NumberAnimation on x {id: animateescenarioxx; to: 0; duration: 400;  loops: Animation.Infinite}

*/


        ParallelAnimation{
            id: animateEscenario
            running: true

            loops: Animation.Infinite
            PropertyAnimation {id: animateEscenarioX; target: escenario; properties: "x";  from: (ventana.width*4.0)-100; to: -(ventana.width*4.0); duration: 4000; loops: Animation.Infinite; }
            PropertyAnimation {id: animateEscenarioVisible; target: escenario; properties: "visible";  from: true; to: false; duration: 4100; loops: Animation.Infinite }
        }
    }




    //roca//
    Image {
        id: roca
         width: parent.width/5; height: parent.width/5;
         source: elegirFoto()
         x:parent.width
         y:parent.height - (parent.height/4)

         function elegirFoto(){
            var valor = parseInt(  Math.floor((Math.random() * 2) + 1));
             print (valor);
             if(valor === 1)
                 return "images/roca.png"
             else
                 return "images/roca2.png"
         }

         z:11
         NumberAnimation on x {id:rocaX; from: (ventana.width*4.0); to: -200; duration: 5000; loops: Animation.Infinite }
     }


    //posted//
    Image {
         width: parent.width/3; height: 2*parent.width/3
         source: "images/posted.png"
         x:parent.width
         y:parent.height*0.3

         z:11
         NumberAnimation on x { from: (ventana.width * 4.0); to: -200; duration: 4000; loops: Animation.Infinite }
     }


    //bote//
    Image {
        id: bote
         width: parent.width/6; height: parent.width/5;
         source: "images/bote.png"
         x:parent.width
         y:parent.height- (parent.height/4)

         z:11
         NumberAnimation on x {id:boteX; from: (ventana.width * 4.0); to: -500; duration: 8000; loops: Animation.Infinite }
     }


    //puntaje//
    Image {
        id: puntaje
         width: 100; height: 80
         source: "images/puntaje.png"
         x:parent.width -200
         y:personaje.y
         z:11
     }

    //bomba//

    Image {
        id: bomba
        source: "images/bomba.png"
        width:30
        visible: false
        height: 32
        smooth: true
        x:30
        y:personaje.y

        ParallelAnimation{
            id: animateBomba

            PropertyAnimation {id: animateBombaY; target: bomba; properties: "y";  from: personaje.y; to: (ventana.height- (ventana.height/5)) ; duration: 400; }
            PropertyAnimation {id: animateBombaVisible; target: bomba; properties: "visible";  from: true; to: false; duration: 450;  }
        }
    }


    MouseArea{
        id:clickmouse
        anchors.fill: parent
        onClicked: eventoClick();

        function  eventoClick() {
            bomba.visible = true;
           animateBomba.start();
            bomba.y = 145;

       }
    }


    Timer {
      id:timerEscenario
      interval: 1;
      running: true;
      repeat: true
      property int counter:0

      onTriggered: {

         // print("bomba x, y: "+ bomba.x+ " "+bomba.y+ "bote x, y: "+bote.x+ " "+bote.y );
          if((bomba.y >= bote.y-5) && (bomba.y <= bote.y+5))
                   if((bomba.x >= bote.x) && (bomba.x <= bote.x +50)){
                        counter +=1;
                        print("atino" + counter );
                }
                    else
                   {
                        print("no pudiste");
                        desperdicio.visible = true;
                        animateDesperdicio.start();
                   }

        }
    }
    //desperdicio
    Image {
        id: desperdicio
        source: "images/desperdicio.png"
        width:50
        height: 32
        smooth: true
        visible: false
        z:15
        x:30
        y:Window.height - (Window.height/5)

        ParallelAnimation{
            id: animateDesperdicio

            PropertyAnimation {id: animateDesperdicioX; target: desperdicio; properties: "x";  from: 30; to: -50; duration: 400; }
            PropertyAnimation {id: animateDesperdicioVisible; target: desperdicio; properties: "visible";  from: true; to: false; duration: 450;  }
        }
    }

    //puntaje Número
    Text{
        id: puntajeNumero
        text: timerEscenario.counter + ""
        x: puntaje.x + puntaje.width +5
        y: puntaje.y - 10
        z: 11
        font.bold: true
        font.pixelSize: puntaje.height
        color: "#ff9020"
    }

}
