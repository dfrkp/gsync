FROM python:3

## Re-build by pushing update to github on 26-Apr-20

RUN groupadd -r gsync && useradd --no-log-init -r -m -g gsync gsync
USER gsync

WORKDIR /home/gsync
ENV PATH $PATH:/home/gsync/.local/bin

RUN pip install --user pipenv && pipenv install gphotos-sync

ENTRYPOINT ["pipenv", "run", "gphotos-sync"]

CMD ["-h"]
