$ORIGIN example.com.
$TTL 1800
@       IN      SOA     ns1.example.com.      admin.example.com. (
                        2018121901              ; serial number
                        3600                    ; refresh
                        900                     ; retry
                        1209600                 ; expire
                        1800                    ; ttl
                        )
; Name servers
                    IN      NS      ns1.example.com.
                    IN      NS      ns2.example.com.

; A records for name servers
ns1                 IN      A       192.0.2.1
ns2                 IN      A       192.0.2.2

; Additional A records
@                   IN      A       192.0.2.3
www                 IN      A       192.0.2.3
