FROM kuroseaist/omniorb-alpine as omniorb

FROM alpine:3.10
COPY --from=omniorb /opt/omniorb/bin/omniNames /usr/local/bin/
COPY --from=omniorb /opt/omniorb/lib/libomniORB4.so.2 /usr/lib/
COPY --from=omniorb /opt/omniorb/lib/libomnithread.so.4 /usr/lib/
RUN apk add --no-cache libstdc++
CMD ["omniNames", "-start", "2809", "-logdir", "/"]
