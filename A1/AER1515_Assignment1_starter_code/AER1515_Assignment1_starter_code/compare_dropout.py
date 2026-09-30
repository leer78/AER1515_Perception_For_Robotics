"""
Combines the training-loss curves from separate train.py runs (each run using
a different DROPOUT_P) into a single comparison plot.

Usage:
    1. In train.py, set DROPOUT_P = 0.25, then run `python train.py`.
       This saves train_losses_dropout_0.25.npy.
    2. Repeat with DROPOUT_P = 0.5 and DROPOUT_P = 0.75.
    3. Run `python compare_dropout.py` to plot all three on one graph.
"""
import matplotlib.pyplot as plt
import numpy as np

DROPOUT_RATES = [0.1, 0.25, 0.5, 0.75]
COLORS = {0.1: "purple", 0.25: "blue", 0.5: "green", 0.75: "red"}


def main():
    plt.subplots(figsize=(6, 4))
    for p in DROPOUT_RATES:
        filename = f"train_losses_dropout_{p}.npy"
        try:
            losses = np.load(filename)
        except FileNotFoundError:
            print(f"Skipping p={p}: {filename} not found (run train.py with DROPOUT_P={p} first)")
            continue
        epochs = range(1, len(losses) + 1)
        plt.plot(epochs, losses, color=COLORS[p], label=f"Dropout p={p}")

    plt.legend()
    plt.xlabel("Number of Epochs")
    plt.ylabel("Training Loss")
    plt.title("Training Loss vs. Dropout Rate")
    plt.tight_layout()
    plt.savefig("dropout_comparison.png")
    print("Saved dropout_comparison.png")
    plt.show()


if __name__ == "__main__":
    main()
