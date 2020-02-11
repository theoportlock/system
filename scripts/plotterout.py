#!/usr/bin/env python

import sys
import glob
import pandas
import matplotlib.pyplot as plt

def parse_arguments():
    if len(sys.argv) == 1:
        print("not enough arguments")
    if "-a" in sys.argv:
        filenames = glob.glob("*gdp*.csv")
    else:
        filenames = sys.argv[1:]
    return filenames

def create_plot(filename):
    data = pandas.read_csv(filename).T
    ax = data.plot(title = filename)
    ax.set_xlabel("x axis")
    ax.set_ylabel("y axis")
    ax.set_xticks(range(len(data.index)))
    ax.set_xticklabels(data.index, rotation = 45)
    plt.show()

def create_plots(filenames):
    for filename in filenames:
        create_plot(filename)

def main():
    files_to_plot = parse_arguments()
    create_plots(files_to_plot)

if __name__ == "__main__":
    main()
