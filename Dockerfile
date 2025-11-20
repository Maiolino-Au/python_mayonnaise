FROM gcfntnu/scanpy

ENV PATH=/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN pip install scvi

ENV SHELL=/bin/bash
CMD ["/bin/bash"]
