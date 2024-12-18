HDL Examples (VHDL & Verilog)
=============================

This repository contains a collection of HDL (Hardware Description Language) examples that I created while practicing VHDL and Verilog in the Vivado environment. The examples are organized into different practice sections to showcase various concepts and techniques in FPGA design.

## Structure

The repository is organized into language-specific folders (`VHDL/` and `Verilog/`), each containing multiple practice sections. Within each practice section, you will find simulation files (`sim/`), source files (`src/`), and a `setup.tcl` script to automate the Vivado project setup. This structure is designed to help you easily navigate and work on different sections based on the HDL language you're using.

<pre>
    &lt;VHDL|Verilog&gt;/                  - Root directory for VHDL or Verilog examples  
    ├── &lt;practice-section&gt;/          - Directory for a specific practice section  
    │   ├── sim/                     - Contains simulation files for the practice section  
    │   ├── src/                     - Contains source files for the practice section  
    │   └── setup.tcl                - TCL script for Vivado project setup
    └── create_project.tcl           - TCL script for creating a new Vivado project
</pre>

## Getting Started

To get started with the examples, clone this repository to your local machine:

```bash
git clone https://github.com/vgalovic/HDL_examples.git

