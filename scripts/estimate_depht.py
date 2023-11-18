import cv2
import numpy as np
from PIL import Image

 # create 2 masks out of it
# Create masks for labels 1 and 2
with Image.open('/home/nils/Documents/Hack4Pott/nils1_2/segmentation/images_inlet_1/label_1_2_3/labels/snapshot_1_323_001.png' ) as img:
        # Convert the image to a NumPy array
        data = np.array(img)
mask_1 = (data == 1).astype(np.uint8) * 255  # White for label 1
mask_2 = (data == 2).astype(np.uint8) * 255  # White for label 2
mask_3 = (data == 3).astype(np.uint8) * 255  # White for label 2

ratio_free_space = np.round(np.count_nonzero(mask_3)/(np.count_nonzero(mask_1)+np.count_nonzero(mask_3)))


# Create black background images
black_background = np.zeros_like(data, dtype=np.uint8)

# Stack the masks on the black background to create the final images
outer_image = cv2.merge([black_background, mask_1, black_background])
inner_image = cv2.merge([black_background, black_background, mask_2])
free_space_image = cv2.merge([black_background, black_background, mask_3])

# Save the images
cv2.imwrite("outer.png", outer_image)
cv2.imwrite("inner.png", inner_image)
cv2.imwrite("free.png", free_space_image)

image = cv2.imread("outer.png", 0)
def get_circle_draw(image):
    # Threshold the image to get the shapes in binary
    _, thresh = cv2.threshold(image, 1, 255, cv2.THRESH_BINARY)
    # Find contours in the thresholded image
    contours, _ = cv2.findContours(thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

    # Assuming the largest contour in the image is the circle we are interested in
    largest_contour = max(contours, key=cv2.contourArea)

    # Assuming the largest contour in the image is the circle we are interested in
    smallest_contour = min(contours, key=cv2.contourArea)
    # Fit a circle to the largest contour and get the radius
    (x, y), radius = cv2.minEnclosingCircle(smallest_contour)
    print(image.shape)
    # Create an empty three-channel image with the same size as the binary image
    rgb_image = np.zeros((image.shape[0], image.shape[1], 3), dtype=np.uint8)
    # Set all three channels to the values of the binary image
    rgb_image[:, :, 0] = image
    rgb_image[:, :, 1] = image
    rgb_image[:, :, 2] = image
    print(x,y, radius)
    result = cv2.circle(rgb_image, (int(x), int(y)), int(radius), (0, 0, 255),5)

    return result, x, y, radius


image = cv2.imread("outer.png", 0)
result, x_1,y_1,radius_1 = get_circle_draw(image)
image = cv2.imread("inner.png", 0)
result, x_2,y_2,radius_2 = get_circle_draw(image)
image = cv2.imread("free.png", 0)
result, x_3,y_3,radius_3 = get_circle_draw(image)
# Create colored background images
colored_background = np.zeros((1536, 2048 , 3), dtype=np.uint8)

# Assign different colors for labels 1 and 2
print(mask_1.shape)
print(colored_background.shape)
colored_background[:, :, 0] = mask_1  # Blue channel for label 1
colored_background[:, :, 2] = mask_2  # Red channel for label 2
colored_background[:, :, 1] = mask_3  # Green channel for label 2

# Save the combined image
cv2.imwrite("combined.png", colored_background)
print(colored_background.shape)
colored_background = cv2.circle(colored_background, (int(x_1), int(y_1)), int(radius_1), (0, 255, 255),5)
colored_background = cv2.circle(colored_background, (int(x_2), int(y_2)), int(radius_2), (0, 255, 255),5)
colored_background = cv2.circle(colored_background, (int(x_3), int(y_3)), int(radius_3), (0, 255, 255),5)

cv2.imwrite("final.png", colored_background)
image = cv2.imread('final.png')
text = "Ratio:" +str (ratio_free_space)
# Specify the position of the text (bottom-left corner where the text starts)
position = (50, 50)

# Specify the font type
font = cv2.FONT_HERSHEY_SIMPLEX

# Specify font scale (font size)
font_scale = 3

# Specify font color in BGR
color = (255, 255, 255)  # White color

# Specify the line type
line_type = 2

# Use cv2.putText() method to add text to the image
# cv2.putText(image, text, position, font, font_scale, color, line_type)

# Save the resulting image
cv2.imwrite('image_with_text.png', image)