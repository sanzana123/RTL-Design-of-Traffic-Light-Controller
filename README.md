This project contains two Verilog modules:

traffic_light_controller.v
Implements a traffic light controller using a finite state machine (FSM). The system cycles through Red → Green → Yellow → Red states, with each state active for a specified number of clock cycles. The light output is represented as a 3-bit signal (light) where:

001 = Red

100 = Green

010 = Yellow

The controller uses a counter to control the duration of each state and transitions accordingly on the rising edge of the clock.

tb_traffic_light_controller.v
Testbench for simulating the traffic light controller. It generates a clock signal, applies a reset at the start, and monitors the light output using $monitor. The simulation runs for 300 time units to demonstrate state transitions.
