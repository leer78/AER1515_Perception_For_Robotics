"""
Combines the training-loss curves from separate train.py runs (each run using
a different BN_MODE) into a single comparison plot.

Usage:
    1. In train.py, set BN_MODE = "post_conv", then run `python train.py`.
       This saves train_losses_post_conv.npy.
    2. Repeat with BN_MODE = "post_relu" and BN_MODE = "post_pool".
    3. Run `python compare_bn_placement.py` to plot all three on one graph.
"""
import matplotlib.pyplot as plt
import numpy as np

MODES = ["post_conv", "post_relu", "post_pool"]
COLORS = {"post_conv": "blue", "post_relu": "green", "post_pool": "red"}
LABELS = {
    "post_conv": "BN after Conv (before ReLU)",
    "post_relu": "BN after ReLU",
    "post_pool": "BN after Pool",
}


def main():
    plt.subplots(figsize=(6, 4))
    for mode in MODES:
        filename = f"train_losses_{mode}.npy"
        try:
            losses = np.load(filename)
        except FileNotFoundError:
            print(f"Skipping {mode}: {filename} not found (run train.py with BN_MODE='{mode}' first)")
            continue
        epochs = range(1, len(losses) + 1)
        plt.plot(epochs, losses, color=COLORS[mode], label=LABELS[mode])

    plt.legend()
    plt.xlabel("Number of Epochs")
    plt.ylabel("Training Loss")
    plt.title("Training Loss vs. Batch Norm Placement")
    plt.tight_layout()
    plt.savefig("bn_placement_comparison.png")
    print("Saved bn_placement_comparison.png")
    plt.show()


if __name__ == "__main__":
    main()
