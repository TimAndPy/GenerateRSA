@echo off

rename *.txt password.txt
rename *.pem mx_to_process.pem
rename *.pfx mx.pfx

copy mx_to_process.pem mx.pem

set /p password=<password.txt

openssl pkcs12 -in mx.pfx -nocerts -out mx_to_process.pem -passin pass:%password% -passout pass:%password%

openssl rsa -in mx_to_process.pem -out mx.rsa -passin pass:%password%

del password.txt
del mx.pfx
del mx_to_process.pem
