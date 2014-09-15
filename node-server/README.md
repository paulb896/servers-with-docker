# Node Docker Scripts


* Run node server.js

        bash run-server.sh /absolute/path/to/project/ serverPort hostPort

    Example (node server is listening on 8111 in container, and 8555 on host)

        bash run-server.sh /code/project 8111 8555

