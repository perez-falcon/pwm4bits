<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project is a 4-bit PWM controller designed in Verilog. It uses a frequency divider, a counter, and a comparator to generate a PWM signal with 16 selectable duty cycle settings, ranging from 0% to 100%.

## How to test

Apply a clock signal and release the reset. Change the four digital inputs (UI0–UI3) to adjust the duty cycle. Observe the PWM signal on UO0 and the status indicator on UO1.

With a 50 MHz input clock, the PWM frequency is 1 kHz.

## External hardware

No additional external hardware is required. An LED or an oscilloscope can optionally be used to observe the PWM output.
