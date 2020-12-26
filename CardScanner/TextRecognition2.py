
import numpy as np
import cv2
import pytesseract
from pytesseract import Output
import PT
import re
import postal
from postal.parser import parse_address
from difflib import SequenceMatcher

## NLP Text Processing
def removepunctuations(text):
    puncts = ',:;/><\#'
    no_punct = ""
    for char in text:
        if char not in puncts:
            no_punct = no_punct + char
    return no_punct

def reversechecker(text, input_compare):
    text = text.replace('.', " ")
    res = re.split(' |, |_|-|!|@', text)
    straight = ' '.join(res)
    res.reverse()
    reverse = ' '.join(res)
    seq_straight = SequenceMatcher(None, input_compare.lower(), straight).ratio()
    seq_reverse = SequenceMatcher(None, input_compare.lower(), reverse).ratio()
    if seq_straight >= seq_reverse:
        final = [removepunctuations(straight), seq_straight]
    elif seq_straight <= seq_reverse:
        final = [removepunctuations(reverse), seq_reverse]
    return final

def aggregatorfunction(d_text_arr):
    email = []
    website = []
    orgn = []
    zipcode = []
    city = []
    country = []
    arr = []
    rows, cols = (len(d_text_arr), 2)
    similarity_ratio = [[0]*cols] * rows
    for i in d_text_arr:
        # print(i)
        lst = re.findall('\S+@\S+', i)
        if len(lst) != 0:
            email = np.append(email, lst)
        if 'web' in i.lower() or 'www.' in i.lower():
            arr1 = i.split()
            # print(arr1)
            for j in arr1:
                if 'www' in j:
                    website = np.append(website, removepunctuations(j))
        if 'email' in i.lower() or '@' in i.lower():
            result = re.findall(r'@(\w+)', i)
            if len(result) == 0:
                name = ''
            elif len(result[0]) <= 3:
                name = result[0].upper()
            elif len(result[0]) > 3:
                name = result[0].title()
            orgn = np.append(orgn, name)
    return website
    if len(email) == 0:
        primary_email = ""
        secondary_email = ""
    if len(email) > 1:
        primary_email = removepunctuations(email[0])
        secondary_email = removepunctuations(email[1])
    elif len(email) == 1:
        primary_email = removepunctuations(email[0])
        secondary_email = ""
    if len(website) == 0:
        website = ""
    if len(website) >= 1:
        website = website[0]
    if len(orgn) >= 1:
        orgn = removepunctuations(orgn[0])
    elif len(orgn) == 0:
        orgn = ""
    return primary_email, secondary_email, website, orgn

    for i in range(len(d_text_arr)):
        parser = parse_address(d_text_arr[i])
        for elm in parser:
            if 'code' in elm[1]:
                zipcode = np.append(zipcode, elm[0].upper())
            if 'city' in elm[1]:
                city = np.append(city, elm[0].title())
            if 'country' in elm[1]:
                country = np.append(country, elm[0].title())
            if len(parser) > 1:
                if 'house' in elm[1] or 'house_number' in elm[1] or 'road' in elm[1] or 'suburb' in elm[1]:
                    arr = np.append(arr, elm[0].title())
        full_name, ratio = reversechecker(primary_email.split('@')[0], d_text_arr[i])
        similarity_ratio[i] = [full_name, ratio]
    if len(zipcode) == 0:
        zipcode = ""
    elif len(zipcode) >= 1:
        zipcode = zipcode[0]
    if len(city) == 0:
        city = ""
    elif len(city) >= 1:
        city = removepunctuations(city[0])
    if len(country) == 0:
        country = ""
    elif len(country) >= 1:
        country = removepunctuations(country[0])
    if len(arr) != 0:
        address = ' '.join(arr)
    else:
        address = ""
    full_name = max(similarity_ratio, key=lambda x: x[1])[0]
    arr = full_name.split()
    if len(arr) == 1:
        first_name = arr[0].title()
        last_name = ""
    else:
        first_name = arr[0].title()
        last_name = arr[1].title()
    state = ' '
    myDict = {'First Name': first_name, 'Last Name': last_name,'Primary Email': primary_email, 'Secondary Email':secondary_email,
    'Website': website, 'Orgn.' : orgn, 'Zipcode': zipcode, 'City': city, 'State':state, 'Country':country,
    'Address': address}
    return myDict

def TextRecognition(img0):
# Text analysis using pytesseract to create bounding boxes (consider ocrtesseract)
    contour, img = PT.Perspective(img0)
    new_image = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    new_image = cv2.medianBlur(new_image,5)
    new_image = cv2.threshold(new_image, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)[1]

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
    cv2.imshow('img', vis)  
    cv2.waitKey(0)

    if len(heights) % 2 == 0:
        median_height = heights[int(len(heights) / 2)] / 2.0
    else:
        print(len(heights))
        median_height = heights[int((len(heights) + 1) / 2) - 1] / 2.0

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
        cv2.rectangle(vis, (x_min, y_min), (x_max, y_max), (0, 255, 0), 2)
        roi = new_image[y_min:y_max, x_min:x_max]
        text_arrays.append(pytesseract.image_to_string(roi))

    myDict = aggregatorfunction(text_arrays)
    return vis, text_arrays, aggregatorfunction(text_arrays)
    #print(myDict)
    #return vis
    #cv2.imshow('img', vis)          # Original image
    #cv2.imshow('img2', new_image)   # Pre-processed image
    #cv2.waitKey(0)
