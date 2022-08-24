FROM python:3.9-slim-buster

USER root

RUN apt update -y && apt upgrade -y
RUN apt install patch -y

WORKDIR /app

COPY firefly-iii-email-summary .

RUN pip install -r requirements.txt

COPY config-path.patch .

RUN patch monthly-report.py config-path.patch

CMD ["python", "monthly-report.py"]