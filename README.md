# Digital Communication: BPSK & QPSK Modulation Analysis

This repository contains a MATLAB-based simulation to evaluate and compare the performance of **Binary Phase Shift Keying (BPSK)** and **Quadrature Phase Shift Keying (QPSK)** modulation schemes. The project focuses on bit error probability and signal integrity in the presence of **Additive White Gaussian Noise (AWGN)**.

## 📑 Project Overview
The primary goal is to demonstrate the trade-offs between power efficiency and spectral efficiency. In digital communications, BPSK is highly robust but has a low spectral efficiency (1 bit/symbol), while QPSK doubles the data rate (2 bits/symbol) within the same bandwidth while maintaining a similar Bit Error Rate (BER) performance per bit.

### Key Objectives:
* Simulate random bit generation and mapping logic.
* Model the communication channel using **AWGN**.
* Calculate and plot the **Bit Error Rate (BER)** vs. **Signal-to-Noise Ratio (SNR)**.
* Visualize signal constellations to observe the impact of noise clusters and decision boundaries.

## 📊 Performance Analysis

### 1. Bit Error Rate (BER)
The simulation generates a semilogarithmic plot. Under ideal AWGN conditions, the bit error probability $P_b$ for both BPSK and QPSK is theoretically defined by the Q-function:

$$P_b = Q\left(\sqrt{\frac{2E_b}{N_0}}\right)$$



### 2. Constellation Diagrams
The constellation diagrams show the "spread" of received symbols at a specific SNR level. 
* **BPSK:** Symbols are distributed along the horizontal (In-Phase) axis.
* **QPSK:** Symbols are distributed across four quadrants in the complex plane, representing phases of 45°, 135°, 225°, and 315°.

## 📊 Simulation Results

### 1. BER Performance Analysis
The plot below illustrates the Bit Error Rate (BER) as a function of SNR (dB). As expected, both BPSK and QPSK show nearly identical BER performance per bit, following the theoretical Q-function curve.

![BER Performance Plot](ber.fig)

### 2. Constellation Visualizations
The constellation diagrams represent the signal space. At an SNR of 12 dB, the noise clusters around the ideal points are clearly visible.

#### QPSK Constellation
QPSK utilizes both the In-phase and Quadrature components, allowing for four distinct states.
![QPSK Constellation](qpsk.fig)

#### BPSK Constellation
BPSK is a one-dimensional modulation where the information is contained only in the In-phase component.
![BPSK Constellation](bpsk.fig)

##  Getting Started

### Prerequisites
* MATLAB (R2021a or later recommended).
* Communications Toolbox.

## How to Run
1. Clone the repository: `git clone https://github.com/your-username/repository-name.git`
2. Open `main_simulation.m` in MATLAB.
3. Run the script to generate the figures.
