FROM amazonlinux:latest

RUN yum -y update && \
    yum -y install \
      python27-devel.x86_64 \
      gcc

# Create app directory and add app
ENV APP_HOME /app
ENV APP_SRC $APP_HOME/src
RUN mkdir $APP_HOME
ADD . $APP_HOME

RUN curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | python
RUN pip install -r $APP_SRC/requirements.txt -t $APP_SRC
