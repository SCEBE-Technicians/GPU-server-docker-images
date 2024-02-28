FROM python-3.8:latest

COPY cuda11.2+cudnn8.1/entrypoint.sh /
RUN chmod +x /entrypoint.sh
