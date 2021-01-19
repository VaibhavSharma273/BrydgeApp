import io
import os
import numpy as np
from google.cloud import vision
from google.cloud.vision_v1 import types
from difflib import SequenceMatcher
import re
import postal
from postal.parser import parse_address
from google.oauth2 import service_account
from sys import argv
credentials = service_account.Credentials.from_service_account_file(os.path.join(os.path.dirname(__file__),'apikey.json'))
client = vision.ImageAnnotatorClient(credentials=credentials)
f = open("designations.txt", "r")
designations = f.readlines()
designations = list(map(lambda x:x.lower(), designations))
designations = list(map(lambda x:x.replace('\n', ''), designations))

def TextDictionary(path):
    text_array = []
    with io.open(path, 'rb') as image_file:
        content = image_file.read()

    image = types.Image(content=content)

    response = client.text_detection(image=image)

    labels = response.text_annotations

    for label in labels:
        text_array.append(label.description)

    return text_array

def removepunctuations(text):
    puncts = '-,:;/><\#'
    no_punct = ""
    for char in text:
        if char not in puncts:
            no_punct = no_punct + char
    no_punct = no_punct.replace('\n', ' ')
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

def PhoneNumber(array):
    for elm in array:
        elm = removepunctuations(elm)
        if len(elm) >= 5 and elm.isdecimal():
            print(elm)
            return elm
    return ""
# 'Phone Number'
# 'Office Number'

def DesignationScraper(designations, array):
    array = list(map(lambda x:x.lower(), array))
    for elm in array:
        split = elm.split()
        if len(split) < 4:
            if any(item in designations for item in split):
                return elm.title()
    return ""

file_name = '/Users/neelmalhotra/Downloads/Google Cloud Access/Dataset'

listKeys = list(dict.fromkeys(TextDictionary((os.path.join(file_name, argv[1])))))
finalList = [removepunctuations(x) for x in listKeys]

dictionary = aggregatorfunction(listKeys)
phoneNumber = PhoneNumber(listKeys)
designation = DesignationScraper(designations, listKeys)

dictionary['Designation'] = designation
dictionary['Phone Number'] = phoneNumber

print(dictionary)
print('______')
print(listKeys)
