CLASS lhc_ZCDS02_C_U_TRAVEL DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zcds02_c_u_travel RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zcds02_c_u_travel.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zcds02_c_u_travel.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zcds02_c_u_travel.

    METHODS read FOR READ
      IMPORTING keys FOR READ zcds02_c_u_travel RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zcds02_c_u_travel.

    METHODS map_data IMPORTING im_data            TYPE zcds02_c_u_travel
                     RETURNING VALUE(r_bapi_data) TYPE /dmo/s_travel_in.

ENDCLASS.

CLASS lhc_ZCDS02_C_U_TRAVEL IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.

     DATA: ls_travel_in TYPE /dmo/s_travel_in,
           ls_travel_out TYPE /dmo/travel,
           lt_messages TYPE /dmo/t_message.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fs_travel_create>).
        ls_travel_in = map_data( im_data = CORRESPONDING #( <fs_travel_create> ) ).

        CALL FUNCTION '/DMO/FLIGHT_TRAVEL_CREATE'
          EXPORTING
            is_travel             = ls_travel_in
          IMPORTING
            es_travel             = ls_travel_out
            et_messages           = lt_messages
          .
          IF lt_messages is INITIAL.
            INSERT VALUE #( %cid = <fs_travel_create>-%cid
                            travelid = ls_travel_out-travel_id )
                          INTO TABLE mapped-zcds02_c_u_travel.
          else.
            LOOP AT lt_messages TRANSPORTING NO FIELDS WHERE msgty = 'E' or msgty = 'A'.
                INSERT VALUE #( %cid = <fs_travel_create>-%cid ) INTO TABLE failed-zcds02_c_u_travel.
                RETURN.
            ENDLOOP.
          endif.
    ENDLOOP.

  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD map_data.

    r_bapi_data-agency_id = im_data-AgencyId .
    r_bapi_data-begin_date = im_data-BeginDate .
    r_bapi_data-booking_fee = im_data-BookingFee .
    r_bapi_data-currency_code = im_data-CurrencyCode .
    r_bapi_data-customer_id = im_data-CustomerId .
    r_bapi_data-description = im_data-Description .
    r_bapi_data-end_date = im_data-EndDate .
    r_bapi_data-status = 'N' .
    r_bapi_data-total_price = im_data-TotalPrice .

  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZCDS02_C_U_TRAVEL DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZCDS02_C_U_TRAVEL IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
     call FUNCTION '/DMO/FLIGHT_TRAVEL_SAVE'.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
