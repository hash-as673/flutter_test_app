# Stage 1: Flutter build
FROM ubuntu:22.04 AS builder

# Install dependencies
RUN apt-get update && apt-get install -y curl git unzip xz-utils && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Enable web and prepare app
RUN flutter config --enable-web

WORKDIR /app
COPY . .
RUN flutter pub get
RUN flutter build web --base-href /myapp/

# Stage 2: Nginx serving built app
FROM nginx:alpine
RUN apk update && apk upgrade
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /app/build/web/ /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
