
import numpy as np
import cv2 #double import?
import pytesseract
from pytesseract import Output
import PT
# Pre-processing directives : grayscaling, removing noise (consider bilateral),
# thresholding (consider adaptive)
img0 = cv2.imread('test3.jpg')

def TextRecognition(img0):
    contour, img = PT.Perspective(img0)
    # img = cv2.imread('output4.jpg') # Insert image name
    new_image = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    new_image = cv2.medianBlur(new_image,5)
    new_image = cv2.threshold(new_image, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)[1]

    # Text analysis using pytesseract to create bounding boxes (consider ocrtesseract)
    vis = img.copy()
    custom_config = '--psm 6'
    d = pytesseract.image_to_data(new_image, output_type=Output.DICT, config = custom_config)

    # Bounding boxes coordinate list preparation; only those bounding boxes which have
    # confidence level greater than 50
    bboxes_list = list()
    heights = list()
    for i in range(len(d['text'])):
        if int(d['conf'][i]) > 50:
            (x, y, w, h) = (d['left'][i], d['top'][i], d['width'][i], d['height'][i])
            bboxes_list.append([x, y, x + w, y + h])
            heights.append(h)

    # Grouping bounding boxes together (consider ocrtesseract)
    heights = sorted(heights)  # Sort heights

    if len(heights) % 2 == 0:
        median_height = heights[int(len(heights) / 2)] / 2.0
    else:
        median_height = heights[int((len(heights)+ 1) / 2)] / 2

    def grouper(iterable, interval=2):
        prev = None
        group = []
        for item in iterable:
            if not prev or abs(item[1] - prev[1]) <= interval:
                group.append(item)
            else:
                yield group
                group = [item]
            prev = item
        if group:
            yield group

    bboxes_list = sorted(bboxes_list, key=lambda k: k[1])  # Sort the bounding boxes based on y1 coordinate ( y of the left-top coordinate )
    combined_bboxes = grouper(bboxes_list, median_height)  # Group the bounding boxes

    # Applying tesseract on each bounding box seperately to read text, which is then translated
    # into strings stored in a single array; the bounding boxes are padded (consider making it a percentage)
    text_arrays = []
    for group in combined_bboxes:
        x_min = min(group, key=lambda k: k[0])[0]-5
        x_max = max(group, key=lambda k: k[2])[2]+5
        y_min = min(group, key=lambda k: k[1])[1]-5
        y_max = max(group, key=lambda k: k[3])[3]+5
        w = int(0.15*(x_max - x_min))
        h = int(0.15*(y_max - y_min))
        cv2.rectangle(vis, (x_min, y_min), (x_max, y_max), (0, 255, 0), 2)
        roi = new_image[y_min:y_max, x_min:x_max]
        text_arrays.append(pytesseract.image_to_string(roi))

    # Prints all strings
    for elem in text_arrays:
        print (elem)
        
TextRecognition(img0)
    #return vis
    #cv2.imwrite('test4detect.jpg', vis) # Change file name
    #cv2.imshow('img', vis)          # Original image
    #cv2.imshow('img2', new_image)   # Pre-processed image
    #cv2.waitKey(0)
