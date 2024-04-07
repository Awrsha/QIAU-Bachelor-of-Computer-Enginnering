Thanks to [Dr. Babak Karasfi](https://www.linkedin.com/in/babakkarasfi/), one of the professors of Islamic Azad University, for her support and encouragement for us to start this project.

<h1 align="center"> <br><a href="https://github.com/Awrsha/Temperature-Control"><img src="https://s2.uupload.ir/files/picsart_23-03-22_21-53-01-541_no85.png" alt="HSL" width="200"></a> <br> Qazvin Islamic Azad University <br></h1><b><h4 align="center">.:: Shooter Game ::.</h4></b><p align="center"><a href="https://github.com/Awrsha/Temperature-Control"><img src="https://img.shields.io/badge/Version-1.2.1-brightgreen" alt="HSL" width="100"></a><a href="https://github.com/Awrsha/Temperature-Control"><img src="https://img.shields.io/badge/Platform-windows-blue" alt="HSL" width="130"></a><a href="https://github.com/Awrsha/Temperature-Control"><img src="https://img.shields.io/badge/LICENSE-MIT-yellow" alt="HSL" width="110"></a><a href="https://github.com/Awrsha/Temperature-Control"><img src="https://img.shields.io/badge/Developers-2-lightgrey" alt="HSL" width="100"></a></p>

<h1 align="center"> <br><a href="https://github.com/Awrsha/Temperature-Control"><img src="https://github.com/Awrsha/Temperature-Control/assets/89135083/77288bf7-b9c6-4f62-ad7f-7dc3e50508ad" alt="HSL" width="500"></a><br> A Project Presented By Me <br></h1>

| items                                                                                        | #Q  |
| -------------------------------------------------------------------------------------------- | --- |
| Arduino Uno Board (CH340)                                                                    | 1   |
| 5V relay module   (R-01)                                                                     | 1   |
| Jumper board wire                                                                            | 1   |
| The cable connecting its board to the computer (such as the connecting cable of the printer) | 1   |
| TS1620A-21 seven-segment 4-digit display module                                              | 1   |
| DualSB model voltage reducer regulator module code 5V_3A-rd                                  | 1   |
| 4.7 kilo ohm resistance with 0.25 watt power and 5% tolerance                                | 1   |
| temperature sensor (DS18B20)                                                                 | 1   |
| Cooler (Fan => 12V)                                                                          | 1   |
| heater (low-ampere filament lamp)                                                            | 1   |
| 12V-2A Adapter (Independent power source for cooling and heating control)                    | 1   |
| Lamp head (JE1013)                                                                           | 1   |

## How To work

With the help of a temperature sensor, a cooler (fan) and a heater (low-ampere filament lamp), we keep the temperature of the chamber constant, for example, the temperature of the chamber should be 25 degrees Celsius.

If the temperature drops, the heater starts working to increase the temperature

If the temperature rises, the cooling circuit turns on and the chamber temperature decreases.

In this way, the temperature remains constant

## Download

- [Arduino IDE 1.8.19](https://www.arduino.cc/en/software)

> **Note**
> Don't forget to download the libraries included in this repository to run the code correctly.
> The path to install libraries in Arduino software :
> **Sketch > Include Library > Add .ZIP Library…**

## Programming on Arduino board

- Connect the Arduino board to the computer via USB cable.

**The first method**

- After running the Arduino software, click on the **New** option through the **File** menu.
- Paste the codes placed in file **Temperatur-ctrl** in the new window
- Now select the **Save** option from the **File** menu and save the program in your desired location.
- After saving the program, go to the **Board** menu through the Tools menu and select the **Arduino Uno** item from the drop-down list.
- Go to the **Port** menu again through the same Tools menu and select the USB port number through which the Arduino board is connected to the computer from the drop-down list.
- In the end, to transfer the program to the Arduino board, it is enough to click on the **upload** icon to program the program on the Arduino board in the Arduino software.

**The second method**

- After running the Arduino software, click on the **open** option through the File menu.
- and open file **Temperatur-ctrl**
- After openning the program, go to the **Board** menu through the Tools menu and select the **Arduino Uno** item from the drop-down list.
- Go to the **Port** menu again through the same Tools menu and select the USB port number through which the Arduino board is connected to the computer from the drop-down list.
- In the end, to transfer the program to the Arduino board, it is enough to click on the **upload** icon to program the program on the Arduino board in the Arduino software.

## How to use

After entering the necessary codes, connect the board to the computer through a serial port and from the serial part of the monitor, we can set our desired temperature by entering the number of that temperature. You can also connect the board to your phone with a OTG Make these settings using the [Serial USB Terminal](https://play.google.com/store/apps/details?id=de.kai_morich.serial_usb_terminal&hl=fa&gl=US&pli=1) program tool, which is the same as the serial monitor of the Arduino editor

## New Idea

By writing a simple program, you can connect the temperature information to your mobile phone with a USB or Type-C cable instead of displaying it on the LCD and view it on the mobile phone.

## Developers 👨🏻‍💻

<p align="center">

<a href="https://github.com/Awrsha"><img src="https://avatars.githubusercontent.com/u/89135083?v=4" width="100;" alt="Awrsha Parvizi"/><br /><sub><b>.:: Amir M. Parvizi ::.</b></sub></a>

</p>

<p align="center">

<a href="https://github.com/Mohsen020"><img src="https://avatars.githubusercontent.com/u/127343209?v=4" width="100;" alt="Mohsen Moradi"/><br /><sub><b>.:: Mohsen Moradi ::.</b></sub></a>

</p>
