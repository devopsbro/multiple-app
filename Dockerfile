FROM nginx:alpine 
COPY nginx.conf /etc/nginx/conf.d/default.conf

## Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy from the stage 1 builder
COPY . /usr/share/nginx/html
RUN ls -la /usr/share/nginx/html #To check nginx html folder is copied successfully or not

EXPOSE 81
ENTRYPOINT ["nginx", "-g", "daemon off;"]
