FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 3000

CMD ["gunicorn", "-b", "0.0.0.0:3000", "-w", "1", "--timeout", "120", "app:app"]
