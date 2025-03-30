# HDL Examples (VHDL & Verilog)

This repository contains a collection of HDL (Hardware Description Language) examples that I created while practicing VHDL and Verilog in the _Vivado_ environment.
The examples are organized into different modules, covering various concepts and techniques in FPGA design.

## Structure

The repository is structured into language-specific folders (`VHDL/` and `Verilog/`), each containing multiple modules.
Within each module, you will find:

- **`sim/`** – Simulation files
- **`src/`** – Source files
- **`setup.tcl`** – A TCL script to automate the _Vivado_ project setup

This organization allows for easy navigation and usage of different modules based on the HDL language you’re working with.

```
 HDL_examples/
├── <language>/              - Directory for VHDL/ and Verilog/ examples
│   └── <module>/            - Directory for a specific module
│      ├── sim/              - Contains simulation files for the module
│      ├── src/              - Contains source files for the module
│      └── setup.tcl         - TCL script for setting up the Vivado project for the module
├── create_project.tcl       - TCL script for creating a new Vivado project
└── cleanup.tcl              - TCL script for cleaning up set variables in the console
```

## Modules

The modules in this repository are listed below in the order I created them. However, you are free to explore them in any order:

1. **logic_gates** – Basic logic gates implementation
2. **mux_demux** – Multiplexers and demultiplexers
3. **coder_converter_comparator** – Encoders, decoders, converters, and comparators
4. **latches_and_flip-flops** – Latches and flip-flops (sequential elements)
5. **registers** – Register-based designs
6. **memory** – Memory modules and related concepts
7. **counters** – Various types of counters
8. **FSM** – Finite State Machines
9. **parameterized_design** – Parameterized modules and reusable components
10. **hierarchical_design** – Hierarchical design with submodules

> 📝 **Note**:
> The _hierarchical_design_ module contains subprojects that demonstrate hierarchy in both `VHDL/` and `Verilog/`.
> You need to run the `setup.tcl` script separately for each subproject.

## Getting Started

To get started with the examples, clone this repository to your local machine:

```bash
git clone https://github.com/vgalovic/HDL_examples.git
```

## Setting Up the Vivado Project

To set up a specific module in _Vivado_, follow these steps:

### 1. Fetch Latest Available Boards (if needed)

If you have just installed _Vivado_, you may need to fetch the latest available boards. Run the following command in the **TCL console**:

```tcl
xhub::refresh_catalog [xhub::get_xstores xilinx_board_store]
```

### 2. Source the Setup Script

Once the boards are updated, open the **TCL console** in _Vivado_ and run:

```tcl
source <base_directory>/HDL_examples/<language>/<module>/setup.tcl
```

This will:

- Create a new _Vivado_ project in:
  - **Linux**: `$HOME/Documents/Vivado/HDL_examples/<language>/`
  - **Windows**: `%USERPROFILE%\Documents\Vivado\HDL_examples\<language>\`
- Add all relevant source and simulation files for the selected module.
- Set the top-level module/entity if it is specified in the `setup.tcl` script.

> **Replace** `<base_directory>`, `<language>`, and `<module>` with the appropriate paths.
