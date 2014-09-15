# MongoDB Docker Scripts

* Start mongoDB

        bash mongo-start.sh /absolute/path/to/database/files/ dbPort

    Example

        bash mongo-start.sh /data/db/ dbPort


* Connect to database

        mongo -host 127.0.0.1:dbPort

    Example

        mongo -host 127.0.0.1:dbPort

