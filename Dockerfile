FROM --platform=$BUILDPLATFORM rust:1.65 AS vendor
ENV USER=root
WORKDIR /usr/src/gwmp-mux
RUN cargo init
COPY Cargo.lock Cargo.toml /usr/src/gwmp-mux/
RUN mkdir -p /usr/src/gwmp-mux/.cargo
RUN cargo vendor >> /usr/src/gwmp-mux/.cargo/config.toml

FROM rust:1.65 as builder
WORKDIR /usr/src/gwmp-mux
COPY Cargo.toml ./Cargo.toml
COPY Cargo.lock ./Cargo.lock
COPY src ./src
COPY --from=vendor /usr/src/gwmp-mux/.cargo ./.cargo
COPY --from=vendor /usr/src/gwmp-mux/vendor ./vendor
RUN cargo build --release --offline

FROM debian:buster-slim
COPY --from=builder /usr/src/gwmp-mux/target/release/gwmp-mux /usr/local/bin/gwmp-mux
ENTRYPOINT ["gwmp-mux"]