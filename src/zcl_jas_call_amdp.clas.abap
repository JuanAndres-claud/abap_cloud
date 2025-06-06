CLASS zcl_jas_call_amdp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_jas_call_amdp IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: lv_price     TYPE f,
          lv_price_dis TYPE f.

    TRY.
        zcl_JAS_sqlscript=>getproddata(
          EXPORTING
* p_id will be different in different systems, get the product ID number from ZUDEMY01_PRODUCT table and paste it in the next line
            p_id         = '4A38FDC07EF31FD085AF7A70EAE42D4A'
          IMPORTING
            ev_price     = lv_price
            ev_price_dis = lv_price_dis
        ).
      CATCH cx_amdp_execution_failed INTO DATA(lo_ex).
        DATA(lv_msg) = lo_ex->get_text(  ).
        out->write(
          EXPORTING
            data   = lv_msg
*                name   =
*              RECEIVING
*                output =
        ).
    ENDTRY.

    out->write(
      EXPORTING
        data   = | 'Your discounted and actual price is ' { lv_price_dis } { lv_price } |
*            name   =
*          RECEIVING
*            output =
    ).
  ENDMETHOD.

ENDCLASS.
