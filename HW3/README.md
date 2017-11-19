# Homework 3: Image Resizing Using Seam Carving
In this assignment an algorithm for resizing an image with minimal noticeable distortion is implimented using seam carving:
The following steps were taken with following [this](http://pages.cs.wisc.edu/~dyer/cs534/papers/AvidanShamir2007-SeamCarving.pdf) paper by Shai Avidan & Ariel Shamir.
    1. Computing the Energey function (imenergy.m)
    2. Computing the optimal horisontal seam (horizontal_seam.m)
    3. Removing the Seam (remove_horizontal_seam.m)
    4. Resize (shrnk.m)

### Results
#### Input Image: union-terrrace.jpg
This is the target image we want to resize.

![](union-terrace.jpg)
#### Energy Function Output: 2a.jpg
The energy image shows when there is a large contrast from one area to the other (from dark to light or vise versa). For example, you can see that the energy image is very bright around the circumference of the yellow tables. This indicates a sharp change in intensity from the deck to the table. Our seems will most likely go around these areas because removing pixels there will generate visable artifacts in the resized image.

![](2a.jpg)
#### cumulative minimum energy array: 2b.jpg
Here we can see the progression from left to right of the cumulative energy. namely we start with low values (blue) and as we move to the right they gradually get higher (yellow/orange); in the last column the pixels with the lowest energy path leading to them will be bluish while those of which have a high energy path will appear orangish.

![](2b.jpg) 
#### 100 Columns Removed: 1a.jpg
Result of removing 100 columns from union-terrace.jpg

![](1a.jpg)
#### 100 Rows Removed: 1b.jpg
Result of removing 100 rows from union-terrace.jpg

![](1b.jpg)
#### 100 Columns and 100 Rows removed: 1c.jpg
Result of removing 100 columns and 100 rows from union-terrace.jpg

![](1c.jpg)
