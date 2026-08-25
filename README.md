# SkeletonOS

A lightweight, 16-bit x86 barebones operating system kernel engineered in x86 Assembly for QEMU.

---

## Prerequsites

To build and run SkeletonOS, you will need:
* **NASM** (Netwide Assembler) to compile the x86 assembly code into a bootable binary.
* **QEMU** (x86 system emulator) to run the operating system in a virtualized environment.

---

## Quick Start Guide

### 1. Install Dependencies

Select your operating system below to install **QEMU** and **NASM**:

#### Linux (Debian / Ubuntu / Mint)
```bash
sudo apt update
sudo apt install qemu-system-x86 nasm -y
