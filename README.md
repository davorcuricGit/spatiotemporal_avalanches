# Avalanche Analysis in Imaging Data (MATLAB)

This repository contains MATLAB code for detecting and analyzing **spatiotemporal clusters** ("avalanches") in 2D imaging data.  
It provides tools for loading imaging data, applying masks, building pixel adjacency networks, and extracting avalanche clusters.

---

## Getting Started

### Requirements
- MATLAB (R2021a or later recommended)  
- Image Processing Toolbox  

### Installation
Clone this repository:
```bash
git clone https://github.com/davorcuricGit/spatiotemporal_avalanches
cd spatiotemporal_avalanches
````

---

## Repository Structure

```
spatiotemporal_avalanches/
│
├── src/                 % main MATLAB cod
│   └── main.m           % main entry script
│
├── data/                % example datasets
│   ├── ImgF3_sample.mat
│   └── mask.mat
│
└── README.md            % this file
```

---

##  Usage

1. Open MATLAB and navigate to the `src/` folder.
2. Run the main script:

   ```matlab
   main
   ```
3. Example outputs include:

   * Extraction of avalanche clusters
   * Example plots of root density maps

---

## Notes

* This project is under active refactoring.
* Example data (`ImgF3_sample.mat`, `mask.mat`) are included for demonstration.

---

## License

This project is released under the [MIT License](LICENSE).
You are free to use, modify, and distribute the code with proper attribution.

```

---

```
