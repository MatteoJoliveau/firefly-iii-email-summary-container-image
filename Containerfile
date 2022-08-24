FROM python:3.9-slim-buster

USER root

RUN apt update -y && apt upgrade -y
RUN apt install patch -y

ENV USER=firefly APP=/app

RUN groupadd $USER &&\
    useradd -g $USER $USER &&\
    mkdir -p $APP

RUN chown -R $USER:$USER $APP

WORKDIR $APP

COPY firefly-iii-email-summary .

RUN pip install -r requirements.txt

COPY config-path.patch .

RUN patch monthly-report.py config-path.patch

USER $USER

CMD ["python", "monthly-report.py"]