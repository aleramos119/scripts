#!/usr/bin/env python3

#%%
import sys
import matplotlib.pyplot as plt
import numpy as np


#%%
# Check if the correct number of arguments is provided
if len(sys.argv) < 4:
    print("Usage: plot <file_name> <plot_type> <column_numbers>")
    sys.exit(1)

file_name = sys.argv[1]
plot_type = sys.argv[2]
columns = list(map(int, sys.argv[3:]))

#%%
# file_name="/home/aramos/Dokumente/Work/Simulation of Open Quantum Systems/tjm_noise_char/tests/yaqs_test/time.txt"
# plot_type="-o"
# columns=[0, 1, 2]


#%%

# Read the file into a DataFrame
try:
    data = np.genfromtxt(file_name)
except Exception as e:
    print(f"Error reading file: {e}")
    sys.exit(1)

# Check if the specified columns exist
for col in columns:
    if col >= data.shape[1]:
        print(f"Column {col} does not exist in the file.")
        sys.exit(1)

# Plot the specified columns
try:
    plt.plot(data[:, columns[0]], data[:, columns[1:]], plot_type)
    plt.title(f"{plot_type.capitalize()} Plot of Columns {columns}")
    plt.xlabel("Index")
    plt.ylabel("Values")
    plt.legend([f"Column {col}" for col in columns])
    plt.show()
except Exception as e:
    print(f"Error generating plot: {e}")
    sys.exit(1)

