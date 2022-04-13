FROM python:3.9


# RUN apt-get update -y && \
#     apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
# COPY ./requirements.txt requirements.txt

WORKDIR /flask-docker
# COPY requirements.txt requirements.txt
COPY . .
# RUN python -m venv venv
# RUN . venv/bin/activate
RUN pip install -r requirements.txt
EXPOSE 5000 5000

# ENTRYPOINT [ "python" ]

CMD [ "python", "main.py" ]