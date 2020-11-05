create or replace view sitterList as 
select P.pic, P.detailType, T.location2, T.wtime, T.price
from pet P, tradeboard T
where P.id = T.seller;