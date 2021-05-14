FROM python:3.6-alpine

ENV FLASK_APP run.py

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY . .

EXPOSE 5005
CMD ["gunicorn", "--config", "gunicorn-cfg.py", "run:app"]
