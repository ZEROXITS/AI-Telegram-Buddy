# استخدم صورة Python 3.12 slim
FROM python:3.12-slim

# مجلد العمل
WORKDIR /app

# تثبيت الحزم الأساسية للبناء
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    gcc \
    libffi-dev \
    libssl-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# نسخ الملفات
COPY . /app

# تحديث pip
RUN pip install --upgrade pip

# تثبيت متطلبات المشروع
RUN pip install --no-cache-dir -r requirements.txt

# تشغيل البوت
CMD ["python", "bot.py"]
