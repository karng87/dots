# curl -G \
#     --data-urlencode "p1=value 1" \
#     --data-urlencode "p2=value 2" \
#     http://example.com
#     # http://example.com?p1=value%201&p2=value%202

# sed url escaping
s:%:%25:g
s: :%20:g
s:<:%3C:g
s:>:%3E:g
s:#:%23:g
s:{:%7B:g
s:}:%7D:g
s:|:%7C:g
s:\\:%5C:g
s:\^:%5E:g
s:~:%7E:g
s:\[:%5B:g
s:\]:%5D:g
s:`:%60:g
s:;:%3B:g
s:/:%2F:g
s:?:%3F:g
s^:^%3A^g
s:@:%40:g
s:=:%3D:g
s:&:%26:g
s:\$:%24:g
s:\!:%21:g
s:\*:%2A:g
