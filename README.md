# FPGA-Based Digital Clock

## 📌 Overview
Project about the design and implementation of an FPGA-based digital clock.
The system is fully implemented using Verilog HDL and operates without a microcontroller.
It provides real-time timekeeping and digital display driven entirely by hardware logic.

## 🎯 Key Features
- Real-time digital clock implementation on FPGA
- Hour, minute, and second counting
- Clock divider for accurate time base generation
- Digital display output (7-segment / LED)
- Fully synchronous Verilog HDL design

## 🛠 Hardware Platform
- FPGA Board: DE10-Standard (Cyclone V)
- Display: 7-segment LED (or equivalent digital display)
- Clock source: On-board FPGA clock

## 🧠 Design Description
The system is designed using a modular RTL approach. A clock divider module
generates a 1 Hz timing signal from the system clock. Time counters update
hours, minutes, and seconds synchronously. Display logic converts internal
binary values into display-friendly formats.

## 📂 Project Structure


## 🧩 Source Code Overview
- Clock divider module for timing generation
- Time counter modules (hours, minutes, seconds)
- Display control and decoding logic
- Top-level module integrating all components

## 🧪 Simulation & Verification
- Functional verification using Verilog testbench
- Waveform-based simulation to validate timing and counter behavior
- Simulation results provided in the `images/` directory

## 🎓 Project Context
- Project type: FPGA / Digital Design Project
- Implementation language: Verilog HDL
- Focus areas: RTL design, synchronous logic, timing, and verification

## 👤 Author
- Name: Viet Hoang
- GitHub: https://github.com/viethoang2k3fov

## 📎 Notes
This project is intended for academic and learning purposes.
Auto-generated build files and FPGA programming files are excluded from this repository.
