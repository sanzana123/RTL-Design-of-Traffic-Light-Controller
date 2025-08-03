# Traffic Light Controller

## Overview
This project implements a simple traffic light controller using Verilog HDL. It cycles through Red, Green, and Yellow lights with configurable timing using a clock and reset inputs.

---

## Features
- 3-state finite state machine (FSM) for traffic light control
- Configurable timing for Red, Green, and Yellow states
- Clean separation of state transition and output logic
- Includes a testbench for simulation

---

## Modules

### `traffic_light_controller`
- **Inputs:**  
  - `clk` — system clock  
  - `reset` — synchronous reset signal
- **Output:**  
  - `light` (3 bits) — controls Red, Yellow, and Green lights as one-hot encoded bits  
    - `001` — Red  
    - `010` — Yellow  
    - `100` — Green  

### `tb_traffic_light_controller` (Testbench)
- Generates clock and reset signals
- Simulates the traffic light controller behavior for 300 time units
- Monitors and prints the current light state at each clock cycle

---

## Timing (Adjustable)

| State  | Duration (clock cycles) |
|--------|-------------------------|
| RED    | 50                      |
| GREEN  | 30                      |
| YELLOW | 10                      |

---

## Usage

1. **Simulation:**

   - Load `traffic_light_controller.v` and `tb_traffic_light_controller.v` into your Verilog simulator (ModelSim, Vivado, etc.).
   - Run the testbench to observe traffic light sequence transitions.
   - Use the `$monitor` output for real-time state tracking.

2. **Synthesis:**

   - Integrate `traffic_light_controller` module in your FPGA or ASIC design.
   - Connect `light` output to physical LEDs or other output devices representing traffic lights.

