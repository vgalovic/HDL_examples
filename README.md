HDL Examples (VHDL & Verilog)
=============================

This repository contains a collection of HDL (Hardware Description Language) examples that I created while practicing VHDL and Verilog in the *Vivado* environment. The examples are organized into different practice sections to showcase various concepts and techniques in FPGA design.

Structure
---------

The repository is organized into language-specific folders (`VHDL/` and `Verilog/`), each containing multiple practice sections. Within each practice section, you will find simulation files (`sim/`), source files (`src/`), and a `setup.tcl` script to automate the *Vivado* project setup. This structure is designed to help you easily navigate and work on different sections based on the HDL language you're using.

```
 HDL_examples/
├── <language>/              - Directory for VHDL/ and Verilog/ examples
│   └── <practice-section>/  - Directory for a specific practice section
│      ├── sim/              - Contains simulation files for the practice section
│      ├── src/              - Contains source files for the practice section
│      └── setup.tcl         - TCL script for seting up the Vivado project for the practice section
└── create_project.tcl       - TCL script for creating a new Vivado project
```

Getting Started
---------------

To get started with the examples, clone this repository to your local machine:

```bash
git clone https://github.com/vgalovic/HDL_examples.git
```

Setting Up the Vivado Project
-----------------------------

To set up a specific practice section in *Vivado*, use the following command in the TCL console:

```tcl
source <base_directory>/HDL_examples/<language>/<practice-section>/setup.tcl
```

This will:

- Create a new *Vivado* project in `$HOME/Documents/Vivado`.
- Add all relevant source files and simulation files to the project.

> 📝 **Note:** Make sure to replace `<base_directory>`, `<language>`, and `<practice-section>` with the correct paths based on repository structure.
