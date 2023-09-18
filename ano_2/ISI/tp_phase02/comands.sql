
-- a)
begin;
alter table TIPOVEICULO drop constraint tipoveiculo_designacao_check;
alter table TIPOVEICULO add constraint tipoveiculo_designacao_check check (
	designacao like '%Luxo%' or designacao like '%Normal%' or designacao like '%XL%' or designacao like '%Premium%'
);
insert into TIPOVEICULO values (4, 4, 4, 'Premium') if not exists;
commit;

-- b)
begin;
update VEICULO
set tipo = 4 
where marca like '%RangeRover%';
commit;


rollback;