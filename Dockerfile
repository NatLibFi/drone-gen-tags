FROM busybox:1
ENTRYPOINT ["/app/script.sh"]
COPY script.sh /app/
