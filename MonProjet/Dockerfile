FROM python:3.8
WORKDIR /MonProjet
COPY requirements.txt /MonProjet/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY . /MonProjet/
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
