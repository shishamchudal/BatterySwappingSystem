# IoT Battery Swapping Station Monitoring System

This project involves an Internet of Things (IoT) setup that monitors battery swapping stations and sends data to a Laravel backend. The collected data is used to power a Flutter application, allowing users to view details about the battery swapping stations.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Hardware Requirements](#hardware-requirements)
- [Software Requirements](#software-requirements)
- [Setup Instructions](#setup-instructions)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

This IoT project utilizes NodeMCU and Arduino Uno to monitor battery swapping stations and gather relevant data. The data is then sent to a Laravel backend, which is utilized by a Flutter application for visualizing information about the battery stations.

## Features

- Monitors battery swapping stations.
- Sends data to a Laravel backend periodically.
- Provides battery availability and percentage information.
- Supports integration with a Flutter application for user-friendly visualization.

## Hardware Requirements

- NodeMCU
- Arduino Uno
- Proximity sensors
- GPS module
- LEDs
- Batteries for testing

## Software Requirements

- Arduino IDE
- Libraries:
  - ESP8266WiFi
  - WiFiClientSecure
  - ArduinoJson
  - TinyGPS++

## Setup Instructions

1. Clone this repository to your local machine.
2. Open the NodeMCU code in Arduino IDE and upload it to the NodeMCU board.
3. Open the Arduino Uno code in Arduino IDE and upload it to the Arduino Uno board.
4. Ensure the necessary hardware is set up as per the [Hardware Requirements](#hardware-requirements).
5. Power on the devices and observe the data being sent to the specified Laravel backend.

## Usage

Once the setup is complete and the devices are powered on, the system will automatically start monitoring the battery swapping stations and sending data to the Laravel backend. The data can then be utilized by a Flutter application to provide users with real-time information about the battery stations.

## Contributing

We welcome contributions from the community. To contribute to this project, please follow these guidelines:
- Fork the repository.
- Create a new branch for your feature or bug fix.
- Make your changes and test them thoroughly.
- Submit a pull request, explaining the changes you've made.

## License

This project is licensed under the [MIT License](LICENSE).
