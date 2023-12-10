
FROM python:latest

WORKDIR /demeaudit

# Instale as dependências do sistema necessárias para Kivy e outras bibliotecas
RUN apt-get update && apt-get install -y \
    python3-dev \
    libavformat-dev \
    libavcodec-dev \
    libavdevice-dev \
    libavutil-dev \
    libswscale-dev \
    libswresample-dev \
    libavfilter-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libblas-dev \
    liblapack-dev \
    libatlas-base-dev \
    gfortran \
    libfreetype6-dev

# Atualiza pip e instala as dependências do Python
COPY requirements.txt /demeaudit/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copie todos os arquivos do diretório atual para o diretório de trabalho no container
COPY . /demeaudit/

CMD ["python3", "main.py"]