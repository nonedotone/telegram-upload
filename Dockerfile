ARG python_version=3.9.7

FROM python:$python_version
ENV TELEGRAM_UPLOAD_CONFIG_DIRECTORY=/config
ENV PYTHONPATH=/app/
VOLUME /config
VOLUME /files

RUN mkdir /app && apt-get update -y &&  apt-get install ffmpeg -y
COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt && pip install pillow
COPY telegram_upload/ /app/telegram_upload/
WORKDIR /files

ENTRYPOINT ["/usr/local/bin/python", "/app/telegram_upload/management.py"]
