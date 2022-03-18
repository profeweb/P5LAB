void setup() {

  //normal LEDs
  pinMode(2, OUTPUT);   //set pin as output , red led
  pinMode(3, OUTPUT);   //set pin as output , blue led
  pinMode(4, OUTPUT);   //set pin as output , green led
  pinMode(5, OUTPUT);   //set pin as output , yellow led
  pinMode(6, OUTPUT);   //set pin as output , pink led

    //RGB LEDs
    pinMode(8, OUTPUT); // ground
    pinMode(9, OUTPUT); // red
    pinMode(10, OUTPUT); // green
    pinMode(11, OUTPUT); // blue

  Serial.begin(9600);    //start serial communication @9600 bps



}

void loop() {
  if(Serial.available()){  //id data is available to read

    char val = Serial.read();
    
//red
    if(val == 'r'){       //if r received
      digitalWrite(2, HIGH); //turn on red led
      }
    if(val == 'a'){       //if a received
      digitalWrite(2, LOW); //turn off red led
      } 

//blue       
    if(val == 'b'){       //if b received
      digitalWrite(3, HIGH); //turn on blue led
      }

    if(val == 'c'){       //if c received
      digitalWrite(3, LOW); //turn off blue led
      } 

//green   
    if(val == 'g'){       //if g received
      digitalWrite(4, HIGH); //turn on green led
      }
    if(val == 'd'){       //if d received
      digitalWrite(4, LOW); //turn off green led
      }

//yellow      
    if(val == 'y'){       //if y received
      digitalWrite(5, HIGH); //turn on yellow led
      }
    if(val == 'e'){       //if e received
      digitalWrite(5, LOW); //turn off yellow led
      }

//pink      
    if(val == 'p'){       //if p received
      digitalWrite(6, HIGH); //turn on pink led
      }
    if(val == 'f'){       //if f received
      digitalWrite(6, LOW); //turn off pink led
      }    

//////////////////////////////////////////////////////////////////////////
//////////FULL INDIVIDUAL ON/OFF CONTROL
//////////////////////////////////////////////////////////////////////////


//all individual off      
    if(val == 'x'){       //if x received
      digitalWrite(2, LOW); //turn off all led
      digitalWrite(3, LOW);
      digitalWrite(4, LOW);
      digitalWrite(5, LOW);
      digitalWrite(6, LOW);      
      analogWrite(9, 0);
      analogWrite(10, 0);
      analogWrite(11, 0);  
      }
      
//all individual on   
          
    if(val == 'z'){       //if z received
      digitalWrite(2, HIGH); //turn on all led
      digitalWrite(3, HIGH);
      digitalWrite(4, HIGH);
      digitalWrite(5, HIGH);
      digitalWrite(6, HIGH);
//      analogWrite(9, 255);
//      analogWrite(10,255);
//      analogWrite(11,255);       
      }   
    

//////////////////////////////////////////////////////////////////////////
//////////RGB Individual Control
//////////////////////////////////////////////////////////////////////////


    if(val == 'j'){       //if p received
analogWrite(9, GetFromSerial());
      }
    if(val == 'k'){       //if f received
analogWrite(10, GetFromSerial());
      }    
    if(val == 'l'){       //if f received
analogWrite(11, GetFromSerial());
      }   
  }
}


// read the serial port
int GetFromSerial()
{
while (Serial.available()<=0) {
  }
return Serial.read();
}
