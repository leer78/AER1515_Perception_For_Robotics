# AER1515 Perception for Robotics — Repository Instructions

This repo tracks coursework for AER1515 (Perception for Robotics). Currently
it contains **Assignment 1**: a CNN-based animal face classification task.

## Layout

- `A1/AER1515_Assignment1_Handout-1.pdf` — official assignment handout.
  - `A1/AER1515_Assignment1_Handout-1/AER1515_Assignment1_Handout-1.md` —
    converted Markdown version (read this instead of the PDF to save tokens).
- `A1/AER1515_Assignment1_starter_code/AER1515_Assignment1_starter_code/` —
  starter code provided by the course:
  - `train.py` — training loop; contains `TODO` blocks for Q1.3 (multi-class),
    Q3.1 (validation loop + best-model checkpointing + loss plot), Q4.1
    (optimizer swap).
  - `test.py` — evaluation script; has a matching `N_CLASSES` `TODO` for Q1.3.
  - `Animal_Classification_Network.py` — `CNN` class (4 conv + 3 maxpool + 2
    FC layers); `TODO`s for Q2.1 (batch norm) and Q2.2 (dropout).
  - `animal_face_dataset.py` — `AnimalDataset`; `TODO` for Q3.2 (data
    augmentation in `transform_train`, must still output 150x150).
  - `AnimalFace/` — dataset (20 classes: Cat, Dog, Bear, Chicken, Cow, Deer,
    Duck, Eagle, Elephant, Human, Lion, Monkey, Mouse, Panda, Pigeon, Pig,
    Rabbit, Sheep, Tiger, Wolf), split into `train/` and `test/` folders
    named `<Class>Head/`. 2313 train images, 100 test images. Large binary
    image folder — do not read/list exhaustively; treat as data, not code.
  - `readme.txt` — Python 3.11 + PyTorch install instructions.
  - Blocks marked `!!! DO NOT MAKE ANY CHANGES !!!` in `train.py`/`test.py`
    must be left untouched (label maps, seeding, dataloader construction,
    test loop structure).
- `A1/lecture_slides/` — course slides, converted to Markdown in matching
  subfolders (prefer the `.md` files over the PDFs when referencing lecture
  content):
  - `AER1515-1-Introduction`
  - `AER1515-2-Probability 2025`
  - `AER1515-3-Machine Learning and Neural Networks`
  - `AER1515-3-Optimization 2025 (1)`
  - **Note:** the Sensors slide deck (`AER1515-5-Sensors 2025.pdf`) has
    **not** been covered in lectures yet — do not assume familiarity with
    its content or rely on it when explaining concepts for Assignment 1.

## Assignment 1 scope (from handout)

1. Extend binary (Cat/Dog) classification to full 20-class classification.
2. Add batch normalization, then dropout, to the default CNN.
3. Add a validation loop, save the best (lowest validation-loss) model, plot
   train+val loss, and add data augmentation.
4. Tune optimizer, learning rate, and batch size.

Deliverable is a single typed PDF report (not code submission) with loss
plots, accuracy numbers, and requested code snippets (`__init__`/`forward`,
`validate()`, `plot_losses()`, relevant `main()` section, `transform_train`).

## Working conventions

- When referencing PDFs (handout or slides), read the converted `.md` files
  under their matching subfolders instead of the PDF directly, to save
  tokens. Re-convert with the `convert-pdf-to-md` skill only if a source PDF
  changes.
- Only modify code inside marked `TODO` sections in the starter code unless
  the user explicitly asks for changes elsewhere.
- Do not commit large trained model checkpoints (`model.pt`) or the
  `AnimalFace` dataset if regenerating `.gitignore`.
