import cv2 
import numpy as np
import os
'''
Adapted from: https://stackoverflow.com/questions/66269063/extract-circles-from-one-image-after-have-apply-the-circular-hough-transform 
and https://stackoverflow.com/questions/70659992/how-to-improve-accuracy-of-cv2s-houghcircles 

Uses the cv2 function HoughCircles to pick out circular objects in an image. Meant to remove the background from the tunnel to extract just the image of the eye and put it on a black background.

'''

def frame_num(file):
    directory = file.split('/')
    img = str(directory[-1])
    frame = str(img.split('.')[0])

    return frame

def remove_bgd(file,photo_path):
    image = cv2.imread(file)

    try:
        os.makedirs(photo_path+'processed/')
    except FileExistsError:
        # directory already exists
        pass

    if image is not None:
        # convert to grayscale
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

        hist = cv2.equalizeHist(gray)

        blur = cv2.GaussianBlur(hist, (15,15), cv2.BORDER_DEFAULT)
        h,w = blur.shape[:2]

        minR = round(w/5)
        maxR = round(w/4)
        minDis = round(w/7)

        circles = cv2.HoughCircles(blur,
                                cv2.HOUGH_GRADIENT,
                                1,
                                minDis,
                                param1=1,
                                param2=50,
                                minRadius=minR,
                                maxRadius=maxR
                                )

        circles = np.uint16(np.around(circles))

        # input size
        dimensions = image.shape

        # height, width
        height = dimensions[0]
        width = dimensions[1]

        for i in circles[0, :]:

            # start with a black canvas:
            canvas = np.zeros((height, width))

            # Draw the outer circle:
            color = (255, 255, 255)
            thickness = -1
            centerX = int(i[0])
            centerY = int(i[1])
            radius = int(i[2])
            cv2.circle(canvas, (centerX, centerY), radius, color, thickness)

            # create a copy of the input and mask input:
            imageCopy = image.copy()
            imageCopy[canvas == 0] = (0, 0, 0)

            # crop the roi:
            x = centerX - radius
            y = centerY - radius
            h1 = 2 * radius
            w1 = 2 * radius

            croppedImg = imageCopy[y:y + h1, x:x + w1]
            if croppedImg.size==0:
                print("empty image")
            else:
                f = frame_num(file)
                cv2.imwrite((photo_path+'processed/'+f+'_'+str(i)+'.jpg'),croppedImg)

            
            cv2.imshow('circle', croppedImg)
            keyboard = cv2.waitKey(30)
            if keyboard == 'q' or keyboard == 27:
                cv2.destroyAllWindows()
            
    else:
        print("empty image")
        

remove_bgd('patient1/photos/frame_15.jpg','patient1/photos/')
#remove_bgd('patient1/photos/frame_15.jpg')
