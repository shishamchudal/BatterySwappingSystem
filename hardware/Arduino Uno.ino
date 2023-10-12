#include <ArduinoJson.h>
#include <ArduinoJson.hpp>
#include <TinyGPS++.h>
#include <SoftwareSerial.h>

static const int RXPin = 4, TXPin = 3;
static const uint32_t GPSBaud = 9600;

// The TinyGPS++ object
TinyGPSPlus gps;

// The serial connection to the GPS device
SoftwareSerial GPS(RXPin, TXPin);

// Define the proximity sensor pin
const int battery1ProximitySensorPin = 10;
const int battery2ProximitySensorPin = 11;

bool battery1Available = false;
bool battery2Available = false;

// Variables to store last known GPS coordinates
String lastKnownLat = "0.00";
String lastKnownLng = "0.00";

bool gpsDataAvailable = false;

void setup() {
  // Set the proximity sensor pin as an input
  pinMode(battery1ProximitySensorPin, INPUT);
  pinMode(battery2ProximitySensorPin, INPUT);
  pinMode(LED_BUILTIN, OUTPUT);

  Serial.begin(9600);
  GPS.begin(GPSBaud);

  // Attempt to capture GPS data in setup
  if (GPS.available() > 0) {
    gps.encode(GPS.read());
    if (gps.location.isUpdated()) {
      lastKnownLat = String(gps.location.lat(), 6);
      lastKnownLng = String(gps.location.lng(), 6);
      gpsDataAvailable = true;
    }
  }
}

void loop() {
  if (!gpsDataAvailable) {
    // No GPS data yet, wait for it

    for (int i = 0; i < 3; i++) {

      // Serial.println("GPS not available. Trying again.");
      digitalWrite(LED_BUILTIN, HIGH);  // turn the LED on (HIGH is the voltage level)
      delay(100);                       // wait for a second
      digitalWrite(LED_BUILTIN, LOW);   // turn the LED off by making the voltage LOW
      delay(100);
    }

    if (GPS.available() > 0) {
      gps.encode(GPS.read());
      if (gps.location.isUpdated()) {
        lastKnownLat = String(gps.location.lat(), 6);
        lastKnownLng = String(gps.location.lng(), 6);
        gpsDataAvailable = true;
      }
    }
  }

  // For Battery Percentage.
  int aV = analogRead(A0);

  int percentage = (aV / 790.0) * 100;

  // Read the value of the proximity sensor
  int battery1ProximitySensorValue = digitalRead(battery1ProximitySensorPin);
  int battery2ProximitySensorValue = digitalRead(battery2ProximitySensorPin);


  if (battery1ProximitySensorValue == HIGH) {
    battery1Available = false;
  } else {
    battery1Available = true;
  }

  // If the sensor value is HIGH, then an object is present
  if (battery2ProximitySensorValue == HIGH) {
    battery2Available = false;
  } else {
    battery2Available = true;
  }

  if (percentage < 0) {
    percentage = 0;
  }

  if (percentage > 100) {
    percentage = 100;
  }

  if (!battery1Available) {
    percentage = 0;
  }

  // // JSON payload
  DynamicJsonDocument jsonDoc(200);
  jsonDoc["lat"] = lastKnownLat;
  jsonDoc["lng"] = lastKnownLng;
  jsonDoc["Battery1Available"] = battery1Available;
  jsonDoc["Battery2Available"] = battery2Available;
  jsonDoc["Battery1Percentage"] = percentage;
  jsonDoc["Battery2Percentage"] = 0;

  String payload;
  serializeJson(jsonDoc, payload);

  Serial.println(payload);

  // Delay for 1 second
  delay(9000);
}
