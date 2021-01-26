FROM sorccu/adb

RUN apk add --update bash

COPY entrypoint.sh /entrypoint.sh

ENV TV_IPS ""

CMD [ "/bin/bash", "/entrypoint.sh" ]