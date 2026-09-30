#set page(paper: "us-letter", margin: 0.75in)
#set text(size: 12pt)
#set heading(numbering: none)
#show figure.caption: set text(size: 9.5pt)

#let diffline(sign, content) = {
  let color = if sign == "-" { red } else if sign == "+" { green.darken(20%) } else { black }
  block(above: 0pt, below: 0pt)[
    #text(fill: color, font: "Courier New", size: 7pt)[#sign #content]
  ]
}

#align(left)[
  Student Number: 1007072604 \
  Ryan Lee, leerya25\
  #datetime.today().display("[month repr:long] [day], [year]")
]

#align(center)[
  #text(size: 13pt, weight: "bold")[Assignment 1]
]

= Part 1

*Q1:* In Figure 1. model is trained, and I chose to use 30 epochs for this. As training iterations progressed, training loss decreased. In Figure 2. I ran the test.py script to test our trained model on the given test data set.

#grid(
  columns: (35%, 35%, 1fr),
  gutter: 12pt,
  align: (center, center, left + horizon),
  figure(
    image("part1_1_1.png", width: 100%),
    caption: [Binary (Cat/Dog) training loss.],
  ),
  figure(
    image("part1_2_1.png", width: 100%),
    caption: [Training accuracy.],
  ),
  block(
    inset: (left: 1em),
    text(font: "Courier New", size: 11pt)[
      Number of test samples: 10 \
      Test accuracy: 80.0%
    ]
  )
)

*Q2:* Below are the results of converting our classifying model from to multi class. This was accomplished by changing the N_CLASSES parameter to 20, from 2. Observed is that training loss still decreses, although but the overall loss is greater due to the increased complexity of the classification task.

#grid(
  columns: (35%, 35%, 1fr),
  gutter: 12pt,
  align: (center, center, left + horizon),
  figure(
    image("part1_3_1.png", width: 100%),
    caption: [Multi-class (20) training loss.],
  ),
  figure(
    image("part1_3_2.png", width: 100%),
    caption: [Multi-class (20) training accuracy.],
  ),
  block(
    inset: (left: 1em),
    text(font: "Courier New", size: 11pt)[
      Number of test samples: 100 \
      Test accuracy: 65.0%
    ]
  )
)


= Part 2
*Q1:* in this, I modified the placement of Batch Normalization layers. I trained the model 3 seperate times to observe its impact. We found that after Convolutional Layer directly is more better in terms of test accuracy, but training loss tends to be higher. This is likely because adding BN after ReLU/Pooling loses data, so the normalized mean and std are less representative of the input distribution, and the alternatives fit to data earlier (and perhaps, overfit).

#grid(
  columns: (40%, 1fr),
  gutter: 16pt,
  align: (center, left + horizon),
  figure(
    image("part2_1_1.png", width: 100%),
    caption: [Training loss vs. epoch for each Batch Normalization placement.],
  ),
  block(
    inset: (left: 1.5em),
    text(font: "Courier New", size: 11pt)[
      Run 1 Batch Normalization (After Convolution): Test accuracy: 77.0% \
      Run 2 Batch Normalization (After ReLU): Test accuracy: 58.0% \
      Run 3 Batch Normalization (After Pooling): Test accuracy: 28.0%
    ]
  )
)

*Q2:* Likewise, I experimented with 4 different dropout values (10%, 25%, 50%, 75%) with BN after Conv. I found it interesting that 10% dropout converged in training the earliest, yet still had a lower test accuracy compared to the BN only baseline from Q1.

#grid(
  columns: (40%, 1fr),
  gutter: 16pt,
  align: (center, left + horizon),
  figure(
    image("part2_2_1.png", width: 90%),
    caption: [Training loss vs. epoch for each dropout rate.],
  ),  block(
    inset: (left: 1.5em),
    text(font: "Courier New", size: 11pt)[
      Run 1 (10% dropout, per layer): Test accuracy: 71.0% \
      Run 2 (25% dropout, per layer): Test accuracy: 72.0% \
      Run 3 (50% dropout, per layer): Test accuracy: 56.0% \
      Run 4 (75% dropout, per layer): Test accuracy: 12.0%
    ]
  )
)

#pagebreak()
Q3: Code Changes for Batch Normalization and Dropout

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  align: (left + top, left + top, left + top),
  block[
    #text(size: 8pt, weight: "bold")[`__init__`]
    #v(2pt)
    #diffline(" ", `# TODO (Q2.1): Add BN layers`)
    #diffline("+", `self.bn2 = nn.BatchNorm2d(64)`)
    #diffline("+", `self.bn3 = nn.BatchNorm2d(128)`)
    #diffline("+", `self.bn4 = nn.BatchNorm2d(256)`)
    #diffline(" ", `# TODO (Q2.2): Add dropout`)
    #diffline("+", `self.dropout2d = nn.Dropout2d(p=0.1)`)
    #diffline("+", `self.dropout_fc = nn.Dropout(p=0.1)`)
  ],
  block[
    #text(size: 8pt, weight: "bold")[`forward` (part 1)]
    #v(2pt)
    #diffline(" ", `def forward(self, x):`)
    #diffline(" ", `x = F.relu(self.conv1(x))`)
    #diffline("-", `x = F.relu(self.conv2(x))`)
    #diffline("-", `x = self.maxpool(x)`)
    #diffline("-", `x = F.relu(self.conv3(x))`)
    #diffline("-", `x = self.maxpool(x)`)
    #diffline("-", `x = F.relu(self.conv4(x))`)
    #diffline("-", `x = self.maxpool(x)`)
    #diffline("+", `x = F.relu(self.bn2(self.conv2(x)))`)
    #diffline("+", `x = self.dropout2d(self.maxpool(x))`)
  ],
  block[
    #text(size: 8pt, weight: "bold")[`forward` (part 2)]
    #v(2pt)
    #diffline("+", `x = F.relu(self.bn3(self.conv3(x)))`)
    #diffline("+", `x = self.dropout2d(self.maxpool(x))`)
    #diffline("+", `x = F.relu(self.bn4(self.conv4(x)))`)
    #diffline("+", `x = self.dropout2d(self.maxpool(x))`)
    #diffline(" ", `x = x.view(-1, 256 * 2 * 2)`)
    #diffline(" ", `x = self.fc1(x)`)
    #diffline("+", `x = self.dropout_fc(x)`)
    #diffline(" ", `x = self.fc2(x)`)
    #diffline(" ", `return x`)
  ]
)

= Part 3

*Q1:* Here, the workflow was to iterate through 30 epochs. For each epoch, we train the model using 80% of the given training data, which involves the same steps as in Part 2. However, now, we also do a validation forward pass using the saved 20% training data. This is on top of the training we just ran for this epoch, and this validation simply evaluates the performance and does not tune anything. 

For each measured validation loss, we save its value. If lower than the previous, we update the best model checkpoint and save it. 

From our results, we can see that training and validation loss diverge at about epoch 4/5. Beyond this, the training model loss decreases further, while the validation loss decreases marignally, and appears to reach an asymptote at Loss ~0.7. According to the saved results, the lowest validation loss occurs at epoch 23, so we saved this model. 

By comparing the test accuracy of our best saved model (77.0%) with the reference model from Part 2 (71.0%), we can see that adding validation 'checkpoints' can possibly help to prevent our model from becoming overfitted to the training data, by saving this trained state early. 

As described in the lab, its possible that this validation state checkpoint does not result in an improvement over the final epoch model. Some explainations for this may include the training data itself.
- For example, if the training set is large enough and diverse enough, the model weights may still be tuned by our Nth epoch (in this case, 30). If this is the case, then its possible that the final epoch model could perform just as well and does benefit with the additional training. The contrary would be a small training set, where the model eventually overfits and tunes weights to a specific data set, and optimization doesn't generalize well to unseen data (eg. validation loss doesn't decrease since model optimization doesn't benefit new different data).
- Another possible explaination simply has to do with training parameters itself. 

#grid(
  columns: (40%, 1fr),
  gutter: 16pt,
  align: (center, left + horizon),
  figure(
    image("part3_1_1.png", width: 100%),
    caption: [Training loss vs. validation loss per epoch.],
  ),
  block(
    inset: (left: 1.5em),
    text(font: "Courier New", size: 11pt)[
      Saved model: epoch 23\
      Validation loss: 0.6911 (lowest) \
      Test accuracy: 77.0% \
      \
      Reference (Part 2, no validation set, last epoch): \
      Test accuracy: 71.0%
    ]
  )
)

*Q2:* In this section, I actually experiment with 2 data augmentation techniques during training, in a theorized 'good' and 'bad' scenario. The 'good' being horizontal flip transforms.RandomHorizontalFlip(p=0.5), and a rotation of 15 degrees transforms.RandomRotation(degrees=15), since these would be realistic alterations of normal animal faces. For example, photos taken from different angles and perspectives. 

Logically good data augmentation: 
The results compare to the Part 3 Q1 baseline, where its validation loss was 0.6911 for epoch 23, with a test accuracy of 77%. So our augments were just below at 76%. This may be explained by the graph, where we can see that this model's validation loss just about converging, and slightly decreasing until its last training epoch until 0.6025. This may suggest that the model is still over fitting and has not fully converged like how we saw earlier. Since our model was trained for the full 30, we can actually compare this to our Part 2 Q2 results with those settings (10% dropout + BN after Conv Layer + 30 epochs), had a test accuracy of 71%, indicating that our augmentations led to an improvement. 

#grid(
  columns: (40%, 1fr),
  gutter: 16pt,
  align: (center, left + horizon),
  figure(
    image("part3_2_1.png", width: 100%),
    caption: [Training loss vs. validation loss per epoch. Run 1, good data augmentation scenario.],
  ),
  block(
    inset: (left: 1.5em),
    text(font: "Courier New", size: 11pt)[
      Saved model: epoch 30\
      Validation loss: 0.6025 (lowest) \
      Test accuracy: 76.0% \
    ]
  )
)

Logically bad data augmentation: 
In this, we notice that training and validation losses are significantly higher than the reference or 'good' augmentation scenario. These augments were verticalflip transformations, transforms.RandomVerticalFlip(p=0.5), and sharper rotations of transforms.RandomRotation(degrees=85) which could be argued to be noisy training data. The figure shows that as epochs progerss, there is still learning being done by the model and neither has converged yet by epoch 30. These augments may require the model to train for more epochs to fully converge, given the larger variety in data. Again, given that this model went until epoch 27, we see it performed significantly worse thatn the reference model in Part 2 Q2. 

#grid(
  columns: (40%, 1fr),
  gutter: 16pt,
  align: (center, left + horizon),
  figure(
    image("part3_2_2.png", width: 100%),
    caption: [Training loss vs. validation loss per epoch. Run 2, bad data augmentation scenario.],
  ),
  block(
    inset: (left: 1.5em),
    text(font: "Courier New", size: 11pt)[
      Saved model: epoch 27\
      Validation loss: 1.385 (lowest) \
      Test accuracy: 60.0% \
    ]
  )
)

Overall, given this experiment in Part 3 Q2, it is evident that data augmentation choices can make a big impact on how the model behaves. More subtle and realistic alterations means the model can generalize better while still training and converging similarly to the reference scenario as seen by our 'good' test. Likewise, adding these augmentations can help to reduce overfitting to the reference model. However, adding unnecessary and unrealistic augmentations can hinder the model's training and performance by making it more difficult to learn useful features and patterns. 


*Q3:* Code Changes for Validation Loop and Best-Model Checkpointing

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  align: (left + top, left + top, left + top),
  block[
    #text(size: 8pt, weight: "bold")[`validate`]
    #v(2pt)
    #diffline(" ", `def validate(model, loader, criterion,`)
    #diffline(" ", `             device):`)
    #diffline("+", `model.eval()`)
    #diffline("+", `total_loss = 0.0`)
    #diffline("+", `with torch.no_grad():`)
    #diffline("+", `  for data_, target_ in loader:`)
    #diffline("+", `    data_ = data_.to(device)`)
    #diffline("+", `    target_ = target_.to(device)`)
    #diffline("+", `    outputs = model(data_)`)
    #diffline("+", `    loss = criterion(outputs,`)
    #diffline("+", `                      target_)`)
    #diffline("+", `    total_loss += loss.item()`)
    #diffline("+", `return total_loss / len(loader)`)
  ],
  block[
    #text(size: 8pt, weight: "bold")[`plot_losses`]
    #v(2pt)
    #diffline(" ", `def plot_losses(train_losses,`)
    #diffline(" ", `                val_losses=None):`)
    #diffline(" ", `epochs = range(1, len(train_losses)+1)`)
    #diffline(" ", `plt.subplots(figsize=(6, 4))`)
    #diffline(" ", `plt.plot(epochs, train_losses,`)
    #diffline(" ", `         color="blue", ...)`)
    #diffline("+", `if val_losses:`)
    #diffline("+", `  plt.plot(epochs, val_losses,`)
    #diffline("+", `           color="orange", ...)`)
    #diffline(" ", `plt.legend()`)
    #diffline(" ", `plt.xlabel("Number of Epochs")`)
    #diffline(" ", `plt.ylabel("Loss")`)
    #diffline(" ", `plt.show()`)
  ],
  block[
    #text(size: 8pt, weight: "bold")[`main` (training loop)]
    #v(2pt)
    #diffline(" ", `train_losses = []`)
    #diffline(" ", `val_losses = []`)
    #diffline("+", `best_loss = float("inf")`)
    #diffline(" ", `for epoch in range(1, EPOCH_NUMBER+1):`)
    #diffline(" ", `  train_loss = train_one_epoch(...)`)
    #diffline("+", `  val_loss = validate(...)`)
    #diffline(" ", `  train_losses.append(train_loss)`)
    #diffline("+", `  val_losses.append(val_loss)`)
    #diffline("+", `  if val_loss < best_loss:`)
    #diffline("+", `    best_loss = val_loss`)
    #diffline("+", `    torch.save(model.state_dict(),`)
    #diffline("+", `               "model.pt")`)
    #diffline("-", `torch.save(model.state_dict(),`)
    #diffline("-", `           "model.pt")`)
  ]
)




