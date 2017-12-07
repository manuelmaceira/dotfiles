#!/bin/bash

echo `expr $(ls ~/.Mail/Gatech/INBOX/new|wc -l) + $(ls ~/.Mail/Gmail/INBOX/new|wc -l)` > ~/.Mail/newmail
for i in {1..11}
do
  sleep 5
  echo `expr $(ls ~/.Mail/Gatech/INBOX/new|wc -l) + $(ls ~/.Mail/Gmail/INBOX/new|wc -l)` > ~/.Mail/newmail
done
