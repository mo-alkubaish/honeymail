FROM golang:1.23-alpine AS builder

WORKDIR /app

# Copy go module files first for better caching
COPY go.mod go.sum ./
# Copy the vendor directory
COPY vendor/ ./vendor/

# Copy the source code
COPY . .

# Build the application with -mod=mod flag to ignore vendor inconsistencies
RUN CGO_ENABLED=0 GOOS=linux go build -mod=mod -o honeymail .

# Create a minimal final image
FROM alpine:latest

RUN apk --no-cache add ca-certificates tzdata

WORKDIR /app

# Copy the compiled binary from the builder stage
COPY --from=builder /app/honeymail /app/
# Copy GeoLite2 database
COPY --from=builder /app/GeoLite2-City.mmdb /app/
# Copy configuration files
COPY --from=builder /app/conf/ /app/conf/

# Create volume mount points
VOLUME ["/app/data", "/app/logs"]

# Expose the SMTP and API ports
EXPOSE 10025 10026 8080

# Set the entry point
ENTRYPOINT ["/app/honeymail"]