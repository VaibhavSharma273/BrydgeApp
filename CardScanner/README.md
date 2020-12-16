# Card Scanner (Python)
Our business card scanner implements the model proposed by Madan Kumar, C. and Brindha, M.[1] Using OCR and image manipulation techniques, we are able to identify a region of interest in a given business card, and then identify the text and classify it using NLP. We are currently working on combining the model with deep learning in order to provide better scanning and classification ability.

## Using the program
To manually use the program, simply run:
```
python3 ./CardScanner.py <image_name>
```
The expected output should be a dictionary list, with each entry of the dictionary giving an expected contact field and the text read in for it from the given business card.

## References
[1] Madan Kumar, C. and Brindha, M., Text Extraction from Business Cards and Classification of Extracted Text Into Predefined Classes (March 22, 2019). International Journal of Computational Intelligence & IoT, Vol. 2, No. 3, 2019, Available at SSRN: https://ssrn.com/abstract=3358293
