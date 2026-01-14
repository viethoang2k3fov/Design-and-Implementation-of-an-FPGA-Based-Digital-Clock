# FPGA-Based Digital Clock

## 📌 Overview
Project about the design and implementation of an FPGA-based digital clock.
The system is fully implemented using Verilog HDL . In addition to real-time timekeeping, the clock
supports manual adjustment of hours, minutes, and seconds, as well as pause
and resume functionality.

## 🎯 Key Features
- Real-time digital clock implementation on FPGA
- Hour, minute, and second counting
- Manual adjustment of hours, minutes, and seconds
- Pause and resume clock operation
- Clock divider for accurate 1 Hz time base generation
- Digital display output (7-segment / LED)
- Fully synchronous RTL design using Verilog HDL

## 🛠 Hardware Platform
- FPGA Board: DE10-Standard (Cyclone V)
- Display: 7-segment LED (or equivalent digital display)
- Input controls: Push buttons / switches (for time adjustment and pause)
- Clock source: On-board FPGA clock

## 🧠 Design Description
The system is designed using a modular RTL approach. A clock divider module
generates a precise 1 Hz timing signal from the system clock. Time counter
modules manage hours, minutes, and seconds. Control logic allows the user to
pause the clock and manually adjust time values through input buttons or
switches. All operations are implemented synchronously to ensure stable and
reliable behavior.

## 📂 Project Structure


## 🧩 Source Code Overview
- Clock divider module for timing generation
- Time counter modules (hours, minutes, seconds)
- Time adjustment and pause control logic
- Display decoding and control modules
- Top-level module integrating all system components

## 🧪 Simulation & Verification
- Functional verification using Verilog testbench
- Waveform-based simulation to validate counting, adjustment, and pause behavior
- Simulation results provided in the `images/` directory

## 🎓 Project Context
- Project type: FPGA / Digital Design Project
- Implementation language: Verilog HDL
- Focus areas: RTL design, synchronous logic, timing control, and verification

## 👤 Author
- Name: Viet Hoang
- GitHub: https://github.com/viethoang2k3fov

## 📎 Notes
This project is intended for academic and learning purposes.
Auto-generated build files and FPGA programming files are excluded from this repository.
