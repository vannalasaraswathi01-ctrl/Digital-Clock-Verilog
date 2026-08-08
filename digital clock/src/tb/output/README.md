# Digital Clock – Verilog

## Description

A **24-hour digital clock** designed using Verilog HDL. The design keeps track of hours, minutes, and seconds using counters and automatically rolls over from `23:59:59` to `00:00:00`.

## Features

* 24-hour digital clock
* Hour counter: `0–23`
* Minute counter: `0–59`
* Second counter: `0–59`
* Reset functionality
* Parameterized clock frequency
* Verilog testbench included
* Simulation output included

## Folder Structure

```text
Digital-Clock-Verilog/
│
├── src/
│   └── digital_clock.v
│
├── tb/
│   └── digital_clock_tb.v
│
├── output/
│   └── output.txt
│
└── README.md
```

## Inputs

| Signal  | Width | Description                    |
| ------- | ----: | ------------------------------ |
| `clk`   | 1-bit | System clock                   |
| `reset` | 1-bit | Resets the clock to `00:00:00` |

## Outputs

| Signal    | Width | Description         |
| --------- | ----: | ------------------- |
| `hours`   | 5-bit | Hours from `0–23`   |
| `minutes` | 6-bit | Minutes from `0–59` |
| `seconds` | 6-bit | Seconds from `0–59` |

## Working Principle

The design uses a counter to divide the input clock into one-second intervals.

The clock operates in the following sequence:

```text
00:00:00
    ↓
00:00:01
    ↓
00:00:02
    ↓
...
00:59:59
    ↓
01:00:00
    ↓
...
23:59:59
    ↓
00:00:00
```

## Simulation

This project can be simulated using **Icarus Verilog**.

### Compile

```bash
iverilog -o digital_clock_sim src/digital_clock.v tb/digital_clock_tb.v
```

### Run

```bash
vvp digital_clock_sim
```

### Save Output

```bash
vvp digital_clock_sim > output/output.txt
```

## Testbench

The testbench:

* Generates the clock signal
* Applies reset
* Instantiates the digital clock
* Monitors hours, minutes, and seconds
* Displays simulation results
* Ends the simulation automatically

## Learning Outcomes

This project demonstrates:

* Sequential logic
* Counters
* Clock division
* Reset handling
* Parameterized Verilog modules
* Testbench development
* Simulation and verification

## Future Improvements

The project can be extended with:

* 12-hour AM/PM mode
* Seven-segment display interface
* Alarm functionality
* Stopwatch mode
* FPGA implementation

## Author

**Nikhila**

## License

This project is created for educational and learning purposes.
