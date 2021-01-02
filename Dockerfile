FROM sorccu/adb

RUN apk add --update --no-cache python3

COPY my_adb.py my_adb.py

CMD [ "python3", "my_adb.py", "-u" ]