CLASS lhc_ZI_TRAVEL_03 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS setTravelID FOR DETERMINE ON MODIFY
      IMPORTING keys FOR zi_travel_03~setTravelID.

ENDCLASS.

CLASS lhc_ZI_TRAVEL_03 IMPLEMENTATION.

  METHOD setTravelID.


      DATA lv_max_id TYPE ZTRAVEL_03-travelid.
      DATA lv_new_number TYPE i.
      DATA lv_travel_id TYPE ZTRAVEL_03-travelid.

      " Obtener el último travel_id generado
      SELECT MAX( travelid )
      FROM ztravel_03
      WHERE travelid LIKE 'VIA-%'
      INTO @lv_max_id .

      " Extraer el número del último travel_id
    IF lv_max_id IS NOT INITIAL.
      DATA(lv_last_number_str) = lv_max_id+4. " Extrae la parte numérica después de 'VIA-'
      lv_new_number = CONV i( lv_last_number_str ) + 1.

    ELSE.
      lv_new_number = 1.
    ENDIF.

 " Generar nuevo travel_id
   LOOP AT keys INTO DATA(key).
          lv_travel_id = |VIA-{ lv_new_number }|.

          " Asegurar que el ID no exceda 20 caracteres
          lv_travel_id = lv_travel_id+0(20).

         " Asignar el nuevo travel_id al registro
          MODIFY ENTITIES OF zi_travel_03 IN LOCAL MODE
            ENTITY zi_travel_03
            UPDATE FIELDS ( travelid )
            WITH VALUE #( ( %key = key %data = VALUE #( travelid = lv_travel_id ) ) ).

          " Incrementar el número para el siguiente ID
          ADD 1 TO lv_new_number.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
