@AbapCatalog.sqlViewName: 'ZIBP2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Basic view for master data of business partner'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDSJAS02_I_BP
  as select from ztljas02_bp
{
  key bp_id        as Bpid,
      bp_role      as BpRole,
      company_name as CompanyName,
      street       as Street,
      city         as City,
      country      as Country,
      region       as Region

}
