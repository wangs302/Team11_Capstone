import cv2 
import numpy as np
## https://stackoverflow.com/questions/66269063/extract-circles-from-one-image-after-have-apply-the-circular-hough-transform 

file = "patient1/photos/frame_272.jpg"

image = cv2.imread(file)

# Convert to grayscale
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

circles = cv2.HoughCircles(gray,
                           cv2.HOUGH_GRADIENT,
                           15,
                           100,
                           minRadius=300,
                           maxRadius=350
                           )

# Here are your circles:
circles = np.uint16(np.around(circles))

# Get input size:
dimensions = image.shape

# height, width
height = image.shape[0]
width = image.shape[1]

# Prepare a list to store each ROI:
lemonROIs = []


for i in circles[0, :]:

    # Prepare a black canvas:
    canvas = np.zeros((height, width))

    # Draw the outer circle:
    color = (255, 255, 255)
    thickness = -1
    centerX = i[0]
    centerY = i[1]
    radius = i[2]
    cv2.circle(canvas, (centerX, centerY), radius, color, thickness)

    # Create a copy of the input and mask input:
    imageCopy = image.copy()
    imageCopy[canvas == 0] = (0, 0, 0)

    # Crop the roi:
    x = centerX - radius
    y = centerY - radius
    h = 2 * radius
    w = 2 * radius

    croppedImg = imageCopy[y:y + h, x:x + w]
    cv2.imwrite(('circles/c_'+str(i)+'.jpg'),croppedImg)
    cv2.imshow('circle', croppedImg)
    

    keyboard = cv2.waitKey(30)
    if keyboard == 'q' or keyboard == 27:
        cv2.destroyAllWindows()
    # Store the ROI:
    lemonROIs.append(croppedImg)
