# Computational-Photography
This project is the reult of the class CS534 - Computational Photogrpahy I took at the University of Wisconsin - Madison. This was one of the more intresting classes I took while finishing my Electrical Engineering and Computer Science degrees and I thought to share some of the cool image manipulation functions we made. It was very intriguing to see math interact with images to produce surprising results. 

# Contents:
**If current UW students come across this, I can't stop you from cheating but I would highly suggest considering another career path if you really feel the need to cheat for this course. The homeworks may seem challenging at first but they pretty much tell you what to do step by step.**

This project consists of my submissions for the homework assignments outlined here: http://pages.cs.wisc.edu/~dyer/cs534/hw-toc.html. Homework number one is not included here because it is only for trying out software and no code was produced.

# Homework 2: Image Processing in MATLAB
 
## Problem 1: Histogram Equalization
Here we use image histograms to inhance thier contrast. We create our histogram manipulation matlab function myhisteq.m by following these steps:
1. Converting the input color image from RGB to HSV color space (using rgb2hsv which creates a double image), 
2. Computing the histogram and cumulative histogram of the V (luminance) image only, 
3. Transforming the intensity values in V to occupy the full range 0..255 in a new image W so that the histogram of W is roughly “flat”.
4. combining the original H and S channels with the W image to create a new color image, which is then converted to an RGB color output image. 

## Results:
### Image 1: p1-bridge.jpg
#### Input:
![GitHub Logo](/HW2_image_processing_in_matlab/P1_histogram_equalization/P1-bridge.jpg)
Format: ![Alt Text](url)
 
 
 - demosaicing
 - color transfer
 
HW3
 - seam carving
 
HW4
- Panorama Synthysis 

# Refrences:
Although the solutions are mine please keep in mind that the course itself (http://pages.cs.wisc.edu/~dyer/cs534/index.html) does not belong to me. Also some of the steps described here are paraphrased from the homework assignments themselves which also do not belong to me.
