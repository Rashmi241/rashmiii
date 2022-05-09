BIGIN{
count=0;
sent1=0;
sent2=0
received=0;
}
{
if($1=="d")
{
count++;
}
else if($1=="+" && $3==1 && $4==2)
{
sent1++;
}
else if($1=="+" && $3==1 && $4==2)
{
sent2++
}
else if($1=="r" && $3==2 && $4==3)
{
received++
}
}
END{
printf("\nNumber of packet dropped is:%d\n",count);
printf"\n the packet from source node1:%d\n",sent1;
printf"\n the packet from source node2:%d\n",sent2;
printf"\n the packet Received:%d\n",sent=sent1+sent2;
printf"\n the packet Delivery RAtio:%2f\n",(received/sent)*100;
}
