# Use nginx to serve the HTML file
FROM nginx:alpine

# Copy your HTML file to nginx html directory
COPY index.html /usr/share/nginx/html/

# Copy any additional static files (CSS, JS, images) if you have them
# COPY styles.css /usr/share/nginx/html/
# COPY script.js /usr/share/nginx/html/
# COPY images/ /usr/share/nginx/html/images/

# Expose port 80
EXPOSE 80
    
# Start nginx
CMD ["nginx", "-g", "daemon off;"]


