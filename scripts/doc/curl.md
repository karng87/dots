# curl

문제:
    curl로 특정 요청을 보낸 후 응답으로 받은 쿠키를 저장하고, 그 쿠키를 재사용해 다음 요청을 보내고 싶다.

#### page1.example.com 으로 요청을 보내고, 응답 쿠키를 cookie.txt에 저장한다.

    $ curl -c cookie.txt http://page1.example.com


####  저장한 쿠키(cookie.txt)를 헤더에 추가해서, page2.example.com 으로 요청한다.
    $ curl -b cookie.txt http://page2.example.com


## -c, —cookie-jar <filename>

     요청이 완료된 후 쿠키를 모두 저장한다.

     저장한 쿠키는 -b, —cookie 옵션으로 사용할 수 있다. 
## -b, —cookie <name=data>
     서버로 쿠키를 전달한다.
     파라미터는 “name1=value1; name2=value2” 형태로 구성해야 한다.
     요청에 ‘=‘ 기호가 없을 경우, 헤더가 저장된 파일에서 값을 가져오며,
     파일 내용 중에 Set-Cookie: 로 된 부분을 파싱해서 쿠키로 사용한다.

        -L, —location 옵션과 같이 사용할 때 유용하다.

     이 옵션은 쿠키를 인풋으로 전달할 때만 사용한다.
     쿠키를 저장할 목적이라면, -c, —cookie-jar 나 -D, —dump-header 옵션을 사용한다.

## -X, —request <command>
     HTTP 메서드를 설정할 수 있다.
     -X GET
     일반적으로는 옵션에 맞는 메서드가 적용돼 요청한다.

## -H —header <header>
     헤더를 보낸다.
     -H “Accept: text/plain"
     헤더가 여러 개일 경우, 파라미터를 여러 개 붙인다. 

## -d, —data <name=content>
     데이터를 전달한다.
     쿼리 스트링 형태로 인자를 전달한다.
     -data는 --data-ascii 와 동일하다.
     바이너리를 보내려면 —data-binary, URL인코딩된 값을 보내려면 —data-encode를 사용한다.
     요청 헤더의 contentType은 application/x-www-form-urlencoded 로 보낸다.


## -f, —form <name=content>
     요청 헤더의 contentType은 multipart/form-data 로 보낸다.
     바이너리 파일의 업로드가 가능하다.

#### @
     content 부분에 파일 경로를 넣으려면 @으로 시작하도록 한다.

        -f password=@/etc/passwd

#### <
     @ 대신 
     < 를 사용할 수도 있는데, 
        < 는 파일의 내용을 읽어서 첨부한다.
#### ;
     ; 으로 컨텐트의 타입을 명시할 수도 있다.

        -f “web=@index.html;type=text/html”

     파일 업로드의 경우, 같은 방식으로 파일명을 변경할 수 있다.

        -f “file=@localfile;filename=nameinpost”

## —form-string <name=content>
     —form 과 동일하지만,  @와 <, ; 등이 특별한 의미를 갖지 않는다.

## -K, —config <config file>
     설정 파일로 요청을 보낸다.

## -I, —head
     헤더 요청만 받는다.
     HEAD 메서드로 보내는 것과 동일하다.

        -X로 메서드를 명시하는 경우, 헤더만 출력한다. 



# 응답 데이터 관련

## -i, —include
     응답 헤더를 출력한다

## -o, —output <file>
     응답을 stdout이 아닌 file로 출력한다.

     여러 문서를 다운로드 받으려고 
     파일 선택자에 {} 나 []를 사용했다면, 
        # 에 번호를 붙이는 식으로 해당 명을 사용할 수 있다.

     curl http://{one,two}.site.com/file[1-5].html -o "#1_#2”

## -O, —remote-output
     응답을 리포트 파일명과 동일하게 저장한다.
     다른 디렉토리에 저장하고자 한다면, 워킹 디렉토리를 해당 디렉토리로 변경해야 한다.

## -w, —write-format <format>
     응답에서 포맷에 맞는 데이터를 출력할 수 있다. 

        %{variable_name} 과 같은 식으로 출력할 수 있다.

     content_type, http_code, time_total 등의 정보를 출력할 수 있다.

## -x, —proxy <url:port>
     HTTP 요청을 보낼 때, 프록시를 사용한다.

     curl -x http://localhost:8888 http://naver.com


## -p, —proxytunnel
     -x 파라미터와 함께 사용되며, HTTP 요청이 아닌 것을 HTTP 요청으로 보낸다.

## -s, —slient
    프로그레스나 에러 정보를 보여주지 않는다.

## —retry <num>
## —retry-delay <seconds>
     요청 실패 시 재시도 한다.


# -L, —location
     서버 응답이 3XX로 와서 페이지가 이동된 걸로 판단된 경우,
     해당 페이지로 다시 요청을 보낸다.

## -D, —dump-header <file name>
     응답 헤더를 특정 파일에 저장할 수 있다.
     헤더에서 쿠키 등을 저장했다가 다음 요청에 쓰는 용도로 활용할 수 있다. 
    (-b, —cookie 옵션)

     다만, 쿠키를 저장해서 활용하는 용도라면 이것보단 
        -c, —cookie-jar 옵션이 더 유용하다.

