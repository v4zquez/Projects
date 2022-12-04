#include <DHT.h>

const int pinDHT = 6;
DHT dht(pinDHT, DHT11);
const int pinLED = 3;
const int pinMotor = 5;

String inputString = "";         
boolean stringComplete = false;  
float valorHumedad;
float valorTemperatura;
long valorLuminosidad;
long porcentaje;
int i;

String luminosidad = "Luminosidad:";
String temperatura = "Temperatura:";
String humedad = "Humedad:";

void setup()
{
   Serial.begin(9600);
   dht.begin();
   pinMode(pinLED, OUTPUT);
   digitalWrite(pinLED,LOW);

   pinMode(pinMotor, OUTPUT);
   //9uyanalogWrite(pinMotor,LOW);
   //digitalWrite(pinMotor, 0); //iniciar con el motor detenido
}

void loop() 
{
   valorHumedad = dht.readHumidity();
   valorTemperatura = dht.readTemperature();
   
   valorLuminosidad = analogRead(A0);

   humedad.concat(valorHumedad);
   Serial.println(humedad);
   humedad = "Humedad:";

   temperatura.concat(valorTemperatura);
   Serial.println(temperatura);
   temperatura = "Temperatura:";
   
   // mapear la variable -valorLuminosidad- entre 0-100
   porcentaje = map(valorLuminosidad, 0, 600, 0, 100);

   if(porcentaje >= 100)
   {
     porcentaje = 100;
   }
                   
   // enviar intensidad luminosa
   luminosidad.concat(porcentaje);
   Serial.println(luminosidad);
   luminosidad = "Luminosidad:";
   
   if(stringComplete)
   {
      if (inputString == "BMON\n")
      {
        inputString = "";
        digitalWrite(pinLED, HIGH);
      }

      if (inputString == "BMOFF\n")
      {
        inputString = "";
        digitalWrite(pinLED, LOW);
      }

      if (inputString == "VNON\n")
      {
        inputString = "";
        for(i=0; i<=255; i++)
        {
          analogWrite(pinMotor, 50);
        }
      }

      if (inputString == "VNOFF\n")
      {
        inputString = "";
        digitalWrite(pinMotor, 0);
      }
   }
   
   delay(250);
}

void serialEvent() 
{
  while (Serial.available())
  {
    // get the new byte:
    char inChar = (char)Serial.read();
    // add it to the inputString:
    inputString += inChar;
    // if the incoming character is a newline, set a flag so the main loop can
    // do something about it:
    if (inChar == '\n') 
    {
      stringComplete = true;
    }
  }
}
