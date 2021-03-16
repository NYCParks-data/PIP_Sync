/***********************************************************************************************************************
																													   	
 Created By: Dan Gallagher, daniel.gallagher@parks.nyc.gov, Innovation & Performance Management         											   
 Modified By: <Modifier Name>																						   			          
 Created Date:  <MM/DD/YYYY>																							   
 Modified Date: <MM/DD/YYYY>																							   
											       																	   
 Project: <Project Name>	
 																							   
 Tables Used: <Database>.<Schema>.<Table Name1>																							   
 			  <Database>.<Schema>.<Table Name2>																								   
 			  <Database>.<Schema>.<Table Name3>				
			  																				   
 Description: <Lorem ipsum dolor sit amet, legimus molestiae philosophia ex cum, omnium voluptua evertitur nec ea.     
	       Ut has tota ullamcorper, vis at aeque omnium. Est sint purto at, verear inimicus at has. Ad sed dicat       
	       iudicabit. Has ut eros tation theophrastus, et eam natum vocent detracto, purto impedit appellantur te	   
	       vis. His ad sonet probatus torquatos, ut vim tempor vidisse deleniti.>  									   
																													   												
***********************************************************************************************************************/
use accessnewpip
go
--drop trigger dbo.trg_fi_tbl_ref_allsites
create trigger dbo.trg_fu_tbl_ref_allsites
on accessnewpip.dbo.tbl_ref_allsites
for update as
	begin transaction
		insert into accessnewpip.dbo.tbl_ref_allsites_audit(propnum,
															[prop id],
															boro,
															ampsdistrict,
															[prop name],
															[site name],
															[prop location],
															[site location],
															jurisdiction,
															typecategory,
															acres,
															gisobjid, 
															sourcefc)
			select propnum,
				   [prop id],
				   boro,
				   ampsdistrict,
				   [prop name],
				   [site name],
				   [prop location],
				   [site location],
				   jurisdiction,
				   typecategory,
				   acres,
				   gisobjid, 
				   sourcefc
			/*Use the record from the deleted table which represents the previous values for a given record*/
			from deleted
	commit;