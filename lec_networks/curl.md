# curl
## cookie
    accept cookie
        curl -c cookie.txt url
    request with cookie
        curl -b cookie.txt url

## -d = --data  = --data-ascii
    --data-ascii
    --data-binary
    --data-encode
## -f --form
    contentType = multipart/form-data
    upload binary file
        curl -f file1=@/home/data
        curl -f string=</home/data.txt
        curl -f "file=@remane_file;filename=name
## -X
    -X GET
    -X POST

## -H
    -H "Accept: text/plain"

## -A 
    "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0" https://getfedora.org/
