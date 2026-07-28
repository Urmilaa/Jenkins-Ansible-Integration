FROM nginx:latest

COPY Webpage/Index.html /usr/share/nginx/html/
COPY Webpage/style.css /usr/share/nginx/html/
COPY Webpage/CI-CD.png /usr/share/nginx/html/images/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
