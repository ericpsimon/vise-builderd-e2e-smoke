FROM debian:bookworm-slim
COPY vise-agent /usr/local/bin/vise-agent
COPY echo_agent_fixture /usr/local/bin/echo_agent_fixture
RUN chmod +x /usr/local/bin/vise-agent /usr/local/bin/echo_agent_fixture
ENV VISE_AGENT_CMD=/usr/local/bin/echo_agent_fixture
EXPOSE 8791
CMD ["/usr/local/bin/vise-agent"]
# rebuild marker: force a fresh content hash (build-avoidance keys only on
# vise.toml+Dockerfile content, not the full build context -- a binary-only
# change like this one otherwise silently reuses a stale image)
