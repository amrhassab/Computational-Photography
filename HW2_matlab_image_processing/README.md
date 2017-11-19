[Home Page](../README.md)
# Homework 2: Image Processing in MATLAB
## Problem 1: Histogram Equalization
Here we use image histograms to enhance their contrast. We create our histogram manipulation matlab function myhisteq.m by following these steps:
1. Converting the input color image from RGB to HSV color space (using rgb2hsv which creates a double image), 
2. Computing the histogram and cumulative histogram of the V (luminance) image only, 
3. Transforming the intensity values in V to occupy the full range 0..255 in a new image W so that the histogram of W is roughly flat.
4. Combining the original H and S channels with the W image to create a new color image, which is then converted to an RGB color output image. 

### Results
#### Input: p1-bridge.jpg
![](P1_histogram_equalization/P1-bridge.jpg)
#### Input: Bridge V Channel Histogram
![](P1_histogram_equalization/P1-bridge-Vhist.jpg)
#### Output: p1-bridge-out.jpg
![](P1_histogram_equalization/P1-bridge-out.jpg)
#### Output: Bridge V Channel Histogram
![](P1_histogram_equalization/P1-bridge-Whist.jpg)

#### Input: p1-snow.jpg
![](P1_histogram_equalization/P1-snow.jpg)
#### Input: Snow V Channel histogram
![](P1_histogram_equalization/P1-snow-Vhist.jpg)
#### Output: p1-snow-out.jpg
![](P1_histogram_equalization/P1-snow-out.jpg)
#### Output: Snow V Channel Histogram
![](P1_histogram_equalization/P1-snow-Whist.jpg)

## Problem 2: Demosaicing
For digital cameras that have only one image sensor **Demosiacing** using **Bayer Patterns** is needed to convert the raw image into a full color image with three channels. In the **mydemosiac.m** matlab function, filters in the form of matrices with wieghted values are used to complete the process. After the process is complete and error image is created by computing at each pixel the squared difference between the raw image and the demosaiced image for each color channel separately, then adding the three matrices together to obtain the error image.

### Results
#### Raw Input: P2-crayons-raw.jpg
![](P2_demosaicing/P2-crayons-raw.jpg)
#### Demosiac Output:p2-crayons-demosaic.jpg
![](P2_demosaicing/P2-crayons-demosaic.jpg)
#### Error Image:p2-crayons-error.jpg
![](P2_demosaicing/P2-crayons-error.jpg)

#### Raw Input: P2-union-raw.jpg
![](P2_demosaicing/P2-union-raw.jpg)
#### Demosiac Output:p2-union-demosaic.jpg
![](P2_demosaicing/P2-union-demosaic.jpg)
#### Error Image: p2-union-error.jpg
![](P2_demosaicing/P2-union-error.jpg)

## Problem 3: Color Transfer
This is one of my favorite functions, here we use the colors of one (the target image) image to modify that of another image (the source image). This was accomplished using the same method from [this](http://pages.cs.wisc.edu/~dyer/cs534/papers/color-transfer-cga2001.pdf) paper by Erik Reinhard, Michael Ashikhmin, Bruce Gooch, and Peter Shirley.

### Results
#### Source: mysource.jpg
![](P3_color_transfer/P3-mysource.jpg)
#### Target: mytarget.jpg
![](P3_color_transfer/P3-mytarget.jpg)
#### Output: myout.jpg
![](P3_color_transfer/P3-myout.jpg)
