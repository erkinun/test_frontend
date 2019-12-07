---
to: __backstop__/Dockerfile
---
FROM docksal/backstopjs:latest

RUN curl -O https://bootstrap.pypa.io/get-pip.py

RUN python get-pip.py
RUN pip install awscli