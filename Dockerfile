FROM buildpack-deps:xenial

ADD main.c Makefile /
RUN make hexgrep-static

FROM scratch

COPY --from=0 hexgrep-static /hexgrep

ENTRYPOINT ["/hexgrep"]
