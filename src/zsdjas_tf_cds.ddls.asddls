@EndUserText.label: 'TABLE FUNCTION DEMO'
define table function ZSDJAS_TF_CDS
with parameters 
@Environment.systemField: #CLIENT
p_clnt : abap.clnt
returns {
  client : abap.clnt;
  order_no : abap.int4;
  gross_amount: abap.int4;
  gross_dis_amount: abap.int4;
}
implemented by method zcl_jas_sqlscript=>getorders;