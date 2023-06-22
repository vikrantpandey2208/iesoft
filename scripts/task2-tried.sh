#! /bin/bash
mail() {
  echo called
  echo $1
}

inotifywait --monitor --event close_write --quiet test.log |
  while read -r event; do

    tail -fn0 test.log | grep "error"

    body=$(cat temp.txt)

    echo $body

    curl --ssl-reqd \
      --url 'smtps://smtp.gmail.com:465' \
      --user 'vikrantpandey466@gmail.com:texvrhswwgjazxlb' \
      --mail-from 'vikrantpandey466@gmail.com' \
      --mail-rcpt 'vikrant.pandey@iesoftek.com' \
      -H "Subject: Log Motioring Service" \
      -T - <<<"$body"

    echo "" >temp.txt

  done


#! /bin/bash

curl --ssl-reqd \
  --url 'smtps://smtp.gmail.com:465' \
  --user 'vikrantpandey466@gmail.com:texvrhswwgjazxlb' \
  --mail-from 'vikrantpandey466@gmail.com' \
  --mail-rcpt 'vikrant.pandey@iesoftek.com' \
  --upload-file mail.txt