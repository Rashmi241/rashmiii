BIGIN{
byte_recvd=0;
throughput=0;
}
{
pkt_size=$6;
if($2>1 && $2<5)
{
if($1 =="r" && $5=="cbr")
{
byte_recvd=byte_recvd+pkt_size;
}
}
}
END{
throughput=byte_recvd/(4*60);
printf("throghput is %f kbps",throughput/1024);
}
