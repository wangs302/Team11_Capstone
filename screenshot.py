import cv2 
import os


def save_images(video_path,photo_path):
    cap = cv2.VideoCapture(video_path)

    if cap.isOpened():
        # check if photo directory exists, and make it if it doesn't
        try:
            os.makedirs(photo_path+'raw/')
        except FileExistsError:
            # directory already exists
            pass
        
        fps = int(cap.get(cv2.CAP_PROP_FPS)) # get frame_rate
        n_frames = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
        t_start = 0
        t_stop = n_frames/fps # could also just use the number of frames so lines below are irrelavent but keeping modular if want to specify later by time

        f_start = round(t_start*fps)
        f_stop = round(t_stop*fps)

        for f in range(f_start,f_stop,round(fps/2)): 
            cap.set(cv2.CAP_PROP_POS_FRAMES, f) # like setting cursor to that frame
            ret, frame = cap.read() #grabs video frame
            
            if ret:
                pic = photo_path + "raw/frame_{}.jpg".format(f) #photo name
                cv2.imwrite(pic,frame) # save image

    cap.release()


save_images("patient1/mar4_cropped.mp4","patient1/photos/")




