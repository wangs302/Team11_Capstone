import cv2 

cap = cv2.VideoCapture("fireworks.mp4")

if cap.isOpened():
    cap.set(cv2.CAP_PROP_POS_FRAMES, 100) # like setting cursor to that frame
    ret, frame = cap.read() #grabs video frame

    if ret:
        cv2.imwrite("test.jpg",frame) # save image


cap.release()