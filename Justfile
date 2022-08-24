IMAGE := "quay.io/matteojoliveau/firefly-iii-email-summary"

build:
    docker buildx build -f Containerfile -t {{IMAGE}}:latest .