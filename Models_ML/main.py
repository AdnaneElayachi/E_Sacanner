# import cv2
# import pytesseract
# ##############################
# test=cv2.imread('OIP.jpg')
# def inputImage(test):
#     return test.imread(test)

# def ocr_core(test):
#     text = pytesseract.image_to_string(test)
#     return text

# def get_grayscale(test):
#     return cv2.cvtColor(test,cv2.COLOR_BGR2GRAY)

# def remove_noise(test):
#     return cv2.medianBlur(test,5)

# def thresholding(test):
#     return cv2.threshold(test,0,255,cv2.THRESH_BINARY+cv2.THRESH_OTSU)[1]

# test=get_grayscale(test)
# test=thresholding(test)
# test=remove_noise(test)
# print(ocr_core(test))



import cv2
import pytesseract

test = cv2.imread('Carte.jpg')

def preprocess_image(test):
    gray = cv2.cvtColor(test, cv2.COLOR_BGR2GRAY)

    
    _, thresh = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)

    denoised = cv2.medianBlur(thresh, 5)

    return denoised

def ocr_core(test):
    text = pytesseract.image_to_string(test, lang='eng')  
    return text

preprocessed_image = preprocess_image(test)

result = ocr_core(preprocessed_image)
print(result)



