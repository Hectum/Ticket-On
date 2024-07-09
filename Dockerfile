
FROM python:3.13.0b2-alpine3.20

ENV PYTHONUNBUFFERED=1

WORKDIR /ticketonapp

RUN apk update && apk add --no-cache \
    build-base \
    libffi-dev \
    openssl-dev \
    && rm -rf /var/cache/apk/*

COPY ./requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY ./ ./

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]






