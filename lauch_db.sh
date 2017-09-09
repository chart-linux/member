docker run --rm -v /var/lib/postgresql/data -e POSTGRES_USER=member -e POSTGRES_PASSWORD=member -p 5432:5432 --name member-postgres -d postgres:9.6-alpine
