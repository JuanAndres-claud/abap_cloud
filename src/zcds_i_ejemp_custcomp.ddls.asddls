@AbapCatalog.sqlViewName: 'ZEJEMP_2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer compani'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDS_I_EJEMP_CUSTCOMP as select from I_Currency
{
key Currency,
Decimals,
CurrencyISOCode,
AlternativeCurrencyKey,
IsPrimaryCurrencyForISOCrcy,
/* Associations */
_Text

}
