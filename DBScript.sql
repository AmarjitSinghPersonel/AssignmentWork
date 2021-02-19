drop table [tbl_user]
create table [tbl_user] (Id int not null identity(1,1) primary key,
					first_name varchar(200) not null,
					family_name varchar(200) not null,					
					email nvarchar(500) not null,
					[password] nvarchar(200) not null,
					[address] nvarchar(100) not null,
					[country] varchar(15) not null,
					[state] varchar(15) not null,
					postal_code nvarchar(10) not null)

CREATE UNIQUE INDEX uidx_email
ON [tbl_user] (email);