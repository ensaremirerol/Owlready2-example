FROM python:3.10:slim

# Install jre
RUN apt-get update && apt-get install -y openjdk-11-jre && apt-get clean

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY reasoner.py .
COPY run_reasoner.py .

VOLUME [ "/app/data" ]
VOLUME [ "/app/results" ]

ENV JAVA_MEM=4000
ENV MAX_SUBPROCESS=1

CMD [ "python", "reasoner.py" ]