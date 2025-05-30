CLASS zjas02_fill_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
* declara metodo principal, se ejecuta al iniciar el programa.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

* metodos locales
  PRIVATE SECTION.
    METHODS fill_master_data.
    METHODS  flush.
    METHODS fill_transaction_data.
ENDCLASS.



CLASS ZJAS02_FILL_DATA IMPLEMENTATION.


  METHOD fill_master_data.
    DATA: lt_bp   TYPE TABLE OF ztlJAS02_bp,
          lt_prod TYPE TABLE OF ztlJAS02_product.

* inserta registros en tabla it_bp
    APPEND VALUE #(
                bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                bp_role = '01'
                company_name = 'TACUM'
                street = 'Victoria Street'
                city = 'Kolkatta'
                country = 'IN'
                region = 'APJ'
                )
                TO lt_bp.

* inserta registro en tabla  lt_bp
    APPEND VALUE #(
                    bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    bp_role = '01'
                    company_name = 'SAP'
                    street = 'Rosvelt Street Road'
                    city = 'Walldorf'
                    country = 'DE'
                    region = 'EMEA'
                    )
                    TO lt_bp.

    APPEND VALUE #(
                    bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    bp_role = '01'
                    company_name = 'Asia High tech'
                    street = '1-7-2 Otemachi'
                    city = 'Tokyo'
                    country = 'JP'
                    region = 'APJ'
                    )
                    TO lt_bp.

    APPEND VALUE #(
                        bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                        bp_role = '01'
                        company_name = 'AVANTEL'
                        street = 'Bosque de Duraznos'
                        city = 'Maxico'
                        country = 'MX'
                        region = 'NA'
                        )
                        TO lt_bp.

    APPEND VALUE #(
                        bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                        bp_role = '01'
                        company_name = 'Pear Computing Services'
                        street = 'Dunwoody Xing'
                        city = 'Atlanta, Georgia'
                        country = 'US'
                        region = 'NA'
                        )
                        TO lt_bp.


    APPEND VALUE #(
                        bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                        bp_role = '01'
                        company_name = 'PicoBit'
                        street = 'Fith Avenue'
                        city = 'New York City'
                        country = 'US'
                        region = 'NA'
                        )
                        TO lt_bp.

    APPEND VALUE #(
                        bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                        bp_role = '01'
                        company_name = 'TACUM'
                        street = 'Victoria Street'
                        city = 'Kolkatta'
                        country = 'IN'
                        region = 'APJ'
                        )
                        TO lt_bp.

    APPEND VALUE #(
                        bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                        bp_role = '01'
                        company_name = 'Indian IT Trading Company'
                        street = 'Nariman Point'
                        city = 'Mumbai'
                        country = 'IN'
                        region = 'APJ'
                        )
                        TO lt_bp.

    APPEND VALUE #(
                     product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                     name = 'Blaster Extreme'
                     category = 'Speakers'
                     price = 175
                     currency = 'INR'
                     discount = 3
                     )
                     TO lt_prod.

    APPEND VALUE #(
                        product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                        name = 'Sound Booster'
                        category = 'Speakers'
                        price = 250
                        currency = 'INR'
                        discount = 2
                        )
                        TO lt_prod.

    APPEND VALUE #(
                        product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                        name = 'Smart Office'
                        category = 'Software'
                        price = 154
                        currency = 'INR'
                        discount = 32
                        )
                        TO lt_prod.

    APPEND VALUE #(
                        product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                        name = 'Smart Design'
                        category = 'Software'
                        price = 240
                        currency = 'INR'
                        discount = 12
                        )
                        TO lt_prod.

    APPEND VALUE #(
                        product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                        name = 'Transcend Carry pocket'
                        category = 'PCs'
                        price = 140
                        currency = 'INR'
                        discount = 7
                        )
                        TO lt_prod.

    APPEND VALUE #(
                        product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                        name = 'Gaming Monster Pro'
                        category = 'PCs'
                        price = 155
                        currency = 'INR'
                        discount = 8
                        )
                        TO lt_prod.



* inserta registros en tablas
    INSERT ztljas02_bp      FROM TABLE @lt_bp.
    INSERT ztljas02_product FROM TABLE @lt_prod.

  ENDMETHOD.


  METHOD fill_transaction_data.
* Define variables locales.
    DATA: o_rand    TYPE REF TO cl_abap_random_int,
          n         TYPE i,
          seed      TYPE i,
          lv_date   TYPE timestamp,
          lv_ord_id TYPE zudemy_01_de_id,
          lt_so     TYPE TABLE OF ztlJAS02_so,
          lt_so_i   TYPE TABLE OF ztljas02_so_i.

    seed = cl_abap_random=>seed( ).

    cl_abap_random_int=>create(
            EXPORTING
                seed = seed
                min  = 1
                max  = 7
              RECEIVING
                prng = o_rand
            ).

    GET TIME STAMP FIELD lv_date.

*Obtiene datos de tablas.
    SELECT * FROM ztljas02_bp INTO TABLE @DATA(lt_bp).
    SELECT * FROM ztljas02_product INTO TABLE @DATA(lt_prod).

**Lee 10 ciclos
    DO 10 TIMES.

* clave unica de longitud 32
      lv_ord_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32(  ).

* Numero Random
      n = o_rand->get_next( ).

* Lee tabla interna BP por numero de registro (n - numero random).
      READ TABLE lt_bp INTO DATA(ls_bp) INDEX n.

* Graba registro en tabla interna
      APPEND VALUE #( order_id = lv_ord_id
                                  order_no = sy-index
                                  buyer = ls_bp-bp_id
                                  gross_amount = n * 100
                                  currency = 'INR'
                                  created_by = sy-uname
                                  created_on = lv_date
                                  changed_by = sy-uname
                                  changed_on = lv_date
                               )  TO lt_so.

* graba dos registros en tabla interna lt_so_i
      DO 2 TIMES.

* lee registro de tabla lt_prod por indice n
        READ TABLE lt_prod INTO DATA(ls_product) INDEX n.
* Calcula numero random y dejalo en n para la lectura
        n = o_rand->get_next( ).

* graba registro en tabla lt_so_i.
        APPEND VALUE #( order_id = lv_ord_id
                    item_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32(  )
                    product = ls_product-product_id
                    qty = n
                    uom = 'PC'
                    amount = n * ls_product-price
                    currency = 'INR'
                    created_by = sy-uname
                    created_on = lv_date
                    changed_by = sy-uname
                    changed_on = lv_date
                 )  TO lt_so_i.

      ENDDO.
    ENDDO.

* Inserta registros en tabla
    INSERT zTLJAS02_so   FROM TABLE @lt_so.
    INSERT ztlJAS02_so_i FROM TABLE @lt_so_i.

  ENDMETHOD.


  METHOD flush.
* borra registros de tablas.
    DELETE FROM: ztljas02_bp, ztljas02_product, ztljas02_so, ztljas02_so_i.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
* Principal
    me->flush( ).
    me->fill_master_data( ).
    me->fill_transaction_data(  ).
    out->write( 'execution completed, check the data in tables' ).
  ENDMETHOD.
ENDCLASS.
