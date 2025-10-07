# Stage 1: Build the Flutter web application
FROM cirrusci/flutter:stable AS build

# Set the working directory
WORKDIR /app

# Copy the pubspec file and get dependencies
COPY pubspec.* ./
RUN flutter pub get

# Copy the rest of the application source code
COPY . .

# Build the web application for release
RUN flutter build web --release

# Stage 2: Serve the application with Nginx
FROM nginx:alpine

# Copy the built web application from the build stage to the Nginx html directory
COPY --from=build /app/build/web /usr/share/nginx/html

# Copy the custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
