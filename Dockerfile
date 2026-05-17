# =============================================
# DOCKERFILE — University Website
# Base: nginx:alpine (lightweight Linux + Nginx)
# =============================================

# INSTRUCTION 1: FROM
# Sets the base image. nginx:alpine = Nginx on Alpine Linux (~5MB only)
# Alpine is used because it's tiny, secure, and fast for production
FROM nginx:alpine

# INSTRUCTION 2: LABEL
# Metadata about this image (good practice)
LABEL maintainer="COMSATS CS Dept"
LABEL description="University Department Static Website"
LABEL version="1.0"

# INSTRUCTION 3: RUN
# Remove default nginx placeholder HTML to start clean
RUN rm -rf /usr/share/nginx/html/*

# INSTRUCTION 4: COPY (nginx config)
# Copy our custom nginx.conf into the container
# This replaces the default nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# INSTRUCTION 5: COPY (website files)
# Copy all HTML files, CSS folder, images folder into nginx's HTML serving directory
# The "." on left = everything in current project directory
# The path on right = where nginx looks for files to serve
COPY index.html /usr/share/nginx/html/
COPY courses.html /usr/share/nginx/html/
COPY faculty.html /usr/share/nginx/html/
COPY admissions.html /usr/share/nginx/html/
COPY contact.html /usr/share/nginx/html/
COPY css/ /usr/share/nginx/html/css/

# INSTRUCTION 6: EXPOSE
# Documents that this container listens on port 80
# (This doesn't actually open the port — docker run -p does that)
EXPOSE 80

# INSTRUCTION 7: CMD
# The command that runs when the container starts
# "nginx" = start nginx
# "-g daemon off" = run nginx in the foreground (required for Docker)
CMD ["nginx", "-g", "daemon off;"]