--유저 생성 및 권한 부여
conn system
password: oracle

create user mongde identified by 1234;
grant connect, resource, create sequence to mongde;
 
