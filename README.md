# Computational Photography
This course explores computational image manipulaiton methods using matlab. It introduced me to the very interesting niche of media processing and was a fun and enjoyable learning experience.  

This repository consists of my submissions for the homework assignments outlined here: http://pages.cs.wisc.edu/~dyer/cs534/hw-toc.html. Homework number one is not included here because no code is produced to complete it.

1. Homework 2: Image Processing in MATLAB
     * Problem 1: Histogram Equalization
     * Problem 2: Demosaicing
     * Problem 3: Color Transfer
  
2. Homework 3: Image Resizing using Seam Carving
3. Homework 4: Making Panoramas





# Homework 4: Making Paronamas
Here a photo panorama stitcher is implemented that takes take four or more photographs and creates a panoramic image by computing homographies, warping, resampling, and blending the photos into a seamless output image. An open source library caled VLFeat is used to detect feature points and find their correspondences in overlapping pairs of images.

### Results
#### Input Images: 1.jpg, 2.jpg, 3.jpg, 4.jpg
![](HW4/skeleton/input_images/1.jpg)
![](HW4/skeleton/input_images/2.jpg)
![](HW4/skeleton/input_images/3.jpg) 
![](HW4/skeleton/input_images/4.jpg)
#### Output Image: panorama.jpg
![](HW4/skeleton/output_images/panorama.jpg)


# Reference:
Although the solutions are mine please keep in mind that the course itself (http://pages.cs.wisc.edu/~dyer/cs534/index.html) does not belong to me. Also some of the steps described here are paraphrased from the homework assignments themselves which also do not belong to me.
