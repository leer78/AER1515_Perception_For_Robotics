import os
import random
from glob import glob

import matplotlib.pyplot as plt
import numpy as np
import torch
import torch.backends.cudnn as cudnn
import torch.nn as nn
import torch.optim as optim
from sklearn.model_selection import train_test_split
from torch.utils.data.sampler import SubsetRandomSampler

from animal_face_dataset import AnimalDataset
from Animal_Classification_Network import CNN

# !!! DO NOT MAKE ANY CHANGES IN THIS BLOCK !!!
###############################################################################
random.seed(1000)
np.random.seed(1000)
torch.manual_seed(1000)
cudnn.deterministic = True
LABEL_MAP = {0: "Cat", 1: "Dog", 2: "Bear", 3: "Chicken", 4: "Cow", 5: "Deer", 6: "Duck", 7: "Eagle",
             8: "Elephant", 9: "Human", 10: "Lion", 11: "Monkey", 12: "Mouse", 13: "Panda", 14: "Pigeon",
             15: "Pig", 16: "Rabbit", 17: "Sheep", 18: "Tiger", 19: "Wolf"}
TRAIN_PATH = "AnimalFace/train/"
IMAGE_SIZE = (150, 150)


# TODO (Q1.3): Extend the binary classification to multi-class classification
# (remember to also change N_CLASSES in test.py)
###############################################################################
#N_CLASSES = 2           # num of classes
N_CLASSES = 20 # num of classes
###############################################################################


# TODO (Q3 and Q4): Hyper-parameters for network training
###############################################################################
BATCH_SIZE = 32         # training batch size
EPOCH_NUMBER = 30       # num of epochs
VALIDATION_PER = 0.2    # validation percentage
LEARNING_RATE = 1e-4    # learning rate
###############################################################################

def build_dataloaders(n_classes, batch_size, val_per):
    # DO NOT MAKE ANY CHANGES IN THIS BLOCK
    # Split the full train dataset into "Train Set" and "Validation Set"
    paths = []
    labels = []
    for i in range(n_classes):
        folder = LABEL_MAP[i] + 'Head'
        for each_file in glob(os.path.join(TRAIN_PATH, folder, "*")):
            paths.append(each_file)
            labels.append(i)
    train_dataset = AnimalDataset(paths, labels, IMAGE_SIZE, split="train")
    val_dataset = AnimalDataset(paths, labels, IMAGE_SIZE)

    dataset_indices = list(range(len(train_dataset)))
    train_indices, val_indices = train_test_split(dataset_indices, test_size=val_per, random_state=42)
    print("Number of train samples: ", len(train_indices))
    print("Number of validation samples: ", len(val_indices))

    train_loader = torch.utils.data.DataLoader(train_dataset, batch_size=batch_size,
                                               sampler=SubsetRandomSampler(train_indices))
    val_loader = torch.utils.data.DataLoader(val_dataset, batch_size=batch_size,
                                             sampler=SubsetRandomSampler(val_indices))
    return train_loader, val_loader


def train_one_epoch(model, loader, criterion, optimizer, device):
    """
    Returns:
        The average training loss over all batches of this epoch.
    """
    model.train()
    epoch_loss = 0.0
    for data_, target_ in loader:
        # Load data and label
        data_ = data_.to(device)
        target_ = target_.to(device)

        # Clean up the gradients
        optimizer.zero_grad()

        # Get output from our CNN model and compute the loss
        outputs = model(data_)
        loss = criterion(outputs, target_)

        # Backpropagation and optimizing our CNN model
        loss.backward()
        optimizer.step()

        epoch_loss += loss.item()
    # Compute Loss
    training_loss = epoch_loss / len(loader)
    return training_loss


def validate(model, loader, criterion, device):
    model.eval()
    total_loss = 0.0
    with torch.no_grad():
        for data_, target_ in loader:
            data_ = data_.to(device)
            target_ = target_.to(device)
            outputs = model(data_)
            loss = criterion(outputs, target_)
            total_loss += loss.item()
    return total_loss / len(loader)


def plot_losses(train_losses, val_losses=None):
    epochs = range(1, len(train_losses) + 1)
    plt.subplots(figsize=(6, 4))
    plt.plot(epochs, train_losses, color="blue", label="Training Set")
    if val_losses:
        plt.plot(epochs, val_losses, color="orange", label="Validation Set")
    plt.legend()
    plt.xlabel("Number of Epochs")
    plt.ylabel("Loss")
    plt.show()


def main():
    train_loader, val_loader = build_dataloaders(N_CLASSES, BATCH_SIZE, VALIDATION_PER)


    # Set up device (gpu or cpu), load CNN model, define Loss function and Optimizer
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model = CNN(N_CLASSES).to(device)
    criterion = nn.CrossEntropyLoss()
    # TODO (Q4.1): Change to other optimizers
    optimizer = optim.RMSprop(model.parameters(), lr=LEARNING_RATE)

    # Training!!!
    train_losses = []
    val_losses = []
    best_loss = float("inf")
    for epoch in range(1, EPOCH_NUMBER + 1):
        train_loss = train_one_epoch(model, train_loader, criterion, optimizer, device)
        val_loss = validate(model, val_loader, criterion, device)
        train_losses.append(train_loss)
        val_losses.append(val_loss)
        print(f"Epoch {epoch}, Training Loss: {train_loss}, Validation Loss: {val_loss}")

        if val_loss < best_loss:
            best_loss = val_loss
            torch.save(model.state_dict(), "model.pt")

    np.save("train_losses.npy", np.array(train_losses))
    np.save("val_losses.npy", np.array(val_losses))

    plot_losses(train_losses, val_losses)


if __name__ == '__main__':
    main()
