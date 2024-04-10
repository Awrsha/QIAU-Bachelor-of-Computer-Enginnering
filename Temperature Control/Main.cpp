#include <OneWire.h>
#include <LiquidCrystal.h>

// Define pins for OneWire and LCD
const int ONEWIRE_PIN = 10;
const int LCD_RS_PIN = 12, LCD_EN_PIN = 11, LCD_D4_PIN = 5, LCD_D5_PIN = 4, LCD_D6_PIN = 3, LCD_D7_PIN = 2;

// Initialize OneWire and LCD objects
OneWire ds(ONEWIRE_PIN);
LiquidCrystal lcd(LCD_RS_PIN, LCD_EN_PIN, LCD_D4_PIN, LCD_D5_PIN, LCD_D6_PIN, LCD_D7_PIN);

// Initialize variables
int targetTemperature = 32;

// Setup function runs once at the beginning
void setup() {
    // Start serial communication
    Serial.begin(9600);
    
    // Initialize LCD
    lcd.begin(16, 2);
    lcd.cursor();
    lcd.print("Hello World :)");
  
    // Set pin modes
    pinMode(7, OUTPUT); // Output pin for controlling a device based on temperature
    pinMode(9, INPUT);  // Up button pin
    pinMode(8, INPUT);  // Down button pin
    
    // Delay for sensor stabilization
    delay(2500);
}

// Main program loop
void loop() {
    // Variables to hold sensor data
    byte i;
    byte present = 0;
    byte data[12];
    byte addr[8];
    float celsius, fahrenheit;
  
    // Search for devices on the OneWire bus
    if (!ds.search(addr)) {
        ds.reset_search();
        delay(50);
        return;
    }
  
    // Verify device address
    if (OneWire::crc8(addr, 7) != addr[7]) {
        return;
    }

    // Request temperature conversion
    ds.reset();
    ds.select(addr);
    ds.write(0x44, 1); // Start conversion
  
    delay(750); // Wait for conversion to complete
  
    // Read temperature data
    present = ds.reset();
    ds.select(addr);    
    ds.write(0xBE); // Read Scratchpad

    for (i = 0; i < 9; i++) {
        data[i] = ds.read();
    }

    // Convert raw data to temperature
    int16_t raw = (data[1] << 8) | data[0];
    celsius = (float)raw / 16.0;

    // Print temperature to Serial monitor
    Serial.print("Temperature = ");
    Serial.println(celsius);

    // Display temperature on LCD
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Temperature: ");
    lcd.print(celsius);
    lcd.print(" C");

    // Control external device based on temperature
    if (celsius > targetTemperature) {
        digitalWrite(7, LOW); // Turn off the device
    } else {
        digitalWrite(7, HIGH); // Turn on the device
    }

    // Adjust target temperature using buttons
    if (digitalRead(9) == HIGH) { // If up button is pressed
        targetTemperature++;
    }

    if (digitalRead(8) == HIGH) { // If down button is pressed
        targetTemperature--;
    }

    // Delay before next iteration
    delay(1000);
}