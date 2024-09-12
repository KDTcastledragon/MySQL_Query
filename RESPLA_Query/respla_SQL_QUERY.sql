select * from user_purchased_product order by purchase_date;
select * from usage_history ;
select * from seats where occupied = true;
select * from seats where id = 'c';

select * from product;
select * from usage_history where id='b';

delete from product where dayvalue = 80;

SELECT uh.uhcode, uh.id, uh.usedatetime, uh.seatnum, uh.actiontype, uh.uppcode,
		upp.ptype, upp.initialtimevalue, upp.initialdayvalue
		FROM usagehistory uh
		LEFT JOIN userpurchasedproduct upp ON uh.uppcode = upp.uppcode
		WHERE uh.id = 'b';
