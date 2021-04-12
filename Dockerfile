FROM ubuntu:18.04

MAINTAINER retya "retya.mahendra@gmail.com"

RUN apt-get update -y && \
    apt-get install -y python3-pip python3 && \
    apt-get install -y libleptonica-dev tesseract-ocr libtesseract-dev ffmpeg libsm6 libxext6

#tesseract-ocr-dev libtesseract-dev


COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN python3 -m pip install -U pip && \ 
    python3 -m pip install -r requirements.txt

COPY . /app

EXPOSE 5000

ENTRYPOINT [ "python3" ]

CMD [ "main.py" ]
