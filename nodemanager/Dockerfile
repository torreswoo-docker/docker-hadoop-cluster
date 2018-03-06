FROM sangwonl/hadoop-base:2.7.1
MAINTAINER Sangwon Lee <gamzabaw@gmail.com>

RUN apt-get update \
       && apt-get upgrade -y \
       && apt-get install -y \
       && apt-get install -y python3-pip python3-dev \
       && cd /usr/local/bin \
       && ln -s /usr/bin/python3 python \
       && pip3 install --upgrade pip

RUN pip3 install --upgrade \
    pip                    \
    matplotlib             \
    plotly                 \
    pandas                 \
    numpy                  \
    pymysql                \
    sqlalchemy             \
    boto                   \
    tensorflow             \
    scipy                  \
    scikit-learn           \
    statsmodels            \
    sympy

HEALTHCHECK CMD curl -f http://localhost:8042/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8042

CMD ["/run.sh"]
