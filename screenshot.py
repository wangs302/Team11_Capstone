import cv2 
import os


def save_images(video_path,t_start,t_stop,photo_path):
    cap = cv2.VideoCapture(video_path)

    if cap.isOpened():
        # check if photo directory exists, and make it if it doesn't
        try:
            os.makedirs(photo_path)
        except FileExistsError:
            # directory already exists
            pass

        fps = cap.get(cv2.CAP_PROP_FPS) # get frame_rate

        f_start = round(t_start*fps)
        f_stop = round(t_stop*fps)

        for f in range(f_start,f_stop,1): # for every frame in that time period
            cap.set(cv2.CAP_PROP_POS_FRAMES, f) # like setting cursor to that frame
            ret, frame = cap.read() #grabs video frame
            
            if ret:
                pic = photo_path + "frame_{}.jpg".format(f) #photo name
                cv2.imwrite(pic,frame) # save image

    cap.release()


save_images("patient1/jan27.mp4",0.5,0.6,"patient1/photos/")




