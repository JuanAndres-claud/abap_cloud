CLASS zcl_jas_sqlscript DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_amdp_marker_hdb.


  CLASS-METHODS getproddata
            IMPORTING
                value(p_id) type ZJASDE_02_DE_id
            EXPORTING
            value(ev_price) type f
            value(ev_price_dis) type f.



   class-METHODS getorders for table function ZSDJAS_TF_CDS.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_jas_sqlscript IMPLEMENTATION.

    METHOD getorders BY DATABASE function FOR HDB
            LANGUAGE SQLSCRIPT OPTIONS READ-ONLY using
            zTLJAS02_so zTLJAS02_so_i zTLJAS02_product.
           lt_orders = select hdr.client , hdr.order_no, item.amount,
                              ( item.amount * ( 100 - prod.discount ) / 100 ) as amount_dis
                              from     zTLJAS02_so as hdr
                              inner join zTLJAS02_so_i as item
                               on hdr.order_id = item.order_id
                              inner join zTLJAS02_product as prod
                                on item.product = prod.product_id where hdr.client = :p_clnt;

           return select client, order_no, sum( amount ) as gross_amount,
                                sum( amount_dis ) as gross_dis_amount from  :lt_orders
                                group by  client, order_no;

    ENDmethod.



    METHOD getproddata BY DATABASE PROCEDURE FOR HDB
            LANGUAGE SQLSCRIPT OPTIONS READ-ONLY using ZTLJAS02_product.

        DECLARE lv_price, lv_discount DOUBLE;

        SELECT price, discount into lv_price, lv_discount
             from ZTLJAS02_product where product_id = :p_id;

        ev_price =      lv_price;
        ev_price_dis = ( lv_price * ( 100 - lv_discount ) / 100 );

    ENDMETHOD.

ENDCLASS.
