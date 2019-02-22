# Seam-Carving
A program that given an image, it can resize it without distortion. 
<p align="center">
<img src="https://i.imgur.com/yHNKGMP.jpg" width="800" height="225" style="float: right;">
</p>


## Description
The project uses the [Seam carving](https://perso.crans.org/frenoy/matlab2012/seamcarving.pdf) algorithm for content-aware image resizing. The purpose of the algorithm is image retargeting, displaying the images without distorsion on different screen sizes.

## Running the project
The project unfortunately is written in roumanian but it is pretty easy to run and understand, I will walk you through it.

In the "cod" folder you will find the matlab scripts. The one that you neet to configure and run is "ruleazaProiect.m".

## Configuration
* on line 9 you need to write the path to the input image
```Matlab
img = imread('../data/eiffel.jpg');
```
* on line 13 choose the resize option:
  * "micsoreazaLatime" for smaller width
  * "micsoreazaInaltime" for smaller height
  * "maresteLatime" for larger width
  * "maresteInaltime" for larger height
  * "amplificaContinut" for amplification
  * "eliminaObiect" for object elimination
```Matlab
parametri.optiuneRedimensionare = 'amplificaContinut';
```

* on line 14 and 15 set the number of pixels to modify the width and height of the image
```Matlab
parametri.numarPixeliLatime = 100;
parametri.numarPixeliInaltime = 50;
```

* on line 16 set the scale factor for amplification
```Matlab
parametri.factorScalare = 1.25;
```

* on 17 and 18 set 1 if you want to visualize the minimum cost road that will be deleted at one step and the color of it
```Matlab
parametri.ploteazaDrum = 0;
parametri.culoareDrum = [255 0 0]';
```

* on 19 set the selection criteria of the minimum cost road:
  * "aleator" for random
  * "greedy" for a greedy method
  * "programareDinamica" for dynamic programming method
```Matlab
parametri.metodaSelectareDrum = 'programareDinamica';
```
The next lines are for visual comparison of different methods of resizeing.

## Presentation

<p align="center">
<img src="https://i.imgur.com/49mgFS2.jpg" width="400" height="300" style="float: right;">
<img src="https://i.imgur.com/tSsNc3h.jpg" width="400" height="200" style="float: right;">
<img src="https://i.imgur.com/imoPCtC.jpg" width="400" height="225" style="float: right;">
<img src="https://i.imgur.com/knlA1yT.jpg" width="400" height="225" style="float: right;">
<img src="https://i.imgur.com/dQXS2oO.jpg" width="400" height="280" style="float: right;">
<img src="https://i.imgur.com/0zFi7AT.jpg" width="400" height="280" style="float: right;">
</p>
