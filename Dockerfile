FROM gcfntnu/scanpy

ENV PATH=/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN pip install scvi
RUN pip install jupyterlab

# Make R visible to jupyter
# RUN R -e "install.packages('IRkernel')" && \
#     R -e "IRkernel::installspec(user = FALSE)"

ENV SHELL=/bin/bash
# CMD ["/bin/bash"]
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8787", "--no-browser", "--allow-root", "--ServerApp.allow_origin='*'", "--ServerApp.token=''"]
