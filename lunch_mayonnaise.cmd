@echo off
set "CURRENT_DIR=%cd%"
docker run -it --rm -p 8888:8888 -v "%CURRENT_DIR%:/sharedFolder" ghcr.io/maiolino-au/python_mayonnaise
