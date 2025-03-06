import cv2 
import numpy as np



capture = cv2.VideoCapture("patient1/mar4.mp4")

backSub = cv2.createBackgroundSubtractorKNN()

if not capture.isOpened():
    print('Unable to open: ')
    exit(0)
while True:
    ret, frame = capture.read()
    if frame is None:
        break

    fgMask = backSub.apply(frame)
    cv2.namedWindow('frame',cv2.WINDOW_NORMAL)
    cv2.imshow('frame', frame)

    cv2.namedWindow('FG Mask',cv2.WINDOW_NORMAL)
    cv2.imshow('FG Mask', fgMask)
    
    keyboard = cv2.waitKey(30)
    if keyboard == 'q' or keyboard == 27:
        break
