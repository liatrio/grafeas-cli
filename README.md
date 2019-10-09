#CLI for grafeas

This repository contains the code for the grafeas client running with TLS, I copied almost all of the code in `main.go` from `github.com/grafeas/grafeas/go/v1beta1/example/cert_client/cert_client.go`

One of the only changes is that the `pb` library is replaced with a different version that actually works. 

The Dockerfile should be built after you generate `ca.crt` and `ca.key`.

When running this client it's assumed that you're already runnning a grafeas server that is configured with client certificate authentication.
