FROM clux/muslrust:stable as builder
COPY static /build/static
WORKDIR /build
COPY . .
ENV RUSTFLAGS='-C target-feature=+crt-static'
ENV DISABLE_PDF_GET="true"
ENV ENABLE_HTML_ENDPOINT="false"
ENV SERVER_PORT="8080"
ENV DEV_MODE="false"

RUN cargo build --release

FROM gcr.io/distroless/static-debian12:nonroot
WORKDIR /app
COPY --from=builder /build/target/x86_64-unknown-linux-musl/release/pdfgen-rs /app/pdfgen-rs
COPY --from=builder /build/static /app/static
EXPOSE 8080
CMD ["/app/pdfgen-rs"]
