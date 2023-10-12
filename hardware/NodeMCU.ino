#include <ESP8266WiFi.h>
#include <WiFiClientSecure.h>
#include <ArduinoJson.h>

const char* ssid = "SSID";         // Your Wi-Fi SSID
const char* password = "Password";   // Your Wi-Fi password
const char* host = "domainname.com";  // Host URL
const int httpsPort = 443;                // HTTPS port

const char* createPostPath = "/api/bss/1/update";  // API endpoint path

void setup() {
  Serial.begin(9600);

  // Connect to Wi-Fi
  WiFi.begin(ssid, password);
  Serial.print("Connecting to WiFi...");
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.print(".");
  }
  Serial.println("Connected to WiFi");
}

void loop() {
  // Serial.println(Serial.available() > 0);
  if (Serial.available() > 0) {
    String payload = Serial.readStringUntil('\n');

    // Serial.print("Payload: ");
    Serial.println(payload);

    WiFiClientSecure client;
    client.setInsecure();  // Add this line before client.connect

    // Attempt to connect
    if (!client.connect(host, httpsPort)) {
      Serial.println("Connection failed!");
      return;
    }

      // Make the HTTPS request
      client.print(String("POST ") + createPostPath + " HTTP/1.1\r\n" + "Host: " + host + "\r\n" + "Content-Type: application/json\r\n" + "Connection: close\r\n" + "Content-Length: " + payload.length() + "\r\n" + "\r\n" + payload);

      Serial.println("Request sent.");

      // Serial.println("GPS not available. Trying again.");
      digitalWrite(LED_BUILTIN, HIGH);  // turn the LED on (HIGH is the voltage level)

      // Read the response
      while (client.connected()) {
        String line = client.readStringUntil('\n');
        if (line == "\r") {
          break;
        }
      }

      while (client.available()) {
        String responseLine = client.readStringUntil('\n');
        Serial.println(responseLine);
      }

      Serial.println("Response received.");

      for (int i = 0; i < 3; i++) {

        // Serial.println("GPS not available. Trying again.");
        digitalWrite(LED_BUILTIN, HIGH);  // turn the LED on (HIGH is the voltage level)
        delay(100);                       // wait for a second
        digitalWrite(LED_BUILTIN, LOW);   // turn the LED off by making the voltage LOW
        delay(100);
      }

      // Disconnect
      client.stop();


      digitalWrite(LED_BUILTIN, LOW);  // turn the LED off by making the voltage LOW

      // Wait for a few seconds
      delay(3000);
    }
  }
