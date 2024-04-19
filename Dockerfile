FROM ubuntu:20.04

# Install Git, Vim, and cURL
RUN apt-get update && \
    apt-get install -y git vim curl

# Download and install Go
RUN curl -O https://dl.google.com/go/go1.20.4.linux-amd64.tar.gz && \
    tar -xvf go1.20.4.linux-amd64.tar.gz && \
    mv go /usr/local

# Set Go environment variables
ENV GOROOT=/usr/local/go \
    GOPATH=/go \
    PATH=/usr/local/go/bin:$PATH

# Create a directory for Go projects
RUN mkdir /go

# Clean up
RUN rm go1.20.4.linux-amd64.tar.gz && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
