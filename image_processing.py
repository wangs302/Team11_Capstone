import cv2
import numpy as np
from matplotlib import pyplot as plt

image = cv2.imread('circles/test.jpg')
    
# Adjust brightness and contrast
alpha = 1.5  # Contrast control (1.0 means no change)
beta = 20    # Brightness control (0-100, with 0 being black)
adjusted_image = cv2.convertScaleAbs(image, alpha=alpha, beta=beta)
    
# Display the enhanced image
cv2.imshow('Enhanced Image', adjusted_image)
cv2.waitKey(0)
cv2.destroyAllWindows()

