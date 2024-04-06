# Наш базовий образ - це Linux з попередньо встановленим python-3.10
FROM python:3.10-slim

# Встановимо змінну середовища
ENV APP_DIR /application

# Встановимо робочу директорію всередині контейнера
WORKDIR $APP_DIR

# Скопіюємо інші файли в робочу директорію контейнера
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Позначимо порт, де працює застосунок всередині контейнера
EXPOSE 8000

# Запустимо наш застосунок всередині контейнера
ENTRYPOINT ["python", "main.py"]
