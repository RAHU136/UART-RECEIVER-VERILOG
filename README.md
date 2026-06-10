# UART Receiver using Verilog HDL

## Overview

This project implements a UART (Universal Asynchronous Receiver Transmitter) Receiver using Verilog HDL.

The receiver detects the start bit, receives 8-bit serial data, validates the stop bit, and converts the serial data into parallel output.

## Features

- FSM-based UART Receiver
- Start Bit Detection
- 8-bit Serial Data Reception
- Stop Bit Validation
- Serial-to-Parallel Conversion
- Data Valid Signal Generation
- Verilog Testbench
- GTKWave Verification

## FSM States

IDLE → START → DATA → STOP → DONE → IDLE

## Files

- uart_rx.v
- tb_uart_rx.v
- uart_rx.vcd
- uart_rx_waveform.png

## Simulation

Compile:

iverilog -o uart_rx.vvp uart_rx.v tb_uart_rx.v

Run:

vvp uart_rx.vvp

View Waveform:

gtkwave uart_rx.vcd

## Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- Ubuntu Linux

## Concepts Covered

- Finite State Machines (FSM)
- UART Communication Protocol
- Serial-to-Parallel Conversion
- Start/Stop Bit Handling
- Testbench Development
- Waveform Verification

## Author

Rahul Kumaran

B.E. Electronics and Communication Engineering

Aspiring RTL Design Engineer
