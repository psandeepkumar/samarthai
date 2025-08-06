# Use nginx to serve the HTML file
FROM nginx:alpine

# Copy your HTML file to nginx html directory
COPY index.html /usr/share/nginx/html/

# Copy any additional static files (CSS, JS, images) if you have them
# COPY styles.css /usr/share/nginx/html/
# COPY script.js /usr/share/nginx/html/
# COPY images/ /usr/share/nginx/html/images/

# Create nginx configuration that listens on PORT environment variable
RUN echo 'server { \
    listen 8080; \
    server_name localhost; \
    location / { \
        root /usr/share/nginx/html; \
        index index.html; \
        try_files $uri $uri/ /index.html; \
    } \
}' > /etc/nginx/conf.d/default.conf

# Remove the default nginx configuration
RUN rm /etc/nginx/conf.d/default.conf.bak 2>/dev/null || true

# Expose port 8080
EXPOSE 8080

# Start nginx
CMD ["nginx", "-g", "daemon off;"]