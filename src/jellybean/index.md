---
title: "Jellybean parts & useful components"
subtitle: "Reference for electronics & PCB design"
author: "JorisL"
author-url: 'https://blog.jorisl.nl'
date: "last updated: April '24"
---

This is my personal reference for jellybean parts and other usefull electronic components.
This list is mostly focussed on hand-solderable surface mount components.

Sources:

- Art of Electronics, Third Edition
- [EEVBlog](https://www.youtube.com/watch?v=uq1DMWtjL2U&list=PLvOlSehNtuHtdQF-m5UFZ5GEjABadI3kI)
- [The Knowledge Accelerator](https://theknowledgeaccelerator.com/2016/04/16/jellybean-components/)
- ...

# Resistors

## Fixed value

Any resistor in [E24, E48, E96, or E192 series](https://en.wikipedia.org/wiki/E_series_of_preferred_numbers) (lower preferred).

| Package | Voltage | Power |
|---------|---------|-------|
| 0402    | 50V     | 63mW  |
| 0603    | 75V     | 100mW |
| 0805    | 150V    | 125mW |
| 1206    | 200V    | 250mW |

## Variable

- [Bourns 3386 9mm square single turn, 0.5 W](https://www.bourns.com/pdfs/3386.pdf)
- [Bourns 3296 9mm square multi turn, 0.5 W](https://www.bourns.com/pdfs/3296.pdf)

# Diodes

| **Part #** | Type | Current rating | Max voltage | Voltage drop | Leakage current | Capacitance | Package | Comments |
|------------|------|------------------------|---------------------|----------------------|-------------------------|-------------|---------|----------|
| **RS1M** | Silicon | 1A | 1000V | 1.3V @ 1A | 5µA @ 1000V | 15pF | SMA | |
| **1N4148W** | Silicon | 150mA | 75V | 1V @ 10mA | 5nA @ 20V | 4pF | SOD123 | |
| **BAT54** (A,C,S suffixes) | Schottky | 200mA | 30V | 800mV @ 100mA | 2µA @ 25V | 10pF | SOT23 | variants for 2 diodes in 1 package |
| **1N5819HW** | Schottky | 1A | 40V | 400mV @ 1A | 10µA @ 32V | 150pF | SOD123 | |
| **SS54** | Schottky | 5A | 40V | 550mV @ 5A | 1mA @ 40V | 500pF | SMC | |

# MOSFETs

## nMOS

| **Part #** | Voltage rating | Drain current | Resistance | Threshold voltage | Package | Comments |
|------------|-----------|-------|----------|----------|---------|----------|
| **2N7002** | 60V | 100mA | 2.5Ω | 1V ... 2.5V | SOT23 | |
| **BSS138** | 50V | 250mA | 1Ω | 0.8V ... 1.5V | SOT23 | |
| **BSS123** | 100V | 170mA | 1.3Ω | 0.8V ... 2V | SOT23 | |
| **FDN337N** | 30V | 1.3A | 70mΩ | 0.4 ... 1V | SOT23 | |

## pMOS

| **Part #** | Voltage rating | Drain current | Resistance | Threshold voltage | Package | Comments |
|------------|-----------|-------|----------|----------|---------|----------|
| **BSS84** | 50V | 130mA | 3Ω | -0.8V ... -2V | SOT23 | |
| **NDS332P** | 20V | 700mA | 350mΩ | -0.4V ... -1V | SOT23 | |

# BJTs

## NPN

| **Part #** | Voltage rating | Drain current | Base-emitter on | Gain | Package | Comments |
|------------|-----------|-------|----------|----------|---------|----------|
| **MMBT3904** | 40V | 200mA | 0.65V ... 0.95V | 30 ... 100 | SOT23 | |
| **MMBT2222** | 40V | 600mA | 0.6V ... 2.6V | 35 ... 100 | SOT23 | |
| **FMMT617** | 15V | 3A | 0.8V ... 1V | 80 ... 400 | SOT23 | |
| **2N3055** | 100V | 15A | 1.5V | 5 ... 80 | TO3 | |

## PNP

| **Part #** | Voltage rating | Drain current | Base-emitter on | Gain | Package | Comments |
|------------|-----------|-------|----------|----------|---------|----------|
| **MMBT3906** | -40V | -200mA | -0.65V ... -0.95V | 30 ... 100 | SOT23 | |
| **MMBT2907** | -60V | -600mA | -0.4V ... -2.6V | 50 ... 100 | SOT23 | |
| **FMMT617** | -12V | 2.5A | -0.8V ... -1V | 45 ... 475 | SOT23 | |
| **2N3055** | 100V | 15A | 1.5V | 5 ... 80 | TO3 | |

# Opamps

- [LM358 industry-standard dual opamp](https://www.ti.com/lit/ds/symlink/lm358.pdf)
- [LMV358 low-voltage rail-to-rail CMOS opamp](https://www.ti.com/lit/ds/symlink/lmv358a.pdf)
- [TL0xx FET input opamp](https://www.ti.com/lit/ds/symlink/tl071a.pdf)
- [OPO07 precision opamp](https://www.ti.com/lit/ds/symlink/op07c.pdf)

# Comparators

- [LM393 dual comparator](https://www.ti.com/lit/ds/symlink/lm393.pdf)
- [LMVLM2903 dual low-voltage comparator](https://www.ti.com/lit/ds/symlink/lmv331-n.pdf)
- [TS3021 single high-speed rail-to-rail low-voltage comparator](https://www.mouser.com/datasheet/2/389/cd00118313-1796660.pdf)

# Regulators & refereces

- [1117 adjustable & fixed LDO regulator](https://www.ti.com/lit/ds/symlink/tlv1117.pdf)
- [μA78xx fixed voltage regulator](https://www.ti.com/lit/ds/symlink/ua78.pdf)
- [LM317 adjustable voltage regulator](https://www.ti.com/lit/ds/symlink/lm317.pdf)
- [TL431 adjustable voltage reference](https://www.ti.com/lit/ds/symlink/tl431.pdf)
- [LM4040/LM4041 adjustable voltage reference](https://ww1.microchip.com/downloads/en/DeviceDoc/LM4040-41-Precision-Micropower-Shunt-Voltage-Reference-DS20005757B.pdf)
- [REF01 precision voltage reference](https://www.analog.com/media/en/technical-documentation/data-sheets/REF01_02_03.pdf)

# Timers

- [555](https://www.ti.com/product/NE555)
- [LTC699x "TimerBlox"](https://www.analog.com/en/parametricsearch/11410#/)

# Connectors

- DSUB
- Molex Mini-fit
- Molex Micro-fit
- ...

# Switches & buttons

- [Omron B3F](https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3f.pdf)

# Other

- [CD4051/CD4052/CD4053 Analog Multiplexer Switch](https://www.ti.com/lit/ds/symlink/cd4051b.pdf)
