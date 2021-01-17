# -*- coding: utf-8 -*-
"""Mood Analysis.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1oUHu5dpeIM9dthTRbuC6-zDrgEEXwB7r
"""


import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.pipeline import Pipeline
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix
import nltk
nltk.download('stopwords')
nltk.download('punkt')
nltk.download('wordnet')
import string
punct = string.punctuation
import re
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords
from nltk.stem import WordNetLemmatizer
stop_words=set(stopwords.words('english'))
lemma=WordNetLemmatizer()

def clean_review(text):
    text=re.sub(r'http\S+','',text)
    text=re.sub('[^a-zA-Z]',' ',text)
    text=word_tokenize(text)
    text=[i for i in text if i not in stop_words]
    text=[lemma.lemmatize(word=w,pos='v') for w in text]
    text=[i for i in text if len(i)>2]
    text=[w.lower() for w in text]
    return text


def count(entry):
    charcount=[]
    for para in entry:
        if para!='\n':
            charcount.append(para)
    return len(charcount),len(entry.split())

data_yelp = pd.read_csv('/content/drive/MyDrive/yelp_labelled.txt', sep='\t', header = None)
columns_name = ['Review', 'Sentiment']
data_yelp.columns = columns_name
data_amazon = pd.read_csv('/content/drive/MyDrive/amazon_cells_labelled.txt', sep = '\t', header = None)
data_amazon.columns = columns_name
data_imdb = pd.read_csv('/content/drive/MyDrive/imdb_labelled.txt', sep = '\t', header = None)
data_imdb.columns = columns_name
data = data_yelp.append([data_amazon, data_imdb], ignore_index=True)

from sklearn.svm import LinearSVC
tfidf = TfidfVectorizer(tokenizer = clean_review)
classifier = LinearSVC(max_iter=2000)

X = data['Review']
y = data['Sentiment']
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.036, random_state = 42)

clf = Pipeline([('tfidf', tfidf), ('clf', classifier)])

model_hist = clf.fit(X_train, y_train)

# For this free service organisation needs to create their own account ON 
"""
import requests

url = "https://kutip.p.rapidapi.com/api/quote/random"

querystring = {"lang":"en"}

headers = {
    'x-rapidapi-host': "kutip.p.rapidapi.com",
    'x-rapidapi-key': "b2aeaf8263mshf529f6a8b7e380dp19e40djsn6291f4f5XXXX" 
    }

response = requests.request("GET", url, headers=headers, params=querystring)

print(response.text)
"""

import pickle
with open("analysis_model","wb") as f:
  pickle.dump(clf,f)

clf = pickle.load(open("analysis_model", 'rb'))

def make_prediction(text):
  text=re.sub(r'http\S+','',text)
  text=re.sub('[^a-zA-Z]',' ',text)
  text=word_tokenize(text)
  text=[i for i in text if i not in stop_words]
  text=[lemma.lemmatize(word=w,pos='v') for w in text]
  text=[i for i in text if len(i)>2]
  text=[w.lower() for w in text]
  text=' '.join(text)
  make=clf.predict([text])
  return make[0]





