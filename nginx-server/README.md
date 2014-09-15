# Nginx Docker Scripts


* Start Nginx for project containing static content

        bash start-nginx.sh /absolute/path/to/sites-enabled/ /absolute/path/to/project/ hostPort

    For example

        bash start-nginx.sh /etc/nginx/sites-enabled/ /absolute/path/to/project/ 8000
