# HDL Examples (VHDL & Verilog)

This repository contains a collection of HDL (Hardware Description Language) examples that I created while practicing VHDL and Verilog in the _Vivado_ environment. The examples are organized into different practice sections to showcase various concepts and techniques in FPGA design.

## Structure

The repository is organized into language-specific folders (`VHDL/` and `Verilog/`), each containing multiple practice sections. Within each practice section, you will find simulation files (`sim/`), source files (`src/`), and a `setup.tcl` script to automate the _Vivado_ project setup. This structure is designed to help you easily navigate and work on different sections based on the HDL language you're using.

```
 HDL_examples/
├── <language>/              - Directory for VHDL/ and Verilog/ examples
│   └── <practice-section>/  - Directory for a specific practice section
│      ├── sim/              - Contains simulation files for the practice section
│      ├── src/              - Contains source files for the practice section
│      └── setup.tcl         - TCL script for seting up the Vivado project for the practice section
└── create_project.tcl       - TCL script for creating a new Vivado project
```

> 📝 **Note**: For the `<practice-section>` _hierarchical_design_, there are subprojects, as they show how the hierarchy works in `VHDL/` and `Verilog/`.
> You'll need to run the `setup.tcl` script for each subproject inside the _hierarchical_design_ directory.

## Getting Started

To get started with the examples, clone this repository to your local machine:

```bash
git clone https://github.com/vgalovic/HDL_examples.git
```

## Setting Up the Vivado Project

To set up a specific practice section in _Vivado_, follow these steps:

### 1. Fetch Latest Available Boards (if needed)

If you have just installed _Vivado_, you will need to fetch the latest available boards from the git repository. Run the following command in the TCL console:

```tcl
xhub::refresh_catalog [xhub::get_xstores xilinx_board_store]
```

This will refresh the catalog and ensure you have access to the latest board configurations.

### 2. Source the Setup Script

Once the boards are fetched, open the TCL console in Vivado and run the following command to set up the project:

```tcl
source <base_directory>/HDL_examples/<language>/<practice-section>/setup.tcl
```

> 📝 **Note**: Make sure to replace `<base_directory>`, `<language>`, and `<practice-section>` with the correct paths based on your repository structure.

This will:

- Create a new Vivado project in `$HOME/Documents/Vivado`.
- Add all relevant source files and simulation files for the specified practice section.
