FROM python:latest

WORKDIR /app
COPY . /app

RUN pip install --no-cache-dir Flask==2.3.3 Flask-RESTful==0.3.9 Flask-Cors==3.0.10 Flask-Mail
RUN pip install python-dotenv
RUN pip install pyjwt

ENV FLASK_ENV=development

EXPOSE 5000

RUN git clone https://github.com/jotal8/email-flask /app

CMD ["flask", "--app", "index", "run", "--host=0.0.0.0"]