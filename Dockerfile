FROM nginx:latest

# Create images directory
RUN mkdir -p /usr/share/nginx/html/images

# Copy website files
COPY Webpage/Index.html /usr/share/nginx/html/index.html
COPY Webpage/style.css /usr/share/nginx/html/style.css
COPY Webpage/CI-CD.png /usr/share/nginx/html/images/CI-CD.png

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
