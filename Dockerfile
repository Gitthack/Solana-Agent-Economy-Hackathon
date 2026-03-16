FROM python:3.12-slim
WORKDIR /app
COPY . /app
RUN apt-get update && apt-get install -y build-essential && \
    python -m pip install --upgrade pip setuptools wheel && \
    pip install matplotlib requests
# demo entrypoint
CMD ["/bin/bash","-lc","bash mm/scripts/run_demo.sh || python3 mm/backtest/run_quick_demo.py"]
