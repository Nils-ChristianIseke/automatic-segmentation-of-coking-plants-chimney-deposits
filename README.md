# Automatic Segmentation of Coking plants chimney-deposits 

This project was done during 24 hours at the hackathon #Hack4Pott.

In coking plants, chimneys get constricted by deposits, which hinders their performance. Thus they need to be maintained which is a time-consuming process.
The detection of constrictions is helpful to do the maintainence on the right time. In this project a Convolutional Neural Network was trained to segment those constrictions, enabling the automatic planning for maintenance of those chimneys. 

Be aware that the images in segmentation_results are not showing much with a normal image viewer, cause they only contain 1 and 2 as values. Look one examples below to get a glimpse of the performance. This was achieved by using only 23 labeled images as input.
<div style="display: flex; justify-content: space-between; align-items: flex-start;">
  <div style="flex: 1; max-width: 49%; margin-left: 10px;">
    <img src="Segmentation.png" alt="Segmentation of the constriction and the pipe in the image" style="width: 40%;"/>
    <p style="text-align: center;">Segmentation of the constriction and the pipe.</p>
  </div>
</div>
