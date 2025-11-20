FROM gcfntnu/scanpy

ENV PATH=/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN pip install scvi

RUN sudo apt update && sudo apt install -y python3 python3-pip python3-venv
# create a virtual environment in which JupyterLab can be installed
RUN python3 -m venv /opt/venv
# Activate virtual environment and install JupyterLab
RUN /opt/venv/bin/pip install --upgrade pip && /opt/venv/bin/pip install jupyterlab
# Set the virtual environment as the default Python path
ENV PATH="/opt/venv/bin:$PATH"
# Make R visible to jupyter
RUN R -e "install.packages('IRkernel')" && \
    R -e "IRkernel::installspec(user = FALSE)"

ENV SHELL=/bin/bash
# CMD ["/bin/bash"]
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8787", "--no-browser", "--allow-root", "--ServerApp.allow_origin='*'", "--ServerApp.token=''"]
